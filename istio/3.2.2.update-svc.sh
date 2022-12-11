kubectl delete svc istio-ingressgateway -n ingress-gateway --kubeconfig /home/lamdaongc/demo/op/kubeconfig.yaml
kubectl apply -f istio-ingressgateway-svc.yaml --kubeconfig /home/lamdaongc/demo/op/kubeconfig.yaml
