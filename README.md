
Cloud Native Microservices Platform 🚀
Esta plataforma demonstra uma arquitetura de microserviços moderna, resiliente e escalável, utilizando as melhores práticas de DevOps e Cloud Native. O projeto engloba desde a infraestrutura como código (IaC) até a observabilidade completa do cluster.

🛠️ Stack Tecnológico
Cloud Provider: AWS (EKS, ECR, VPC, IAM).

Infraestrutura: Terraform (IaC).

Orquestração: Kubernetes.

Linguagens/Serviços: Node.js / Go / Python (estruturados em /services).

CI/CD: GitHub Actions (Pipelines segregadas por serviço).

Observabilidade: Prometheus & Grafana (via Helm Charts).

🏗️ Arquitetura do Projeto
O projeto está organizado para suportar o desenvolvimento independente de cada serviço:

/services: Contém o código-fonte e o Dockerfile de cada microserviço (payment, order, user).

/k8s: Manifestos de Deployment, Service e HPA para cada componente.

/terraform: Arquivos de configuração para provisionar o cluster EKS e redes automaticamente.

/.github/workflows: Automação de Build, Push (ECR) e Deploy (EKS).

🚀 Pipeline de CI/CD
A pipeline foi desenhada para ser eficiente. Através do uso de paths no GitHub Actions, o deploy só é disparado para o microserviço que sofreu alterações, economizando tempo e recursos computacionais.

Checkout & Auth: Autenticação segura na AWS via OIDC/Access Keys.

Docker Build: Geração da imagem otimizada.

ECR Push: Armazenamento da imagem no Amazon Elastic Container Registry com tag de SHA exclusiva.

K8s Deploy: Atualização do manifesto e rollout estratégico no cluster EKS.

📊 Observabilidade e Monitoramento
Implementamos o Kube-Prometheus-Stack para garantir visibilidade total:

Prometheus: Coleta de métricas de performance e saúde dos pods.

Grafana: Dashboards customizados para visualização de tráfego e consumo de recursos.

Alertmanager: Notificações críticas de downtime.

🔧 Como Executar
Pré-requisitos
AWS CLI configurada.

Terraform & Helm instalados.

Acesso ao cluster EKS via kubectl.

Passos Rápidos
Bash
# 1. Provisionar Infra
cd terraform && terraform apply

# 2. Configurar Monitoramento
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus prometheus-community/kube-prometheus-stack -f k8s/monitoring/values.yaml

# 3. Deploy Manual (Opcional - CI/CD faz automático)
kubectl apply -f k8s/
👨‍💻 Autor
Marlon Silva - Senior Software Engineer / DevOps Enthusiast.
