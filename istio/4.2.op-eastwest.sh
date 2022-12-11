NET="network2"
MESH_ID="proj-1080734203311"
CLUSTER_NAME="op-practice"
# Nen de duong dan tuyet doi den file kubeconfig
kubectl label namespace istio-system topology.istio.io/network=$NET --overwrite --kubeconfig /home/lamdaongc/demo/op/kubeconfig.yaml 

# config op-practice
rm -rf op-practice.yaml
cat <<EOF >> op-practice.yaml
apiVersion: install.istio.io/v1alpha1
kind: IstioOperator
spec:
  values:
    global:
      meshID: $MESH_ID # mesh_id label
      multiCluster:
        clusterName: $CLUSTER_NAME # Tên của cluster trên anthos
      network: $NET
EOF

# apply config
./istio-1.13.4-asm.4/bin/istioctl install --kubeconfig=/home/lamdaongc/demo/op/kubeconfig.yaml -f op-practice.yaml

# setup eastwestgateway
./istio-1.13.4-asm.4/samples/multicluster/gen-eastwest-gateway.sh --mesh $MESH_ID --cluster $CLUSTER_NAME --network $NET | ./istio-1.13.4-asm.4/bin/istioctl install --kubeconfig=/home/lamdaongc/demo/op/kubeconfig.yaml -y -f -

# expose all service of op-practice
kubectl apply -n istio-system -f istio-1.13.4-asm.4/samples/multicluster/expose-services.yaml --kubeconfig /home/lamdaongc/demo/op/kubeconfig.yaml

