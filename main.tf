terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "Apple"
    tenant_id              = "ccadeb2d-d3e2-46ad-bafc-30ee7a5d9ca1"
    storage_account_name   = "storageaccount4480"
    container_name         = "ashistfstate"
    key                    = "prod.terraform.tfstate"
  }
}



provider "azurerm" {
  features {}
  subscription_id = "89ed735a-a288-487d-8f2e-dc57af7a7232"
}


resource "azurerm_resource_group" "rg-testing" {
  name     = "Ashsis"
  location = "West Europe"
}

resource "azurerm_storage_account" "storagetesting" {
  depends_on               = [azurerm_resource_group.rg-testing]
  name                     = "examplestoracc1321"
  resource_group_name      = "Ashsis"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_resource_group" "rg-testing1" {
  name     = "Ashsis1"
  location = "West Europe"
}