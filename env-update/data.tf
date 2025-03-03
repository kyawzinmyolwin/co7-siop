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

data "tfe_workspace" "step3_aws_secret_backend" {
  name         = var.step3_aws_secret_backend
  organization = var.org_name
}

