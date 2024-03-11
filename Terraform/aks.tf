# 14 Creamos el AKS 
resource "azurerm_kubernetes_cluster" "az_mra_aks" {
    name                = "azMraAKS"
    location            = azurerm_resource_group.az_mra_rg.location
    resource_group_name = azurerm_resource_group.az_mra_rg.name
    dns_prefix          = "exampleaks"
    kubernetes_version  = "1.19.11"

    default_node_pool {
        name            = "default"
        node_count      = 1
        vm_size         = "Standard_DS2_v2"
        os_disk_size_gb = 30
    }

    /*
    service_principal {
        client_id     = "your_client_id"
        client_secret = "your_client_secret"
    }
    */
    tags = {
    Environment = "CP2"
    }
}