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

variable "aks_subnet" {
  description = "CIRD block for the virtual network"
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


variable "size" {
  description = "Tamaño de la máquina virtual para el clúster AKS"
  type        = string
}

variable "numNodes" {
  description = "Número de nodos del grupo de nodos AKS"
  type        = number
}

variable "disk_size_gb" {
  description = "Tamaño del disco OS de la máquina virtual para el clúster AKS"
  type        = number
}

variable "kubernetes_version" {
  description = "Versión de Kubernetes para el clúster AKS"
  type        = string
}

variable "client_id" {
  description = "ID del cliente principal"
  type        = string
}

variable "client_secret" {
  description = "Secreto del cliente principal"
  type        = string
}

variable "list_add_group_ids" {
  description = "Lista de IDs de grupo para roles de RBAC"
  type        = list(string)
}


