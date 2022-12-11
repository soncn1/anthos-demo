./istio-1.13.4-asm.4/bin/istioctl x create-remote-secret --kubeconfig=/home/lamdaongc/demo/gke/kubeconfig.yaml --name=gke-practice | kubectl apply -f - --kubeconfig /home/lamdaongc/demo/op/kubeconfig.yaml

./istio-1.13.4-asm.4/bin/istioctl x create-remote-secret --kubeconfig=/home/lamdaongc/demo/op/kubeconfig.yaml --name=op-practice | kubectl apply -f - --kubeconfig /home/lamdaongc/demo/gke/kubeconfig.yaml
