kubectl create namespace ingress-gateway
# folder of output dir
tag=`./gke-istio/istioctl tag list | grep default | awk '{print $2}'`
echo $tag
kubectl label namespace ingress-gateway istio.io/rev=$tag --overwrite
kubectl apply -n ingress-gateway -f gke-istio/samples/gateways/istio-ingressgateway
