# kubectl delete configmap apigateway-configmap
kubectl create configmap apigateway-configmap --from-file=./vinlab-configmap/nginx.conf  -o yaml --dry-run=client -n vinlab | kubectl replace -f -

# kubectl delete configmap backend-configmap
kubectl create configmap backend-configmap --from-file=./vinlab-configmap/backend/ -o yaml --dry-run=client  -n vinlab | kubectl replace -f -
