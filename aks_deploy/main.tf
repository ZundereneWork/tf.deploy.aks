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

module "subnet" {
  depend_on = [module.Vnet]
  source = "git::https://github.com/ZundereneWork/tf.modules.git//Subnet"

  name                = var.name
  loc                 = var.loc 
  cont                = var.cont  

}

module "aks" {
   depend_on = [module.subnet]
   source = "git::https://github.com/ZundereneWork/tf.modules.git//aks"

  name                = var.name
  location            = var.loc
  resource_group_name = var.resource_group_name
  version_aks         = var.version_aks
  service_cidr        = var.service_cidr
  dns_service_ip      = var.dns_service_ip
  pod_cidr            = var.pod_cidr
  size                = var.size
  node_count          = var.numNodes
  vm_type             = var.type
  subnet_id           = module.subnet.id
  max_pods            = var.maxNode
  os_disk_size_gb     = var.disk_size_gb
  agent_subnet_id     = module.subnet.id
  network_plugin      = var.network_plugin
  load_balancer_sku   = var.load_balance_sku
  outbound_type       = var.outbound_type
  network_policy      = var.network_policy
  pod_ip_range        = var.ip_range_pod
  client_id           = var.client_id
  client_secret       = var.client_secret
  acr_id              = var.azurerm_container_registry_id
  admin_group_object_ids = var.list_add_group_ids
}