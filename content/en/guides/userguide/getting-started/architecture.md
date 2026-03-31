---
title: "Architecture Guide"
linkTitle: "Architecture Guide"
weight: 10
description: >
  Architecture Guide
---

# Architecture Guide

**Audience:** Platform engineers, infrastructure teams, and security reviewers deploying or evaluating PDVD on-premises.

---


## System Overview

```mermaid
graph TB
    subgraph External["External Services"]
        OSV[OSV.dev API<br/>CVE Database]
        GitHub[GitHub App<br/>Installation Token Flow]
        SMTP[SMTP Server<br/>Email Invitations]
        GitRepo[Git Repository<br/>rbac.yaml]
        Kafka[Kafka<br/>release-events topic]
    end

    subgraph API["API Layer (Go / Fiber v3)"]
        REST[REST API<br/>/api/v1/*]
        GQL[GraphQL API<br/>/api/v1/graphql]
        Auth[Auth Middleware<br/>JWT Validation + DB Lookup]
    end

    subgraph Services["Business Logic"]
        CVESvc[CVE Ingestion<br/>OSV Matching]
        RBACsvc[RBAC Service<br/>Peribolos GitOps]
        LifeSvc[Lifecycle Service<br/>MTTR Tracking]
        SyncSvc[Sync Service<br/>Partial Sync Strategy]
        KafkaSvc[Kafka Processor<br/>release.sbom.created]
    end

    subgraph Data["Data Layer"]
        Arango[(ArangoDB<br/>Graph + Document)]
    end

    OSV -->|every 15 min| CVESvc
    GitHub -->|Installation Token| RBACsvc
    SMTP -->|Send Invites| RBACsvc
    GitRepo -->|Startup + Webhook| RBACsvc
    Kafka -->|Consume events| KafkaSvc

    REST & GQL --> Auth --> Services --> Arango
    KafkaSvc --> Services

    style API fill:#e3f2fd
    style Services fill:#f3e5f5
    style Data fill:#fff3e0
```

---

## Technology Stack

| Layer               | Technology                                            | Purpose                                        |
|---------------------|-------------------------------------------------------|------------------------------------------------|
| **API Framework**   | Fiber v3                                              | High-performance HTTP server                   |
| **GraphQL**         | graphql-go                                            | Query flexibility                              |
| **Database**        | ArangoDB 3.11+                                        | Graph + document store                         |
| **Auth**            | golang-jwt/jwt v5                                     | JWT generation/validation                      |
| **Password**        | bcrypt (DefaultCost)                                  | Password hashing                               |
| **CVE Data**        | OSV.dev API                                           | Vulnerability database, refreshed every 15 min |
| **CVSS**            | pandatix/go-cvss (3.1, 4.0)                           | Score calculation                              |
| **Git**             | go-git                                                | GitOps RBAC integration                        |
| **Email**           | net/smtp                                              | Invitation emails                              |
| **Kafka**           | segmentio/kafka-go                                    | Async event processing                         |
| **Version Parsing** | Masterminds/semver, go-npm-version, go-pep440-version | Ecosystem-specific version comparison          |

---

## Hub-and-Spoke Graph Design

### The Problem: Graph Explosion

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

### The Solution: PURL Hub Nodes

Instead of connecting CVEs directly to SBOMs, PDVD inserts a version-free **PURL hub node** for each unique package. CVEs connect to the hub; SBOMs connect to the hub. Version information lives on the edges, not the nodes.

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
|-----------------|-----------------|----------------------------------------------------|
| `cve2purl`      | CVE → PURL hub  | Affected version range from OSV                    |
| `sbom2purl`     | SBOM → PURL hub | Exact installed version; semver components         |
| `release2cve`   | Release → CVE   | Package PURL, version — **pre-computed at ingest** |

### Traditional vs Hub-and-Spoke

