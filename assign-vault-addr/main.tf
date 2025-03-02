data "tfe_workspace" "jwt_backend" {
  name         = "jwt_backend"
  organization = "kz-co7-sio1"
}
#############################################
#Step2 - Variables for JWT Backend
#############################################
resource "tfe_variable" "vault_addr" {
  key          = "VAULT_ADDR"
  value        = data.terraform_remote_state.vault.outputs.vault_public_endpoint_url
  category     = "env"
  workspace_id = data.tfe_workspace.jwt_backend.id
  sensitive    = false
}

resource "tfe_variable" "vault_token" {
  key          = "VAULT_TOKEN"
  value        = data.terraform_remote_state.vault.outputs.vault_admin_token
  category     = "env"
  workspace_id = data.tfe_workspace.jwt_backend.id
  sensitive    = true
}