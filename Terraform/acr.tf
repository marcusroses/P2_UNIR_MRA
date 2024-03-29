
# 12 Creamos el ACR
resource "azurerm_container_registry" "az_mra_acr" {
    name                     = "azMraACR"
    resource_group_name      = azurerm_resource_group.az_mra_rg.name
    location                 = azurerm_resource_group.az_mra_rg.location
    sku                      = "Basic"
    admin_enabled            = true
}

# 13 Especificamos que el ACR tenga acceso público para poder copoiar las imágenes
resource "azurerm_role_assignment" "acr_public_access" {
  scope                = azurerm_container_registry.az_mra_acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.az_mra_aks.kubelet_identity[0].object_id
}
