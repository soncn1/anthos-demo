echo "Check secret op-practice on gke cluster"
kubectl --kubeconfig=/home/lamdaongc/demo/gke/kubeconfig.yaml get secret -n istio-system | grep op-practice 


echo "Check secret gke-practice on onprem cluster"
kubectl --kubeconfig=/home/lamdaongc/demo/op/kubeconfig.yaml get secret -n istio-system | grep gke-practice
