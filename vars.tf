variable "policies" {
  type        = list(string)
  default     = null
  description = "A list of HashiCorp Vault policies to attach to Azure Groups."
}

variable "mail_enabled" {
  type        = bool
  default     = null
  description = "Determines whether mapped Azure groups should be mailed enabled. Set to true if all groups should be mail enabled."
}

variable "security_enabled" {
  type        = bool
  default     = null
  description = "Determines whether mapped Azure groups should be security enabled. Set to true if all groups should be security enabled."
}

variable "auth_method" {
  type = string
  default = "token"
  description = "The path of the auth method to attach the group alias to. Default to 'token'."
}
