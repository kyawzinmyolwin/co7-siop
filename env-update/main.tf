provider "tfe" {
  # token = var.tfc_token
}

#############################################
#Variables update for Step2 JWT Backend
#############################################
resource "tfe_variable" "vault_addr" {
  key = "VAULT_ADDR"
  # value = var.vault_addr
  value        = data.terraform_remote_state.vault.outputs.vault_public_endpoint_url
  category     = "env"
  workspace_id = data.tfe_workspace.workspace_name.id
  sensitive    = true
}

resource "tfe_variable" "vault_token" {
  key          = "VAULT_TOKEN"
  value        = data.terraform_remote_state.vault.outputs.vault_admin_token
  category     = "env"
  workspace_id = data.tfe_workspace.workspace_name.id
  sensitive    = true
}

###############################################
#Variables update for Step3 AWS Secret Backend
###############################################
resource "tfe_variable" "tfc_vault_addr" {
  key          = "TFC_VAULT_ADDR"
  value        = data.terraform_remote_state.vault.outputs.vault_public_endpoint_url
  category     = "env"
  workspace_id = data.tfe_workspace.step3_aws_secret_backend.id
  sensitive    = true
}
