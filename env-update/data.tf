#############################################
#Getting Vault Address & Token
#############################################
data "terraform_remote_state" "vault" {

  backend = "remote"

  config = {
    organization = "hc-siop2-org"
    workspaces = {
      name = "step1-vault-cluster"
    }
  }
}

data "tfe_workspace" "workspace_name" {
  name         = var.workspace_name
  organization = var.org_name
}

# data "tfe_workspace" "step2_jwt_backend" {
#   name         = var.workspace_name
#   organization = var.org_name
# }
