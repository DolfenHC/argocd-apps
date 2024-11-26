curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod +x ./get_helm.sh
./get_helm.sh
k3d cluster create --port 80:80@loadbalancer --k3s-arg="--disable=traefik@server:0"
helm repo add argo-cd https://argoproj.github.io/argo-helm
helm install argocd argo-cd/argo-cd --values argocd-values.yaml --namespace=argocd --create-namespace
helm template charts/root-app/ | kubectl apply -f -
