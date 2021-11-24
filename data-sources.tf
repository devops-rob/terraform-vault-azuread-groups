data "azuread_groups" "groups" {
  return_all       = true
  mail_enabled     = var.mail_enabled
  security_enabled = var.security_enabled
}

data "vault_auth_backend" "auth_method" {
  path = var.auth_method
}