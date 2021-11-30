data "azuread_groups" "groups" {
  return_all       = true
  mail_enabled     = var.mail_enabled
  security_enabled = var.security_enabled
}
