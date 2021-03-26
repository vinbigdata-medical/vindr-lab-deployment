# kubectl delete configmap apigateway-configmap
kubectl create configmap apigateway-configmap --from-file=./vinlab-configmap/nginx.conf -n vinlab

# kubectl delete configmap backend-configmap
kubectl create configmap backend-configmap --from-file=./vinlab-configmap/backend/ -n vinlab
