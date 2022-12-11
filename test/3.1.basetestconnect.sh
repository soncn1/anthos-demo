echo "##################### create sample ns ###############"
kubectl --kubeconfig=/home/lamdaongc/demo/gke/kubeconfig.yaml create namespace sample
kubectl --kubeconfig=/home/lamdaongc/demo/op/kubeconfig.yaml create namespace sample


echo "#### lable namespace sample ###########################"
kubectl --kubeconfig=/home/lamdaongc/demo/gke/kubeconfig.yaml label namespace sample istio-injection=enabled
kubectl --kubeconfig=/home/lamdaongc/demo/op/kubeconfig.yaml label namespace sample istio-injection=enabled


echo "### create svc helloworld #######################"
/home/lamdaongc/demo/istio/istio-1.13.4-asm.4/samples/helloworld/gen-helloworld.sh | kubectl --kubeconfig=/home/lamdaongc/demo/gke/kubeconfig.yaml apply -f - -l service=helloworld -n sample
/home/lamdaongc/demo/istio/istio-1.13.4-asm.4/samples/helloworld/gen-helloworld.sh | kubectl --kubeconfig=/home/lamdaongc/demo/op/kubeconfig.yaml apply -f - -l service=helloworld -n sample

echo "### create helloworld app v1 gke cluster  #############"
/home/lamdaongc/demo/istio/istio-1.13.4-asm.4/samples/helloworld/gen-helloworld.sh | kubectl --kubeconfig=/home/lamdaongc/demo/gke/kubeconfig.yaml apply -f - -l version=v1 -n sample
kubectl --kubeconfig=/home/lamdaongc/demo/gke/kubeconfig.yaml get pod  -n sample -l app=helloworld

echo "### create helloworld app v2 on prem $$$$$$$$$$"
/home/lamdaongc/demo/istio/istio-1.13.4-asm.4/samples/helloworld/gen-helloworld.sh --version v2 | kubectl --kubeconfig=/home/lamdaongc/demo/op/kubeconfig.yaml apply -f - -l version=v2 -n sample
kubectl --kubeconfig=/home/lamdaongc/demo/op/kubeconfig.yaml get pod -n sample -l app=helloworld

echo "### Create sleep pod test connect #######################"
kubectl --kubeconfig=/home/lamdaongc/demo/gke/kubeconfig.yaml apply -f  /home/lamdaongc/demo/istio/istio-1.13.4-asm.4/samples/sleep/sleep.yaml -n sample
kubectl --kubeconfig=/home/lamdaongc/demo/op/kubeconfig.yaml apply -f /home/lamdaongc/demo/istio/istio-1.13.4-asm.4/samples/sleep/sleep.yaml -n sample

echo "######### END         ########################"