| Metric                             | Traditional (direct edges) | Hub-and-Spoke            |
|------------------------------------|----------------------------|--------------------------|
| Edge count (1K CVEs, 10K SBOMs)    | 10,000,000                 | ~501,000                 |
| Edge storage                       | ~500 MB                    | ~25 MB                   |
| Edge reduction                     | —                          | **99.89%**               |
| Query: CVE → all affected releases | O(M) scan ~30s             | O(K) hub traversal ~3s   |
| Query: release → all CVEs          | O(M) scan ~15s             | Materialized edge <500ms |
| Adding a new CVE                   | 10,000 edge writes         | 1 hub edge write         |

### Materialized `release2cve` Edges

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

### Version Matching

Version matching runs at ingest time to decide which candidates become `release2cve` edges, and again at sync time to populate `cve_lifecycle` records. Both paths use the same `util.IsVersionAffected` function.

PDVD uses **ecosystem-specific parsers** rather than a single generic semver parser because version schemes differ significantly across package ecosystems:

| Ecosystem                | Parser                         | Example version  |
|--------------------------|--------------------------------|------------------|
| npm                      | aquasecurity/go-npm-version    | `4.17.20`        |
| PyPI                     | aquasecurity/go-pep440-version | `2.3.0rc1`       |
| Maven, Go, NuGet, others | Masterminds/semver             | `1.2.3-SNAPSHOT` |
| Fallback                 | String comparison              | any              |

**Key rules that prevent false positives:**

- OSV uses `"0"` in the `introduced` field to mean "from the beginning of time." PDVD treats this as `0.0.0`, not the literal string `"0"`.
- A range must have **both** a lower bound (`introduced`) **and** an upper bound (`fixed` or `last_affected`) to produce a match. Incomplete ranges return `false`. This prevents a misconfigured or partial OSV record from marking everything as vulnerable.
- Go stdlib versions carrying a `go` prefix (e.g., `go1.22.2`) have the prefix stripped before parsing.

### PURL Standardization

Hub keys must be identical whether they come from a CVE record (OSV data) or an SBOM component (CycloneDX data). PDVD enforces this through a single function — `util.GetStandardBasePURL()` — that normalizes the ecosystem type and strips the version before generating the hub key.

The most important mapping is the Wolfi/Chainguard family, which OSV lists under ecosystem names that do not match the `apk` PURL type used by SBOM generators:

| OSV Ecosystem  | PURL type used for hub key |
|----------------|----------------------------|
| Alpine         | `apk`                      |
| Wolfi          | `apk`                      |
| Chainguard     | `apk`                      |
| Debian, Ubuntu | `deb`                      |
| All others     | lowercased ecosystem name  |

Without this normalization, a CVE for a Wolfi package would create a hub under `pkg:wolfi/...` while the SBOM component creates a hub under `pkg:apk/...` — and the two would never connect.

---

## Multi-Tenant RBAC Model

### Org Isolation

Every release, endpoint, and sync record carries an `org` field. Queries filter by the requesting user's `orgs[]` array. Users with an empty `orgs: []` array have **global access** — the pattern used for system administrators.

Org names are normalized to **lowercase** throughout the system. `display_name` preserves original casing for display purposes.

### Role Hierarchy

User role is stored on the user document and is the **highest role** the user holds across all org memberships.

```text
owner → admin → editor → viewer
```

| Role       | Key Permissions                               |
|------------|-----------------------------------------------|
| **owner**  | Full access + org deletion                    |
| **admin**  | Full access + user management                 |
| **editor** | Upload releases, upload SBOMs, sync endpoints |
| **viewer** | Read-only                                     |

### GitOps RBAC (Peribolos-style)

RBAC is defined in a YAML file (`rbac.yaml`) stored in a Git repository. The format separates identity (users block) from permissions (orgs block):

```yaml
orgs:
  - name: acme-corp
    display_name: ACME Corporation
    members:
      - username: alice
        role: owner
      - username: bob
        role: editor

users:
  - username: alice
    email: alice@acme.com
    auth_provider: local
  - username: bob
    email: bob@acme.com
    auth_provider: local
```

RBAC is applied at three points:

1. **Startup** — clones `RBAC_REPO` (or reads `RBAC_CONFIG_PATH`) and applies
2. **Webhook** — `POST /api/v1/rbac/webhook` triggers a fresh clone + apply
3. **Direct API** — `POST /api/v1/rbac/apply/content` (YAML body) or `POST /api/v1/rbac/apply/upload` (file upload)

