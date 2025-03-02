data "terraform_remote_state" "vault" {

  backend = "remote"

  config = {
    organization = "kz-co7-siop1"
    workspaces = {
      name = "step1-cluster-setup"
    }
  }
}
data "tfe_workspace" "jwt_backend" {
  name         = jwt_backend
  organization = kz-co7-sio1
}