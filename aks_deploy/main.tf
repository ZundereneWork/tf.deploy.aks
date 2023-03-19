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

data "azurerm_container_registry" "skv" {
  name                = var.nameContainerRegistry
  resource_group_name = var.resource_group_name
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

module "subnet" {
  depends_on = [module.Vnet]
  source = "git::https://github.com/ZundereneWork/tf.modules.git//Subnet"

  name                = var.name
  loc                 = var.loc 
  cont                = var.cont  
  resource_group_name = var.resource_group_name
  aks_network_cidr    = var.aks_network_cidr
  virtual_network_name = "${var.name}-vnet-${var.loc}-${var.cont}"

}

module "aks" {
   depends_on = [module.subnet]
   source = "git::https://github.com/ZundereneWork/tf.modules.git//Aks"

  name                = var.name
  loc                 = var.loc
  location            = var.location
  cont                = var.cont
  resource_group_name = var.resource_group_name
  version_aks         = var.version_aks
  aks_network_cidr    = var.aks_network_cidr
  dns_service_ip      = var.dns_service_ip
  pod_cidr            = var.pod_cidr
  size                = var.size
  numNodes            = var.numNodes
  type                = var.type
  subnet_id           = module.subnet.id
  maxNode             = var.maxNode
  disk_size_gb        = var.disk_size_gb
  client_id           = var.client_id
  client_secret       = var.client_secret
  azurerm_container_registry_id              = data.azurerm_container_registry.akv.id
  list_add_group_ids = var.list_add_group_ids
}