Users not present in the YAML are set to `is_active: false, status: removed` on the next sync — they are not deleted.

> **Deployment prerequisite:** Signup requires `RBAC_REPO` and `RBAC_REPO_TOKEN` to be configured. If neither is set, the system falls back to `RBAC_CONFIG_PATH` (a local file path). If no RBAC source is configured, the signup endpoint returns a 500. Bootstrap the first admin user via `ADMIN_USERNAME` / `ADMIN_PASSWORD` environment variables instead.

---

## Authentication & Authorization Model

### JWT Design

The JWT payload contains **only the username**. Role and org memberships are **always fetched from the database** by the auth middleware on every request. This means role/org changes take effect immediately without requiring token re-issue.

```json
{
  "username": "alice",
  "sub": "alice",
  "iss": "pdvd-backend",
  "iat": 1704067200,
  "exp": 1704153600
}
```

Token lifetime: **24 hours**. Cookie: `HttpOnly; SameSite=Lax; MaxAge=86400`. Set `Secure: true` for production HTTPS.

### Middleware Variants

- **`RequireAuth(db)`** — validates JWT, fetches user from DB, blocks unauthenticated requests (401)
- **`OptionalAuth(db)`** — same lookup but allows unauthenticated requests through (used for GraphQL and release/sync endpoints)
- **`RequireRole(...roles)`** — checks role against allowed list (403 if denied)

The release and sync endpoints use `OptionalAuth` so that CI pipelines without a prior login session can still post data by passing credentials directly.

---

## CVE Lifecycle & Sync Strategy

### Lifecycle States

```mermaid
stateDiagram-v2
    [*] --> Detected: CVE found in SBOM at ingest
    Detected --> Active: Deployed to endpoint (sync)
    Active --> Superseded: New version synced for same release
    Superseded --> Active: Same version re-synced (resurrection)
    Active --> Remediated: Fixed version deployed
    Remediated --> [*]
```

### Partial Sync Strategy

`POST /api/v1/sync` uses a **partial sweep** model:

1. For each release in the payload, all existing lifecycle records for that `(endpoint, release)` pair are marked `is_remediated: true` with status `Superseded`
2. CVEs for the new version are fetched from `release2cve` materialized edges
3. Lifecycle records are created or resurrected for each CVE in the new version
4. Releases **not in the payload are untouched** — not removed

### Root Discovery Tracking

`root_introduced_at` tracks the earliest time a CVE was first seen for a given `(endpoint, release_name)` pair across version upgrades. MTTR is calculated as `remediated_at − root_introduced_at`, ensuring that upgrading from v1 to v2 without fixing a CVE doesn't reset the clock.

### `disclosed_after_deployment` Flag

Set to `true` when `cve.published > root_introduced_at`. These are CVEs that were not publicly known when the software was first deployed — the most operationally urgent category.

---

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

The same pipeline runs for releases ingested via Kafka (`release.sbom.created` events) — there is no divergence between the REST and event-driven paths.

---

## Dashboard Metrics Design

### MTTR Calculation

```text
MTTR = SUM(days_to_remediate) / COUNT(remediated CVEs in window)

days_to_remediate = DATE_DIFF(root_introduced_at, remediated_at, "d")
```

Rolling window defaults to **180 days** based on `remediated_at` date.

### SLA Targets

| Severity | Standard | `mission_asset` Endpoint |
|----------|----------|--------------------------|
| Critical | 15 days  | 7 days                   |
| High     | 30 days  | 15 days                  |
| Medium   | 90 days  | 90 days                  |
| Low      | 180 days | 180 days                 |

### Two-Phase Snapshot Query Pattern

Dashboard queries use a two-phase approach to avoid O(days × collections) scans:

1. **Phase 1** — resolve the latest active `(endpoint, release, version)` snapshot once
2. **Phase 2** — fetch all relevant lifecycle events in a single pass, then aggregate per day in-memory

This reduces database I/O from O(days × collections) to O(1 × collections).

---

## Deployment Architecture

### High-Availability Setup

