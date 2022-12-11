curl https://storage.googleapis.com/csm-artifacts/asm/asmcli_1.13 > asmcli
chmod +x asmcli

curl -LO https://storage.googleapis.com/gke-release/asm/istio-1.13.4-asm.4-linux-amd64.tar.gz
tar xzf istio-1.13.4-asm.4-linux-amd64.tar.gz
cd "istio-1.13.4-asm.4"
mkdir -p certs && pushd certs
make -f ../tools/certs/Makefile.selfsigned.mk root-ca
make -f ../tools/certs/Makefile.selfsigned.mk anthos-on-gcp-1-cacerts


