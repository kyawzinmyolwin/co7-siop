data "terraform_remote_state" "vault" {

  backend = "remote"

  config = {
    organization = "kz-co7-siop1"
    workspaces = {
      name = "step1-cluster-setup"
    }
  }
}
data "terraform_remote_state" "jwt_backend" {

  backend = "remote"

  config = {
    organization = "kz-co7-siop1"
    workspaces = {
      name = "jwt-backend"
    }
  }
}