```mermaid
graph TB
    LB[Load Balancer<br/>HTTPS:443] --> API1 & API2 & API3

    subgraph APICluster["API Cluster (3 replicas)"]
        API1[PDVD Pod 1]
        API2[PDVD Pod 2]
        API3[PDVD Pod 3]
    end

    subgraph Workers["Background Goroutines (per pod)"]
        K[Kafka Processor]
        R[RBAC Startup Sync]
        I[Invitation Cleanup — 1h interval]
        B[Admin Bootstrap — once]
    end

    subgraph DB["ArangoDB Cluster"]
        Lead[Leader] -.->|replication| F1[Follower 1] & F2[Follower 2]
    end

    API1 & API2 & API3 --> Lead
```

### Startup Sequence

1. `InitializeDatabase()` — connect with exponential backoff, create collections and indexes
2. `NewFiberApp(db)` — build GraphQL schema, register routes
3. Background goroutines: admin bootstrap, default roles, RBAC auto-apply, invitation cleanup
4. `app.Listen(":3000")` — begin serving requests
5. `kafka.RunEventProcessor()` — attempt Kafka connection (3 retries); non-fatal on failure, API continues without it

### Kubernetes

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: pdvd-api
  namespace: pdvd
spec:
  replicas: 3
  template:
    spec:
      containers:
      - name: api
        image: pdvd/backend:v2.0.0
        ports:
        - containerPort: 3000
        env:
        - name: ARANGO_HOST
          valueFrom:
            secretKeyRef:
              name: pdvd-secrets
              key: arango-host
        - name: JWT_SECRET
          valueFrom:
            secretKeyRef:
              name: pdvd-secrets
              key: jwt-secret
        resources:
          requests:
            cpu: 500m
            memory: 1Gi
          limits:
            cpu: 2000m
            memory: 4Gi
        livenessProbe:
          httpGet:
            path: /
            port: 3000
          initialDelaySeconds: 30
          periodSeconds: 10
```

---

## Security Considerations

### Key Design Decisions

- **Username-only JWT** — role and org data fetched from DB on every request; changes take effect immediately
- **Parameterized AQL** — all database queries use bind variables; no string interpolation
- **Org-scoped queries** — FILTER clauses on all multi-tenant queries; cross-org data leakage is not possible via the API
- **bcrypt DefaultCost** — all passwords hashed at cost factor 10
- **HttpOnly cookies** — XSS cannot read the auth token; set `Secure: true` for production

### TLS

ArangoDB connections use `InsecureSkipVerify: true` in the current transport config. Configure a proper CA certificate for production deployments.

### Rate Limiting

Rate limiting is on the roadmap and not yet implemented. Deploy behind a reverse proxy (nginx, Caddy, AWS ALB) with rate limiting enabled for production.

---

## Running Locally

```bash
# 1. Start ArangoDB
docker run -d \
  --name arangodb \
  -p 8529:8529 \
  -e ARANGO_ROOT_PASSWORD=password \
  arangodb:latest

# 2. Configure environment
export ARANGO_HOST=localhost
export ARANGO_PASS=password
export JWT_SECRET=local-dev-secret
export ADMIN_USERNAME=admin
export ADMIN_PASSWORD=changeme
export BASE_URL=http://localhost:3000

# 3. Run the backend
go run main.go

# 4. Verify
curl http://localhost:3000/
# {"status":"healthy"}
```

The admin user is bootstrapped automatically on first startup if no users exist. Log in at `POST /api/v1/auth/login` with the credentials from `ADMIN_USERNAME` / `ADMIN_PASSWORD`.

> **Signup without a Git repo:** The signup endpoint requires `RBAC_REPO` to be configured. For local development, create users directly via `POST /api/v1/users` (admin auth required) or set `RBAC_CONFIG_PATH` to a local `rbac.yaml` file.

---

## Optional Integrations

### GitHub App

The GitHub App integration allows users to connect their GitHub installation and onboard repos directly from the UI.

**Setup:**

1. Create a GitHub App at `https://github.com/settings/apps/new`
2. Set the callback URL to `<BASE_URL>/api/v1/auth/github/callback`
3. Required permissions: `Contents: Read`, `Actions: Read`
4. Generate and download a private key (PEM format)
5. Configure environment variables:

