# argocd-apps

## Initial installation
Start a new empty ubuntu distro on wsl and call the following command:
```
sudo curl -s https://raw.githubusercontent.com/DolfenHC/argocd-apps/refs/heads/main/install_all.sh | bash
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
