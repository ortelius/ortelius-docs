---
title: "How Ortelius Objects Relate"
linkTitle: "How Ortelius Objects Relate"
weight: 10
type: guides
description: >
  Why Ortelius uses a hub-and-spoke graph instead of connecting CVEs directly to SBOMs.
---

## The Problem: Graph Explosion

The naive approach to connecting vulnerability data with software inventory is to draw a direct edge from every CVE to every SBOM that contains the affected package. This creates an N×M edge problem:

```mermaid
graph LR
    subgraph CVEs["1,000 CVEs"]
        C1[CVE-1] & C2[CVE-2] & C3[CVE-3]
    end
    subgraph SBOMs["10,000 SBOMs"]
        S1[SBOM-1] & S2[SBOM-2] & S3[SBOM-3] & S4[...]
    end

    C1 -.-> S1 & S2 & S3 & S4
    C2 -.-> S1 & S2 & S3 & S4
    C3 -.-> S1 & S2 & S3 & S4

    COST["⚠️ 10,000,000 edges\n~500 MB metadata\nO(M) scan per query"]

    style COST fill:#ffcdd2,stroke:#c62828
```

At scale this creates three compounding problems: **storage** (millions of edges with duplicate metadata), **write amplification** (adding one new CVE requires creating thousands of edges), and **query performance** (finding all SBOMs for a CVE requires scanning the entire edge set).

## The Solution: PURL Hub Nodes

Instead of connecting CVEs directly to SBOMs, Ortelius inserts a version-free **PURL hub node** for each unique package. CVEs connect to the hub; SBOMs connect to the hub. Version information lives on the edges, not the nodes.

```mermaid
graph TB
    subgraph CVEs["CVE Nodes"]
        C1["⚠️ CVE-2024-1234\nlodash < 4.17.21\nCRITICAL 9.8"]
        C2["⚠️ CVE-2023-5678\nlodash >= 4.0 < 4.17.19\nHIGH 7.5"]
    end

    subgraph Hub["PURL Hub  (version-free)"]
        H["🔵 pkg:npm/lodash\nNO VERSION"]
    end

    subgraph SBOMs["SBOM Nodes"]
        S1["📄 payment-service 2.1.0\nedge → version: 4.17.20"]
        S2["📄 frontend 1.3.0\nedge → version: 4.17.18"]
        S3["📄 api-gateway 0.9.0\nedge → version: 4.18.0"]
    end

    subgraph Materialized["Materialized Edges  (pre-computed at ingest)"]
        R1["📦 payment-service_2.1.0 ──► CVE-2024-1234"]
        R2["📦 frontend_1.3.0 ──► CVE-2024-1234"]
        R3["📦 frontend_1.3.0 ──► CVE-2023-5678"]
    end

    C1 -->|"cve2purl"| H
    C2 -->|"cve2purl"| H
    H -->|"sbom2purl · version: 4.17.20"| S1
    H -->|"sbom2purl · version: 4.17.18"| S2
    H -->|"sbom2purl · version: 4.18.0"| S3

    style H fill:#4dabf7,stroke:#1971c2,stroke-width:3px,color:#000
    style R1 fill:#c8e6c9,stroke:#388e3c,color:#000
    style R2 fill:#c8e6c9,stroke:#388e3c,color:#000
    style R3 fill:#c8e6c9,stroke:#388e3c,color:#000
```

**Three edge collections do the work:**

| Edge Collection | Direction       | What the edge carries                              |
|-----------------|------------------|-----------------------------------------------------|
| `cve2purl`      | CVE → PURL hub  | Affected version range from OSV                    |
| `sbom2purl`     | SBOM → PURL hub | Exact installed version; semver components         |
| `release2cve`   | Release → CVE   | Package PURL, version — **pre-computed at ingest** |

## Traditional vs Hub-and-Spoke

| Metric                             | Traditional (direct edges) | Hub-and-Spoke            |
|--------------------------------------|-----------------------------|----------------------------|
| Edge count (1K CVEs, 10K SBOMs)    | 10,000,000                 | ~501,000                 |
| Edge storage                       | ~500 MB                    | ~25 MB                   |
| Edge reduction                     | —                          | **99.89%**               |
| Query: CVE → all affected releases | O(M) scan ~30s             | O(K) hub traversal ~3s   |
| Query: release → all CVEs          | O(M) scan ~15s             | Materialized edge <500ms |
| Adding a new CVE                   | 10,000 edge writes         | 1 hub edge write         |

