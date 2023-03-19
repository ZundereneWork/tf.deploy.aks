name = "troy"
loc = "west"
cont = "001"
aks_network_cidr = ["10.0.0.1/24"]
location = "westeurope"
nameContainerRegistry = "troyskvweu001"
resource_group_name = "troyrgwest001"
version_aks = "1.22.7"
service_cidr = "10.0.0.0/16"
dns_service_ip = "10.0.0.10"
pod_cidr = "10.244.0.0/16"
size = "Standard_B2s"
numNodes = 1
type = "VirtualMachineScaleSets"
#subnet_id = "/subscriptions/__SUBSCRIPTION__/resourceGroups/<resource_group_name>/providers/Microsoft.Network/virtualNetworks/<vnet_name>/subnets/<subnet_name>"
maxNode = 1
disk_size_gb = 64
#aget_pool_subnet_id = "/subscriptions/__SUBSCRIPTION__/resourceGroups/<resource_group_name>/providers/Microsoft.Network/virtualNetworks/<vnet_name>/subnets/<subnet_name>"
network_plugin = "azure"
load_balance_sku = "standard"
outbound_type = "loadBalancer"
network_policy = "calico"
ip_range_pod = "10.244.0.0/16"
client_id = "__CLIENT_ID_AKS__"
client_secret = "__CLIENT_SECRET_AKS__"
#azurerm_container_registry_id = "/subscriptions/<subscription_id>/resourceGroups/<resource_group_name>/providers/Microsoft.ContainerRegistry/registries/<acr_name>"
list_add_group_ids = ["6e01d1a1-7880-40d7-bdc0-5c7cdb7094cd"]