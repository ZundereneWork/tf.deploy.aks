# Define Terraform provider
terraform {
  required_version = ">= 1.3"
  backend "azurerm" {
    resource_group_name  = __rg__
    storage_account_name = __sta__
    container_name       = __container__
    key                  = __tfstate__
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
    source = "https://github.com/ZundereneWork/tf.modules.git/Aks"

    name                = var.name
    loc                 = var.loc
    count               = var.count 
    aks_network_cidr    = var.aks_network_cidr
    location            = var.location
    resource_group_name = var.resource_group_name


    
}