terraform {
  backend "azurerm" {
    resource_group_name  = "Terraformrg"
    storage_account_name = "terragit"
    container_name       = "terrastate"
    key                  = "terrastate/terraform.tfstate"
  }
}