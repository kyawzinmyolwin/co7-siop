#############################################
#Variables update for JWT Backend
#############################################
resource "tfe_variable" "vault_addr" {
  key   = "VAULT_ADDR"
  value = "vault_addr_test"
  # value        = data.terraform_remote_state.vault.outputs.vault_public_endpoint_url
  category     = "env"
  workspace_id = data.tfe_workspace.step2_jwt_backend.id
  sensitive    = false
}

resource "tfe_variable" "vault_token" {
  key   = "VAULT_TOKEN"
  value = "vault_token_test"
  # value        = data.terraform_remote_state.vault.outputs.vault_admin_token
  category     = "env"
  workspace_id = data.tfe_workspace.step2_jwt_backend.id
  sensitive    = true
}