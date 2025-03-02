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