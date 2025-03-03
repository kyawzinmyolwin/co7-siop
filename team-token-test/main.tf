

#Generate Team Token

resource "tfe_team" "test" {
  name         = "test"
  organization = var.org_name
}

resource "tfe_team_token" "test" {
  team_id = tfe_team.test.id
}

output "token_value" {
  value     = tfe_team_token.test.token
  sensitive = true
}
provider "tfe" {
  token = data.tfe_team.test.
}
#############################################
#Variables update for JWT Backend
#############################################
resource "tfe_variable" "vault_addr" {
  key   = "VAULT_ADDR"
  value = var.vault_addr
  # value        = data.terraform_remote_state.vault.outputs.vault_public_endpoint_url
  category     = "env"
  workspace_id = data.tfe_workspace.workspace_name.id
  sensitive    = true
}

resource "tfe_variable" "vault_token" {
  key   = "VAULT_TOKEN"
  value = var.vault_token
  # value        = data.terraform_remote_state.vault.outputs.vault_admin_token
  category     = "env"
  workspace_id = data.tfe_workspace.workspace_name.id
  sensitive    = true
}