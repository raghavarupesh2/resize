terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "888e7a98-44ab-4dc4-b0d3-a14548e8ab06"
  client_id       = "a438a500-936e-447e-9805-56ec1486f693"
  client_secret   = "M-w8Q~wYT12cJOOsWR3X8TfUd3zayN4jjLspgc_y"
  tenant_id       = "8db82701-72d0-4f39-8c59-2ed0fca9595e"
}

