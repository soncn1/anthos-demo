# tao service accout
kubectl create serviceaccount -n kube-system anthos --kubeconfig kubeconfig.yaml
# them role cho sa
kubectl create clusterrolebinding anthos-binding --clusterrole cluster-admin --serviceaccount kube-system:anthos --kubeconfig kubeconfig.yaml
# get token
SECRET_NAME=$(kubectl get serviceaccount -n kube-system anthos -o jsonpath='{$.secrets[0].name}' --kubeconfig kubeconfig.yaml)
kubectl get secret -n kube-system ${SECRET_NAME} -o jsonpath='{$.data.token}' --kubeconfig kubeconfig.yaml | base64 -d

