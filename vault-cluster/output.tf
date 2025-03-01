output "vault_id" {
  description = "HCP Vault Cluster ID"
  value = hcp_vault_cluster.cluster_setup.id
}

output "vault_public_endpoint_url" {
  description = "HCP Vault Cluster vault_public_endpoint_url"
  value = hcp_vault_cluster.cluster_setup.vault_public_endpoint_url
}

output "vault_admin_token" {
  value = hcp_vault_cluster_admin_token.admin_token.token
  sensitive = true
}