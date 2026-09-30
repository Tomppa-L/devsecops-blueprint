Snake Demo: Enterprise Cloud-Native Platform & Observability Playground 🚀

A production-ready, enterprise-grade reference architecture demonstrating advanced SRE practices, GitOps, multi-cloud observability, and automated onboarding workflows.

🏗️ Architecture Overview
```
┌─────────────┐
│   Browser   │ ← Snake Game (Modern UI)
└──────┬──────┘
       │
┌──────▼──────────┐
│   Nginx LB      │ ← Load Balancer (least_conn)
└───--───┬────────┘
         │
    ┌────┴────┬────────┬───-────┐
    │         │        │        │
┌───▼───┐  ┌──▼───┐ ┌──▼───┐ ┌──▼───┐
│ ALPHA │  │ BETA │ │GAMMA │ │DELTA │ ← 4 Backend Instances
└───┬───┘  └──┬───┘ └──┬───┘ └──┬───┘
    │         │        │        │
    └───────-─┴───┬──-─┴────────┘
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

# 🚀 DevSecOps Blueprint

---

## 🌟 Core Stack & Architecture

* **Platform & Orchestration:** Kubernetes (K3s/Kind/EKS/AKS), Helm (Dev/Staging/Prod hierarchy), ArgoCD (GitOps).
* **Observability (SRE-grade):** Prometheus & Thanos (long-term metrics storage & downsampling), Loki (logs), Tempo (distributed traces), OpenTelemetry (auto-instrumentation).
* **Security & Authentication:** Keycloak (OIDC/OAuth2 centralized SSO), External Secrets / Vault integration, Network Policies.
* **Resiliency & FinOps:** Chaos Mesh (chaos engineering), Kubecost (cost optimization), HPA (Horizontal Pod Autoscaler).

---

## 🛡️ DevSecOps Security & Compliance Pipeline

*Automated "Shift-Left" security architecture integrating static analysis, container scanning, AI-driven code reviews, and automated remediation loops:*

```mermaid
graph LR
    A[Code Push] --> B[GitHub Actions]
    B --> C1[CodeQL AI Scan]
    B --> C2[Snyk Analysis]
    B --> C3[Semgrep Scan]
    B --> C4[Trivy Scan]
    B --> C5[OpenAI Review]
    
    C1 --> D[Security Dashboard]
    C2 --> D
    C3 --> D
    C4 --> D
    C5 --> D
    
    D --> E{Critical Issues?}
    E -->|Yes| F[Block Deploy]
    E -->|No| G[Deploy]
    
    F --> H[Auto-Fix PR]

## ⚡ Quick Start (Kubernetes & Helm)

Get the platform running locally in minutes:

### 1. Clone repository

```bash
git clone [https://github.com/Tomppa-L/private-for-now]
cd snake-demo
```

### 2. Install with Helm (Development Profile)

```bash
helm upgrade --install snake-demo ./helm/snake-demo \
  --create-namespace \
  -n snake-demo-dev \
  -f ./helm/snake-demo/values-dev.yaml
```

### 3. Access Dashboards (Automated check)

```bash
./scripts/start-dashboards.sh
```

## 📚 Documentation & Operations Playbooks

This project emphasizes team collaboration and operational excellence through version-controlled playbooks:

| Dokumentti | Kuvaus |
| :--- | :--- |
| 📖 **[Full Deployment & Onboarding Plan]** | Step-by-step 18-stage guide designed for junior and senior engineers alike. |
| 🛠 **[Production Operations Playbook]** | Day-2 operations, scaling, rollbacks, and troubleshooting. |
| 🔍 **[Advanced Observability Guide]** | RUM, tracing, and Thanos configuration. |
| 💥 **[Chaos Engineering Guide]** | Resilience testing with Chaos Mesh. |
| 💰 **[FinOps Guide]** | Cost monitoring and optimization. |

---

## 💡 Engineering Culture & Methodology

Built with a strong team spirit and shared responsibility:"

* **Cross-Read Documentation:** Core deployment plans are version-controlled, living documents requiring team alignment.
* **Automated Health Validation:** Built-in validation scripts (`health-check.sh`) ensuring deterministic deployments from dev to production.

---

*Made with ❤️ for the Cloud-Native & SRE Community.*
