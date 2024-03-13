# 14 Creamos el AKS 
resource "azurerm_kubernetes_cluster" "az_mra_aks" {
    name                = "az_AKS"
    location            = azurerm_resource_group.az_mra_rg.location
    resource_group_name = azurerm_resource_group.az_mra_rg.name
    kubernetes_version  = "1.27.9"
    dns_prefix          = "azakcluster"

    default_node_pool {
        name            = "default"
        node_count      = 1
        vm_size         = "Standard_B2ms"
    }

    identity {
      type = "SystemAssigned"
    }

    tags = {
      Environment = "CP2"
    }
}