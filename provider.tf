# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "Terraform-RG"  # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "devopsbackend"                      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "backenddevops"                       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "prod.terraform.tfstate"        # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
    use_oidc             = true                                    # Can also be set via `ARM_USE_OIDC` environment variable.
    client_id            =  ${{secrets.AZURE_CLIENT_ID}} # Can also be set via `ARM_CLIENT_ID` environment variable.
    subscription_id      =   ${{}secrets.AZURE_SUBSCRIPTION_ID}# Can also be set via `ARM_SUBSCRIPTION_ID` environment variable.
    tenant_id            = ${{secrets.AZURE_TENANT_ID}}  # Can also be set via `ARM_TENANT_ID` environment variable.  

}
}
