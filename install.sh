curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644 --disable traefik
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
helm repo add argo-cd https://argoproj.github.io/argo-helm
helm install argocd argo-cd/argo-cd --values argocd-values.yaml --namespace=argocd --create-namespace
helm template charts/root-app/ | kubectl apply -f -