## Materialized `release2cve` Edges

Hub traversal is used once — at SBOM ingest time — to compute which CVEs affect each release. The results are stored as direct `release2cve` edges. All runtime vulnerability queries use these materialized edges rather than traversing the hub graph live.

```mermaid
sequenceDiagram
    participant API
    participant DB as ArangoDB
    participant Util as Version Matcher

    Note over API: POST /releases (SBOM ingest)

    API->>DB: Traverse: release → sbom → purl hubs → CVEs
    DB-->>API: Candidate (cve_id, package_purl, package_version, affected_ranges)

    loop For each candidate
        API->>Util: IsVersionAffected(package_version, affected_ranges)
        Util-->>API: true / false
    end

    API->>DB: Deduplicate by (cve_id, package_base_purl)
    API->>DB: Batch INSERT release2cve edges
    Note over DB: Old edges deleted first — full refresh on re-ingest

    Note over API: POST /graphql — runtime query
    API->>DB: FOR cve IN 1..1 OUTBOUND release release2cve
    DB-->>API: Results in <500ms
```

## Version Matching

Version matching runs at ingest time to decide which candidates become `release2cve` edges, and again at sync time to populate `cve_lifecycle` records (see [Sync Records](../sync-records/)). Both paths use the same `util.IsVersionAffected` function.

Ortelius uses **ecosystem-specific parsers** rather than a single generic semver parser because version schemes differ significantly across package ecosystems:

| Ecosystem                | Parser                         | Example version  |
|----------------------------|-----------------------------------|--------------------|
| npm                      | aquasecurity/go-npm-version    | `4.17.20`        |
| PyPI                     | aquasecurity/go-pep440-version | `2.3.0rc1`       |
| Maven, Go, NuGet, others | Masterminds/semver              | `1.2.3-SNAPSHOT` |
| Fallback                 | String comparison                | any              |

**Key rules that prevent false positives:**

- OSV uses `"0"` in the `introduced` field to mean "from the beginning of time." Ortelius treats this as `0.0.0`, not the literal string `"0"`.
- A range must have **both** a lower bound (`introduced`) **and** an upper bound (`fixed` or `last_affected`) to produce a match. Incomplete ranges return `false`. This prevents a misconfigured or partial OSV record from marking everything as vulnerable.
- Go stdlib versions carrying a `go` prefix (e.g., `go1.22.2`) have the prefix stripped before parsing.

## PURL Standardization

Hub keys must be identical whether they come from a CVE record (OSV data) or an SBOM component (CycloneDX data). Ortelius enforces this through a single function — `util.GetStandardBasePURL()` — that normalizes the ecosystem type and strips the version before generating the hub key.

The most important mapping is the Wolfi/Chainguard family, which OSV lists under ecosystem names that do not match the `apk` PURL type used by SBOM generators:

| OSV Ecosystem  | PURL type used for hub key |
|-----------------|-------------------------------|
| Alpine         | `apk`                      |
| Wolfi          | `apk`                      |
| Chainguard     | `apk`                      |
| Debian, Ubuntu | `deb`                      |
| All others     | lowercased ecosystem name  |

Without this normalization, a CVE for a Wolfi package would create a hub under `pkg:wolfi/...` while the SBOM component creates a hub under `pkg:apk/...` — and the two would never connect.

## Release Ingestion Model

### Deduplication

Releases are deduplicated by the composite key `(name, version, contentsha)` where `contentsha` is populated from `gitcommit` (preferred) or `dockersha`. Uploading the same release twice with the same git commit is a no-op. Uploading with a different git commit creates a new record, even if the name and version are identical — this handles build reproducibility cases.

### SBOM Processing Pipeline

On each `POST /api/v1/releases`:

1. Parse and normalize version into semver components
2. Derive `org` and `shortname` from the `name` field (`org/shortname` format)
3. Hash SBOM content (SHA256) for deduplication
4. Create or retrieve PURL hub nodes (batch upsert)
5. Create `sbom2purl` edges with version metadata
6. Traverse hub graph to find candidate CVEs
7. Validate each candidate with `util.IsVersionAffected` (ecosystem-specific parsers)
8. Batch-insert `release2cve` materialized edges

The same pipeline runs for releases ingested via Kafka (`release.sbom.created` events) — there is no divergence between the REST and event-driven paths. See the [REST API Reference](../rest-api-reference/) for the full endpoint and event schema.
