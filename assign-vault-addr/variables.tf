variable "tfe_token" {
  default = "Pf6w67wqf6w4Pw.atlasv1.e1HXT6uC7VnBaG2fIIOck5d2xxdDgyM3CZuZlCz5xJkfa2aqIAnUYYzBDhQZfHC7U8E"
}
variable "org_name" {
  default = "kz-co7-siop1"
}
variable "repo_name" {
  default = "co7-siop"
}
variable "oauth_token_id" { # Get from Terraform Cloud VCS provider settings
  default = "ot-g6SJWQeetz8cUzfd"
}




#############################################
#Getting Vault Address & Token - Only uncomment after cluster up
#############################################
data "terraform_remote_state" "vault" {

  backend = "remote"

  config = {
    organization = "kz-co7-siop1"
    workspaces = {
      name = "step1-cluster-setup"
    }
  }
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

#############################################
#Step3 - Variables for AWS secrets backend
#############################################
# resource "tfe_variable" "aws_access_key" {
#   key          = "AWS_ACCESS_KEY_ID"
#   value        = "your-access-key"
#   category     = "env"
#   workspace_id = tfe_workspace.step3-aws-secret-backend.id
#   sensitive    = true
# }

# resource "tfe_variable" "aws_secret_key" {
#   key          = "AWS_SECRET_ACCESS_KEY"
#   value        = "your-secret-key"
#   category     = "env"
#   workspace_id = tfe_workspace.step3-aws-secret-backend.id
#   sensitive    = true
# }

# resource "tfe_variable" "aws_region" {
#   key          = "AWS_REGION"
#   value        = "ap-southeast-1"
#   category     = "env"
#   workspace_id = tfe_workspace.step3-aws-secret-backend.id
#   sensitive    = true
# }

# resource "tfe_variable" "step3_vault_addr" {
#   key          = "VAULT_ADDR"
#   value        = data.terraform_remote_state.vault.outputs.vault_public_endpoint_url
#   category     = "env"
#   workspace_id = tfe_workspace.step3-aws-secret-backend.id
#   sensitive    = false
# }

# resource "tfe_variable" "step3_vault_namespace" {
#   key          = "TFC_VAULT_NAMESPACE"
#   value        = "admin"
#   category     = "env"
#   workspace_id = tfe_workspace.step3-aws-secret-backend.id
#   sensitive    = false
# }

# resource "tfe_variable" "step3_vault_provider_auth" {
#   key          = "TFC_VAULT_PROVIDER_AUTH"
#   value        = "true"
#   category     = "env"
#   workspace_id = tfe_workspace.step3-aws-secret-backend.id
#   sensitive    = false
# }

# resource "tfe_variable" "step3_vault_run_role" {
#   key          = "TFC_VAULT_RUN_ROLE"
#   value        = "tf_vault_role"
#   category     = "env"
#   workspace_id = tfe_workspace.step3-aws-secret-backend.id
#   sensitive    = false
# }