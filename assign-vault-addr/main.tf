#############################################
#Step2-jwt-backend
#############################################
resource "tfe_workspace" "jwt_backend" {
  name         = "jwt-backend"
  organization = var.org_name

  auto_apply_run_trigger = true
  working_directory      = "jwt-backend"

  vcs_repo {
    identifier         = "kyawzinmyolwin/${var.repo_name}"
    oauth_token_id     = var.oauth_token_id
    branch             = "main" # Change if using a different branch
    ingress_submodules = false

  }
}
resource "tfe_workspace_settings" "jwt_backend" {
  workspace_id   = tfe_workspace.jwt_backend.id
  execution_mode = "remote"

}

#############################################
#Step2 - Variables for JWT Backend
#############################################
resource "tfe_variable" "vault_addr" {
  key          = "VAULT_ADDR"
  value        = data.terraform_remote_state.vault.outputs.vault_public_endpoint_url
  category     = "env"
  workspace_id = tfe_workspace.jwt_backend.id
  sensitive    = false
}

resource "tfe_variable" "vault_token" {
  key          = "VAULT_TOKEN"
  value        = data.terraform_remote_state.vault.outputs.vault_admin_token
  category     = "env"
  workspace_id = tfe_workspace.jwt_backend.id
  sensitive    = true
}