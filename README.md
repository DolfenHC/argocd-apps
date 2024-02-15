# argocd-apps

## Cluster setup
Set up the cluster via k3s:
```
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644 --disable traefik
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
```

## Initial installation
Clone this Repo and run the following command:
```
helm repo add argo-cd https://argoproj.github.io/argo-helm
helm install argocd argo-cd/argo-cd --values argocd-values.yaml --namespace=argocd --create-namespace
helm template root-app/ | kubectl apply -f -
```

## Grafana
User: admin
Password:
```
kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```

## Keycloak
User: user
Password:
```
kubectl get secret --namespace keycloak keycloak -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```