echo "Test connect from onprem to gke cluster"
for i in $(seq 1 2 10) 
do
	kubectl --kubeconfig=/home/lamdaongc/demo/op/kubeconfig.yaml exec -n sample -c sleep "$(kubectl --kubeconfig=/home/lamdaongc/demo/op/kubeconfig.yaml get pod -n sample -l app=sleep -o jsonpath='{.items[0].metadata.name}')" -- curl -sS helloworld.sample:5000/hello
done

echo "Test test connect from gke to onprem cluster"
for i in $(seq 1 2 10) 
do
	kubectl --kubeconfig=/home/lamdaongc/demo/gke/kubeconfig.yaml exec -n sample -c sleep "$(kubectl --kubeconfig=/home/lamdaongc/demo/gke/kubeconfig.yaml get pod -n sample -l app=sleep -o jsonpath='{.items[0].metadata.name}')" -- curl -sS helloworld.sample:5000/hello
done
