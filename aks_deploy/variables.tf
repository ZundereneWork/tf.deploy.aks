variable "name" {
  description = "Name of the virtual network"
  type        = string
}

variable "loc" {
  description = "Location of the virtual network"
  type        = string
}

variable "cont" {
  description = "Count of the virtual network"
  type        = number
}

variable "aks_network_cidr" {
  description = "CIDR block for the virtual network"
  type        = list(string)
}

variable "location" {
  description = "Location of the resource"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}