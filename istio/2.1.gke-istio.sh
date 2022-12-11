# output dir
mkdir gke-istio/
# gen config
./asmcli install --fleet_id anthos-on-gcp-1 \
                 --kubeconfig /home/lamdaongc/demo/gke/kubeconfig.yaml \
		 --output_dir gke-istio/ \
                 --platform multicloud \
		 --enable_all \
		 --ca citadel \
		 --ca_cert istio-1.13.4-asm.4/certs/anthos-on-gcp-1/ca-cert.pem \
		 --ca_key istio-1.13.4-asm.4/certs/anthos-on-gcp-1/ca-key.pem \
		 --root_cert istio-1.13.4-asm.4/certs/anthos-on-gcp-1/root-cert.pem \
		 --cert_chain istio-1.13.4-asm.4/certs/anthos-on-gcp-1/cert-chain.pem
