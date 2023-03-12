# Define Terraform provider
terraform {
  required_version = ">= 1.3"
  backend "azurerm" {
    resource_group_name  = "__RG__"
    storage_account_name = "__STA__"
    container_name       = "__CONTAINER__"
    key                  = "__TFSTATE__"
  }

  required_providers {
    azurerm = {
      version = "~>3.2"
      source  = "hashicorp/azurerm"
    }
  }
}
# Configure the Azure provider
provider "azurerm" { 
  features {}  
}


module "Vnet" {
    source = "git::https://github.com/ZundereneWork/tf.modules.git//Vnet"

    name                = var.name
    loc                 = var.loc
    cont                = var.cont 
    aks_network_cidr    = var.aks_network_cidr
    location            = var.location
    resource_group_name = var.resource_group_name


    
}