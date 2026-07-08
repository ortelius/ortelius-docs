---
title: "Ortelius Post Deployment Vulnerability Dashboard"
linkTitle: "Ortelius Post Deployment Vulnerability Dashboard"
weight: 4
---

Ortelius provides a production-grade security posture dashboard focused on **post-deployment** vulnerability management. Unlike traditional pre-deployment scanning, this system continuously monitors what's actually running in production environments and tracks remediation effectiveness over time.

---


## Quick Start: GitHub Integration

### Connecting Your Repositories

1. **Sign Up**: Click "Create New Account" on the login page and create an account with your organization details

   ![Create New Account Link](create-account.png)
2. **Activate Account**: Check your email for the activation link and set your password — this lands you on the **Welcome** page (`/welcome`)
3. **You already have data**: The Welcome page auto-adds a few popular public repos to your Favorites so there's real vulnerability data to explore immediately — no action needed for this step
4. **Connect GitHub** *(recommended, for your own repos)*:
   - On the Welcome page, click **Connect GitHub Account**
   - Authorize the Ortelius GitHub App and choose which repositories (public or private) to grant it access to
   - Back in Ortelius, check the boxes next to the repos you want and click **Import Selected**
5. **Or favorite a public repo by name** *(optional)*: search by name or `owner/repo` (GitHub or GitLab) and click **Add to Favorites** — useful for public repos you don't have GitHub access to yourself
6. **Configure Repository Access later**: to grant the GitHub App access to more repos after the fact, visit [GitHub Settings > Applications > Installed GitHub Apps](https://github.com/settings/installations), click **Configure** next to the Ortelius app, and adjust repository access
7. **View Your Data**: Click **Go to Organizations** at the bottom of the Welcome page — your tracked repos and their security posture appear in the Organizations and Dashboard views

> The Profile page also has a **GitHub Integration** panel for checking connection status and viewing which repos the App can currently see, but repo import/selection happens on the Welcome page, not Profile.

### What Gets Tracked

Connecting a repo (via GitHub App import or "favorite by name") creates release records — one per GitHub release tag — and, for successful GitHub Actions workflow runs, an endpoint + sync record so the release shows up as deployed. On its own, clicking through this UI flow **does not** give you vulnerability data immediately: no SBOM is attached at connect time, no OpenSSF Scorecard is fetched, and no container image is inspected as part of the click-through.

SBOM data (needed for vulnerability matching) reaches a release automatically, with no changes to your CI/CD pipeline, no CLI, and no direct API calls required: if your deployment runs the [`relscanner-job`](https://github.com/ortelius/relscanner-job) CronJob, it periodically scans every repo connected via the flows above (GitHub App installs, org-tracked repos, and public favorites) and attaches an SBOM via OCI attestations, Cosign, GitHub Release assets, or Syft/cdxgen generation, plus an OpenSSF Scorecard result. This typically runs on a 15-minute schedule, so give it a little time after connecting a repo. Ask whoever manages your Ortelius deployment whether `relscanner-job` is running.

Once SBOM data is present, Ortelius:
- Matches components against CVEs from the OSV.dev database (refreshed every 15 minutes)
- Tracks post-deployment vulnerability detection and remediation over time
- Surfaces compliance-ready metrics aligned with NIST frameworks

---

## Filter Capabilities

### Vulnerability Filters
- **Severity**: Critical, High, Medium, Low, Clean
- **OpenSSF Score**: High (8.0+), Medium (6.0-7.9), Low (<6.0)
- **Name/Package**: Text-based search
- **CVE ID**: Direct CVE lookup

### Endpoint Filters
- **Status**: Active, Inactive, Error
- **Environment**: Production, Staging, Development, Test
- **Endpoint Type**: Kubernetes, Docker, VM, Serverless

### Org Visibility
- **My Orgs**: Repos/releases under organizations you belong to
- **Public**: Publicly tracked repos, regardless of org membership

---

## Key Features

### 🏢 Multi-Organization Support
- Organization-level isolation and access control
- Role-based permissions (owner, admin, editor, viewer)
- Public and private repository tracking

### 🎯 Comprehensive Dashboard
- Executive-level security metrics
- MTTR (Mean Time To Remediate) tracking
- SLA compliance monitoring (Critical: 15d, High: 30d)
- Vulnerability trend analysis (180-day rolling window)
- NIST framework alignment (SP 800-53, 800-137, 800-190, 800-218)

### 🔍 Multi-Dimensional Views
- **Organizations**: Portfolio-level security overview
- **Dashboard**: Detailed posture analysis with compliance metrics
- **Synced Endpoints**: Where software is running (K8s, Docker, VMs)
- **Project Releases**: Vulnerability tracking by release version
- **Vulnerabilities**: CVE database with CVSS scoring
- **Mitigations**: Actionable remediation view of open vulnerabilities
- **Profile**: Account details, password change, and GitHub App connection status
- **Welcome**: First-run onboarding — connect GitHub, import repos, or favorite public repos by name
- **Signup / Invitation / Forgot Password**: Self-service account onboarding flows

### 🛡️ Security Intelligence
- OpenSSF Scorecard integration
- SBOM-based dependency analysis
- Severity-based prioritization (Critical, High, Medium, Low)
- Post-deployment detection tracking
- Remediation workflow support

### 📊 Export & Reporting
- SVG export for any dashboard component
- PDF export, including SBOM report generation
- Compliance-ready documentation
- Detailed vulnerability breakdowns
- Historical trend visualization

### 🎨 Modern UX
- Dark/Light theme support
- Responsive design (mobile, tablet, desktop)
- Real-time filtering and search
- Breadcrumb navigation
- Collapsible sidebar with filter persistence

---

## Key Metrics Explained

### MTTR (Mean Time To Remediate)
Average time from vulnerability detection to remediation, tracked separately for:
- All endpoint CVEs
- Post-deployment CVEs (detected after deployment)

### SLA Compliance
Percentage of vulnerabilities remediated within severity-based timeframes:
- Critical: 15 days
- High: 30 days
- Medium: 90 days
- Low: 180 days

### Post-Deployment CVEs
Vulnerabilities where the CVE disclosure date occurred **after** the release was deployed to production endpoints.

### Backlog Delta
Net change in open vulnerabilities (New CVEs - Fixed CVEs) over the rolling 180-day window.

---

## Compliance Frameworks

This dashboard is designed to support compliance with:

- **NIST SP 800-53 Rev. 5** - SI-2 (Flaw Remediation)
- **NIST SP 800-137** - Information Security Continuous Monitoring
- **NIST SP 800-190** - Application Container Security Guide
- **NIST SP 800-218** - Secure Software Development Framework (SSDF)
  - RV.1: Identify and Confirm Vulnerabilities
  - RV.2: Assess, Prioritize, and Remediate Vulnerabilities
- **Executive Order 14028** - Improving the Nation's Cybersecurity
- **DoD Continuous ATO** - DevSecOps Requirements

---

## Authentication & Authorization

### User Roles
- **Owner**: Full access, including organization deletion
- **Admin**: Full access plus user management
- **Editor**: Can upload releases, upload SBOMs, and sync endpoints
- **Viewer**: Read-only access to assigned organizations

### Authentication Flow
1. User registration with email verification (GitOps-backed invitation flow), or direct creation by an admin
2. Password-based login with session management (JWT cookie)
3. Optional SSO: "Sign in with Google" and "Sign in with GitHub" buttons, shown or hidden based on what the backend reports as configured (`GET /auth/status`)
4. Optional GitHub App connection (separate from GitHub sign-in) for repository onboarding, from the Welcome or Profile page

> **Note:** The "Forgot Password" flow (`/auth/forgot-password`) currently calls a backend stub that returns success without actually sending a reset email — password resets aren't functional yet end-to-end.

---

## Data Architecture

### Organization Hierarchy
```
Organization
  └── Releases (from GitHub or manual upload)
      ├── Endpoints (deployment targets)
      ├── Vulnerabilities (CVEs affecting the release)
      ├── SBOM (Software Bill of Materials)
      └── OpenSSF Scorecard
```

### GraphQL Schema
The frontend communicates with the backend via GraphQL queries for:
- Dashboard metrics and trends
- Release and endpoint inventories
- Vulnerability details and relationships
- User authentication and profile data

---

## Community & Contributing

We welcome contributions! Please see:
- GitHub Issues: [https://github.com/ortelius/frontend/issues](https://github.com/ortelius/frontend/issues)

> Note: this repo does not currently include a `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, or `LICENSE` file locally — don't assume these paths exist when linking to them; check the [ortelius org on GitHub](https://github.com/ortelius) for org-wide versions.

- Website: [https://ortelius.io](https://ortelius.io)
- GitHub: [https://github.com/ortelius](https://github.com/ortelius)
- Discord: [https://discord.gg/ortelius](https://discord.gg/ortelius)

---

## Developer Setup

### Related Repositories

- **Backend API**: [https://github.com/ortelius/ortelius](https://github.com/ortelius/ortelius)

### Local Development

1. **Clone the repository**:
```bash
git clone https://github.com/ortelius/frontend
cd frontend
```

2. **Install dependencies**:
```bash
npm install
```

3. **Configure environment**:
```bash
# No .env.example is checked into the repo — create .env.local yourself:
cat > .env.local << 'EOF'
RUNTIME_GRAPHQL_ENDPOINT=http://localhost:3000/api/v1/graphql
RUNTIME_REST_ENDPOINT=http://localhost:3000/api/v1
EOF
```

4. **Run development server**:
```bash
npm run dev
```

5. **Open browser**:
```
http://localhost:4000
```

### Environment Variables

```bash
# Backend API Configuration
RUNTIME_GRAPHQL_ENDPOINT=http://localhost:3000/api/v1/graphql
RUNTIME_REST_ENDPOINT=http://localhost:3000/api/v1
```

> `RUNTIME_GRAPHQL_ENDPOINT` and `RUNTIME_REST_ENDPOINT` are read server-side per-request via the `/config` route (not baked in at build time), so they can also be set at container start (e.g. `docker run -e RUNTIME_REST_ENDPOINT=...`) without rebuilding the image.

> **Note:** `lib/auth/factory.ts` (`createAuthProvider()` / `NEXT_PUBLIC_AUTH_PROVIDER`) exists in the codebase but is not actually wired up — `app/layout.tsx` uses `context/AuthContext.tsx`'s `AuthProvider` directly, which talks to the backend REST API and is not configurable via this factory. Setting `NEXT_PUBLIC_AUTH_PROVIDER` currently has no effect; treat the factory as unused scaffolding rather than a supported setting.

> GitHub App credentials (`GITHUB_CLIENT_ID`, `GITHUB_CLIENT_SECRET`, etc.) are configured on the **backend**, not the frontend — see the [backend repo's architecture guide](https://github.com/ortelius/ortelius/blob/main/docs/architecture.md#environment-variables-reference).

**SSO login buttons** ("Sign in with Google" / "Sign in with GitHub", shown on the login form) are rendered based on what `GET /auth/status` reports the backend has configured, and redirect straight to the backend's OAuth/OIDC routes. No frontend env vars are needed to enable them; configure `GITHUB_OAUTH_CLIENT_ID`/`GITHUB_OAUTH_CLIENT_SECRET` and `GOOGLE_OIDC_CLIENT_ID`/etc. on the **backend** instead. The backend's OIDC support is provider-agnostic (Authentik and Okta can be registered the same way as Google), but the frontend currently only renders buttons for Google and GitHub.

The dev server runs on port `4000` (`npm run dev`); the production server (`npm run start`) runs on port `8080`.

---

## License

Apache License 2.0. No `LICENSE` file is currently checked into this repo — see the [backend repo's LICENSE](https://github.com/ortelius/ortelius/blob/main/LICENSE) for the org's Apache 2.0 terms, or confirm with the maintainers before relying on this for compliance purposes.

---

## Acknowledgments

Maintained by the Ortelius open-source community with support from:
- Cloud Native Computing Foundation (CNCF)
- Continuous Delivery Foundation (CDF)
- OpenSSF (Open Source Security Foundation)

For security disclosures, please email: security@ortelius.io
