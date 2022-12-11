kubectl create namespace ingress-gateway --kubeconfig /home/lamdaongc/demo/op/kubeconfig.yaml
# folder of output dir
tag=`./op-istio/istioctl tag list | grep default | awk '{print $2}'`
kubectl label namespace ingress-gateway istio.io/rev=$tag --overwrite --kubeconfig /home/lamdaongc/demo/op/kubeconfig.yaml

kubectl apply -n ingress-gateway -f op-istio/samples/gateways/istio-ingressgateway --kubeconfig /home/lamdaongc/demo/op/kubeconfig.yaml
