# 1. Specify the version of the AzureRM Provider to use
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.96.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "terraform-statefiles"
    storage_account_name = "terraformremotestatefile"
    container_name       = "myobcontainer"
    key                  = "terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}   
