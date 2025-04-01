#!/bin/sh
# kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
#
# helm
curl -s https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
#
# k3d
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
#
# cluster
sudo mkdir -p /opt/server/k3d
sudo chmod 777 /opt/server/k3d
k3d cluster create develop --servers 1 --agents 1 \
  -v /opt/server/k3d:/var/lib/rancher/k3s/storage@all \
  --k3s-arg="--disable=traefik@server:*" \
  --k3s-arg="--service-node-port-range=30000-30050@server:*" \
  -p "30000-30050:30000-30050@server:0" \
  -p "80:80@loadbalancer:*"
#  
# argocd
helm repo add argo-cd https://argoproj.github.io/argo-helm
helm install argocd argo-cd/argo-cd --values argocd-values.yaml --namespace=argocd --create-namespace
helm template charts/root-app/ | kubectl apply -f -
