terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "state-file-rg"
    storage_account_name = "statefileaccountfork8s"
    container_name       = "statefilestorage"
    key                  = "kubernetes.statefilestorage"

  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  resource_provider_registrations = "core"
}
