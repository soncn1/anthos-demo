NET="network1"
MESH_ID="proj-1080734203311"
CLUSTER_NAME="gke-practice"
kubectl label namespace istio-system topology.istio.io/network=$NET --overwrite 

# config gke-practice
rm -rf gke-practice.yaml
cat <<EOF >> gke-practice.yaml
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
./istio-1.13.4-asm.4/bin/istioctl install -f gke-practice.yaml

# setup eastwestgateway
./istio-1.13.4-asm.4/samples/multicluster/gen-eastwest-gateway.sh --mesh $MESH_ID --cluster $CLUSTER_NAME --network $NET | ./istio-1.13.4-asm.4/bin/istioctl install -y -f -

# expose all service of gke-practice
kubectl apply -n istio-system -f istio-1.13.4-asm.4/samples/multicluster/expose-services.yaml

