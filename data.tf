terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "kz-co7-siop1"

    workspaces {
      name = "jwt-backend"
    }
  }
}

data "terraform_remote_state" "vault" {
  backend = "remote"

  config = {
    organization = "kz-co7-sio1"
    workspaces = {
      name = "step1-cluster-setup"
    }
  }
}

# provider "tfe" {
#   token = var.tfe_token # Your Terraform Cloud API Token
# }

data "tfe_workspace" "step2_jwt_backend" {
  name         = "step2_jwt_backend"
  organization = "hc-siop2-org"
}

# resource "tfe_variable" "vault_endpoint" {
#   workspace_id = tfe_workspace.step2_jwt_backend.id
#   key          = "VAULT_ADDR"
#   value        = data.terraform_remote_state.vault.outputs.vault_public_endpoint_url
#   category     = "env"
#   sensitive    = false
# }

# resource "tfe_variable" "vault_token" {
#   workspace_id = tfe_workspace.step2_jwt_backend.id
#   key          = "VAULT_TOKEN"
#   value        = data.terraform_remote_state.vault.outputs.vault_admin_token
#   category     = "env"
#   sensitive    = true  # Marked sensitive to keep it secure
# }