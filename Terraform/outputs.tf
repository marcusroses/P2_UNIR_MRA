# Variables utilizadas para obtener valores de los recursos desplegados

output "resource_group_name" {
  value = azurerm_resource_group.az_mra_rg.name
}

output "vm_ip_address" {
  value = azurerm_linux_virtual_machine.myVM1.private_ip_address
}

output "vm_ip_public_address" {
  value = azurerm_linux_virtual_machine.myVM1.public_ip_address
}


# output "kubernetes_cluster_name" {
#   value = azurerm_kubernetes_cluster.az_mra_aks.name
# }

# output "host" {
#   value = azurerm_kubernetes_cluster.default.kube_config.0.host
# }

# output "client_key" {
#   value = azurerm_kubernetes_cluster.default.kube_config.0.client_key
# }

# output "client_certificate" {
#   value = azurerm_kubernetes_cluster.default.kube_config.0.client_certificate
# }

# output "kube_config" {
#   value = azurerm_kubernetes_cluster.default.kube_config_raw
# }

# output "cluster_username" {
#   value = azurerm_kubernetes_cluster.default.kube_config.0.username
# }

# output "cluster_password" {
#   value = azurerm_kubernetes_cluster.default.kube_config.0.password
# }