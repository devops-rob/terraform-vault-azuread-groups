terraform {
  required_version = ">= 0.14.0"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.5.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = ">= 3.0"
    }
  }
}

