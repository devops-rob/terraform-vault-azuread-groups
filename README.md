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

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.