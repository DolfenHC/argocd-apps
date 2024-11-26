# argocd-apps

## Initial installation
Clone this Repo and run the following command:
```
./install.sh
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
