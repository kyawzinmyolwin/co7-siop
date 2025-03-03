provider "tfe" {
  token = var.tfc_token
}

#############################################
#Variables update for JWT Backend
#############################################
resource "tfe_variable" "vault_addr" {
  key   = "VAULT_ADDR"
  # value = var.vault_addr
  value        = data.terraform_remote_state.vault.outputs.vault_public_endpoint_url
  category     = "env"
  workspace_id = data.tfe_workspace.workspace_name.id
  sensitive    = false
}

resource "tfe_variable" "vault_token" {
  key   = "VAULT_TOKEN"
  # value = var.vault_token
  value        = data.terraform_remote_state.vault.outputs.vault_admin_token
  category     = "env"
  workspace_id = data.tfe_workspace.workspace_name.id
  sensitive    = false
}