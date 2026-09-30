# Snake Demo: Enterprise Cloud-Native Platform & Observability Playground 🚀

A production-ready, enterprise-grade reference architecture demonstrating advanced SRE practices, GitOps, multi-cloud observability, and automated onboarding workflows.

> ⚠️ **This is a public reference architecture overview.**
> Full implementation including Helm charts, Ansible playbooks, and operational runbooks is available for review during the interview process.
> *Source available upon request.*

---

## 🏗️ Architecture Overview

```
┌─────────────┐
│   Browser   │ ← Snake Game (Modern UI)
└──────┬──────┘
       │
┌──────▼──────────┐
│   Nginx LB      │ ← Load Balancer (least_conn)
└──────┬──────────┘
       │
  ┌────┴────┬─────────┬────────┐
  │         │         │        │
┌─▼───┐  ┌──▼───┐ ┌──▼───┐ ┌──▼───┐
│ALPHA│  │ BETA │ │GAMMA │ │DELTA │ ← 4 Backend Instances
└──┬──┘  └──┬───┘ └──┬───┘ └──┬───┘
   │         │        │        │
   └─────────┴───┬────┴────────┘
                 │
        ┌────────▼─────────┐
        │  OTel Collector  │ ← Telemetry Hub
        └────────┬─────────┘
                 │
        ┌────────▼─────────┐
        │    Prometheus    │ ← Metrics Storage
        └────────┬─────────┘
                 │
        ┌────────▼─────────┐
        │  Thanos Sidecar  │ ← Upload to Object Storage
        └────────┬─────────┘
                 │
        ┌────────▼─────────┐
        │ Object Storage   │ ← MinIO / S3 / GCS / Azure
        └────────┬─────────┘
                 │
        ┌────────▼─────────┐
        │  Thanos Query    │ ← Unified Query Interface
        └────────┬─────────┘
                 │
        ┌────────▼─────────┐
        │     Grafana      │ ← Visualization & Dashboards
        └──────────────────┘
```

---

## 🚀 DevSecOps Blueprint

---

## 🌟 Core Stack & Architecture

- **Platform & Orchestration:** Kubernetes (K3s/Kind/EKS/AKS), Helm (Dev/Staging/Prod hierarchy), ArgoCD (GitOps)
- **Observability (SRE-grade):** Prometheus & Thanos (long-term metrics storage & downsampling), Loki (logs), Tempo (distributed traces), OpenTelemetry (auto-instrumentation)
- **Security & Authentication:** Keycloak (OIDC/OAuth2 centralized SSO), External Secrets / Vault integration, Network Policies
- **Resiliency & FinOps:** Chaos Mesh (chaos engineering), Kubecost (cost optimization), HPA (Horizontal Pod Autoscaler)

---

## 🛡️ DevSecOps Security & Compliance Pipeline

*Automated "Shift-Left" security architecture integrating static analysis, container scanning, AI-driven code reviews, and automated remediation loops:*

```
Code Push
    │
    ▼
GitHub Actions
    │
    ├──► CodeQL AI Scan
    ├──► Snyk Analysis
    ├──► Semgrep Scan
    ├──► Trivy Scan
    └──► OpenAI Review
              │
              ▼
      Security Dashboard
              │
              ▼
      Critical Issues?
       ┌──────┴──────┐
      Yes            No
       │              │
       ▼              ▼
  Block Deploy      Deploy
       │
       ▼
  Auto-Fix PR
```

---

## ⚡ Quick Start

> 🔒 Full source code and Helm charts are available upon request during the interview process.

### Overview of deployment flow

```bash
# 1. Clone repository (available upon request)
git clone <source-upon-request>
cd snake-demo

# 2. Install with Helm (Development Profile)
helm upgrade --install snake-demo ./helm/snake-demo \
  --create-namespace \
  -n snake-demo-dev \
  -f ./helm/snake-demo/values-dev.yaml

# 3. Access Dashboards
./scripts/start-dashboards.sh
```

---

## 📚 Documentation & Operations Playbooks

This project emphasizes team collaboration and operational excellence through version-controlled playbooks.

> 🔒 Full documentation is available for review during the interview process.

| Dokumentti | Kuvaus |
|---|---|
| 📖 **Full Deployment & Onboarding Plan** | Step-by-step 18-stage guide designed for junior and senior engineers alike |
| 🛠 **Production Operations Playbook** | Day-2 operations, scaling, rollbacks, and troubleshooting |
| 🔍 **Advanced Observability Guide** | RUM, tracing, and Thanos configuration |
| 💥 **Chaos Engineering Guide** | Resilience testing with Chaos Mesh |
| 💰 **FinOps Guide** | Cost monitoring and optimization |

---

## 💡 Engineering Culture & Methodology

Built with strong team spirit and shared responsibility:

- **Cross-Read Documentation:** Core deployment plans are version-controlled, living documents requiring team alignment
- **Automated Health Validation:** Built-in validation scripts (`health-check.sh`) ensuring deterministic deployments from dev to production
- **AI-Assisted Development:** Blueprint developed with GitHub Copilot assistance, demonstrating practical AI tooling in infrastructure work

---

## 📬 Contact & Availability

Interested in the full implementation or a walkthrough of the architecture?

**Tomi Liimatainen**
Senior Infrastructure & SRE Specialist | Helsinki Metropolitan Area
[LinkedIn](https://www.linkedin.com/in/liimatainen-tomi/) | Available for interviews and technical deep-dives
