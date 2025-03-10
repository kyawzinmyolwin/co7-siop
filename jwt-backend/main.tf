resource "vault_jwt_auth_backend" "jwt_auth" {
    description         = "Terraform JWT auth backend for hc-siop2"
    path                = "jwt"
    oidc_discovery_url  = "https://app.terraform.io"
    bound_issuer        = "https://app.terraform.io"
}
#Step-2 Create Policy
resource "vault_policy" "admin_policy" {
  name = "admin-policy"

  policy = <<EOT
path "auth/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create, update, and delete auth methods
path "sys/auth/*" {
  capabilities = ["create", "update", "delete", "sudo"]
}

# List auth methods
path "sys/auth" {
  capabilities = ["read"]
}

# Enable and manage the key/value secrets engine at `secret/` path
# List, create, update, and delete key/value secrets
path "secret/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage secrets engines
path "sys/mounts/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List existing secrets engines.
path "sys/mounts" {
  capabilities = ["read"]
}

path "aws-dev/" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "aws-dev/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/policy/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/policy/" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/policies/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/policies/" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "kvv2/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "db/" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "db/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
EOT
}

#Step-3 Role create
resource "vault_jwt_auth_backend_role" "admin_role" {
  backend         = vault_jwt_auth_backend.jwt_auth.path
  role_name       = "admin_role"
  token_policies = [vault_policy.admin_policy.name]

  bound_audiences = ["vault.workload.identity"]
  bound_claims_type = "glob"
  bound_claims = {
    sub = "organization:kz-co7-siop1:project:kz-co7-siop1-proj:workspace:*:run_phase:*"

  }
  user_claim      = "terraform_full_workspace"
  role_type       = "jwt"
  token_ttl = 1200
}