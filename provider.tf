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

#     terraform {
       backend "azurerm" {
#        resource_group_name = "Terraform-RG"
         storage_account_name = "devopsbackend"
         container_name = "backenddevops"
         key = ${{secrets.BACKENDDEVOPS}}
       }
     }
