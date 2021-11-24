# Azure Active Directory Groups to Vault External Identity Groups

This module is designed to read all Azure Active Directory (AAD) groups in an Azure Tenant, and create external identity groups in HashiCorp Vault and Group aliases that tie these all together.

AAD groups can be filtered to only create HashiCorp Vault External groups for Security-enabled AAD groups or Mail-enabled AAD groups. For the best results, this module should be run on an automated CICD pipeline and regular intervals to ensure changes in AAD groups are quickly replicated to HashiCorp Vault.

## Example Usage

**All Groups**

```hcl
terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.10.0"
    }
  }
}

provider "vault" {
  address = "http://localhost:8200"
  token   = var.vault_token
}

provider "azuread" {}

variable "vault_token" {}

module "groups" {
  source = "../"
}
```

**Security-Enabled Groups**

```hcl
terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.10.0"
    }
  }
}

provider "vault" {
  address = "http://localhost:8200"
  token   = var.vault_token
}

provider "azuread" {}

variable "vault_token" {}

module "groups" {
  source = "../"
  
  security_enabled = true
}
```

**Mail-Enabled Groups**

```hcl
terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.10.0"
    }
  }
}

provider "vault" {
  address = "http://localhost:8200"
  token   = var.vault_token
}

provider "azuread" {}

variable "vault_token" {}

module "groups" {
  source = "../"

  mail_enabled = true
}
```