```bash
GITHUB_APP_ID=123456
GITHUB_APP_NAME=my-pdvd-app
GITHUB_CLIENT_ID=Iv1.abc123
GITHUB_CLIENT_SECRET=abc123...
GITHUB_PRIVATE_KEY="-----BEGIN RSA PRIVATE KEY-----\n..."
```

### Kafka

Kafka enables asynchronous release ingestion — CI pipelines publish events to the `release-events` topic instead of calling the REST API directly.

**Topic configuration:**

- Topic name: `release-events`
- Recommended: 3 partitions, 7-day retention
- Consumer group: `pdvd-backend-worker`

**Confluent Cloud (SASL/PLAIN + TLS):**

```bash
KAFKA_BROKERS=pkc-abc123.us-east-1.aws.confluent.cloud:9092
KAFKA_API_KEY=your-api-key
KAFKA_API_SECRET=your-api-secret
```

If `KAFKA_API_KEY` and `KAFKA_API_SECRET` are not set, the processor connects without SASL/TLS (local development mode).

Event schema: see [Implementation Guide](implementation.md#kafka-event-schema).

---

## Environment Variables Reference

| Variable               | Default                 | Required | Description                                      |
|------------------------|-------------------------|----------|--------------------------------------------------|
| `ARANGO_HOST`          | `localhost`             | Yes      | ArangoDB hostname                                |
| `ARANGO_PORT`          | `8529`                  | No       | ArangoDB port                                    |
| `ARANGO_USER`          | `root`                  | No       | ArangoDB username                                |
| `ARANGO_PASS`          | `mypassword`            | Yes      | ArangoDB password                                |
| `ARANGO_URL`           | derived                 | No       | Full URL — overrides host+port                   |
| `JWT_SECRET`           | hardcoded default       | **Yes**  | Change in production                             |
| `ADMIN_USERNAME`       | `admin`                 | No       | Bootstrap admin username                         |
| `ADMIN_PASSWORD`       | random                  | No       | Bootstrap admin password — log output if not set |
| `ADMIN_EMAIL`          | `admin@example.com`     | No       | Bootstrap admin email                            |
| `RBAC_REPO`            | —                       | No       | Git repo URL for RBAC config                     |
| `RBAC_REPO_TOKEN`      | —                       | No       | Git token for RBAC repo access                   |
| `RBAC_CONFIG_PATH`     | `/etc/pdvd/rbac.yaml`   | No       | Local file fallback if no RBAC_REPO              |
| `SMTP_HOST`            | `smtp.gmail.com`        | No       | SMTP server hostname                             |
| `SMTP_PORT`            | `587`                   | No       | SMTP port                                        |
| `SMTP_USERNAME`        | —                       | No       | SMTP auth username                               |
| `SMTP_PASSWORD`        | —                       | No       | SMTP auth password                               |
| `SMTP_FROM_EMAIL`      | `noreply@pdvd.com`      | No       | From address                                     |
| `SMTP_FROM_NAME`       | `PDVD System`           | No       | From display name                                |
| `BASE_URL`             | `http://localhost:3000` | No       | Used in invitation email links                   |
| `GITHUB_APP_ID`        | —                       | No       | GitHub App numeric ID                            |
| `GITHUB_APP_NAME`      | —                       | No       | GitHub App slug name                             |
| `GITHUB_CLIENT_ID`     | —                       | No       | GitHub OAuth client ID                           |
| `GITHUB_CLIENT_SECRET` | —                       | No       | GitHub OAuth client secret                       |
| `GITHUB_PRIVATE_KEY`   | —                       | No       | GitHub App RSA private key (PEM)                 |
| `KAFKA_BROKERS`        | `localhost:9092`        | No       | Comma-separated broker list                      |
| `KAFKA_API_KEY`        | —                       | No       | Enables SASL/PLAIN + TLS when set                |
| `KAFKA_API_SECRET`     | —                       | No       | SASL password                                    |
| `MS_PORT`              | `3000`                  | No       | HTTP listen port                                 |
