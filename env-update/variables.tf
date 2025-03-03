variable "tfc_token" {
  default = ""
}
variable "org_name" {
  default = "hc-siop2-org"
}
variable "project_id" {
  default = "hc-siop2-proj"
}
variable "workspace_name" {
  default = "step2-jwt-backend"
}
variable "step3_aws_secret_backend" {
  default = "step3-aws-secret-backend"
}
variable "repo_name" {
  default = "co7-siop"
}
variable "oauth_token_id" { # Get from Terraform Cloud VCS provider settings
  default = "ot-g6SJWQeetz8cUzfd"
}
variable "vault_addr" {
  default = "vault_addr_test_1.4"
}
variable "vault_token" {
  default = "vault_token_test_1.4"
}