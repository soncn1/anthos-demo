# enable workload identity
gcloud container clusters update gke-practice     --region=asia-east1-a     --workload-pool=anthos-on-gcp-1.svc.id.goog
# update node of cluster use workload identity
gcloud container node-pools update default-pool  --cluster=gke-practice --workload-metadata=GKE_METADATA --region=asia-east1-a
