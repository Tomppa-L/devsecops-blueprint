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
🌟 Core Stack & Features
Platform & Orchestration: Kubernetes (K3s/Kind/EKS/AKS), Helm (Dev/Staging/Prod hierarchy), ArgoCD (GitOps).

Observability (SRE-grade): Prometheus & Thanos (long-term metrics storage & downsampling), Loki (logs), Tempo (distributed traces), OpenTelemetry (auto-instrumentation).

Security & Authentication: Keycloak (OIDC/OAuth2 centralized SSO), External Secrets / Vault integration, Network Policies.

Resiliency & FinOps: Chaos Mesh (chaos engineering), Kubecost (cost optimization), HPA (Horizontal Pod Autoscaler).

⚡ Quick Start (Kubernetes & Helm)
Get the platform running locally in minutes:

# 1. Clone repository
```bash
git clone https://github.com/Tomppa-L/private-for-now
cd snake-demo

# 2. Install with Helm (Development Profile)
helm upgrade --install snake-demo ./helm/snake-demo \
  --create-namespace \
  -n snake-demo-dev \
  -f ./helm/snake-demo/values-dev.yaml

# 3. Access Dashboards (Automated check)
./scripts/start-dashboards.sh
```

## 📚 Documentation & Operations Playbooks

Tämä projekti korostaa tiimiyhteistyötä ja operatiivista huippuosaamista versionhallittujen pelikirjojen kautta:

| Dokumentti | Kuvaus |
| :--- | :--- |
| 📖 **[Full Deployment & Onboarding Plan](docs/FULL_DEPLOYMENT_PLAN.md)** | Step-by-step 18-stage guide designed for junior and senior engineers alike. |
| 🛠 **[Production Operations Playbook](docs/PRODUCTION_OPERATIONS.md)** | Day-2 operations, scaling, rollbacks, and troubleshooting. |
| 🔍 **[Advanced Observability Guide](docs/ADVANCED_OBSERVABILITY_GUIDE.md)** | RUM, tracing, and Thanos configuration. |
| 💥 **[Chaos Engineering Guide](docs/CHAOS_ENGINEERING_GUIDE.md)** | Resilience testing with Chaos Mesh. |
| 💰 **[FinOps Guide](docs/FINOPS_GUIDE.md)** | Cost monitoring and optimization. |

---

## 💡 Engineering Culture & Methodology

Rakennettu vahvalla **"Me-henki"**-ajattelulla ja yhteisellä vastuulla:

* **Cross-Read Documentation:** Core deployment plans are version-controlled, living documents requiring team alignment.
* **Automated Health Validation:** Built-in validation scripts (`health-check.sh`) ensuring deterministic deployments from dev to production.

---

*Made with ❤️ for the Cloud-Native & SRE Community.*
