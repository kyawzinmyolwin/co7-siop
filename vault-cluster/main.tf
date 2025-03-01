resource "hcp_hvn" "hc_siop1_hvn" {
  hvn_id         = "hc-siop1"
  cloud_provider = "aws"
  region         = "ap-southeast-1"
  cidr_block     = "172.25.16.0/20"
}

resource "hcp_vault_cluster" "cluster_setup" {
  cluster_id = "hc-siop1-cluster"
  hvn_id     = hcp_hvn.hc_siop1_hvn.hvn_id
  tier       = "dev"
  public_endpoint = true
}

resource "hcp_vault_cluster_admin_token" "admin_token" {
  cluster_id = hcp_vault_cluster.cluster_setup.cluster_id
}