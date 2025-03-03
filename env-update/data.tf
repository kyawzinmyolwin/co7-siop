#############################################
#Getting Vault Address & Token - Only uncomment after cluster up
#############################################
# data "terraform_remote_state" "vault" {

#   backend = "remote"

#   config = {
#     organization = "kz-co7-siop1"
#     workspaces = {
#       name = "step1-cluster-setup"
#     }
#   }
# }
# data "tfe_workspace" "step2_jwt_backend" {
#   name         = var.workspace_name
#   organization = var.org_name
# }


data "tfe_workspace" "workspace_name" {
  name         = var.workspace_name
  organization = var.org_name
}