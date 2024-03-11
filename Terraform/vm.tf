# 11 Creamos la VM
resource "azurerm_linux_virtual_machine" "myVM1" {
  name                      = "my-first-azure-vm"
  resource_group_name       = azurerm_resource_group.az_mra_rg.name
  location                  = azurerm_resource_group.az_mra_rg.location
  size                      = var.vm_size
  admin_username            = "adminUsername"
  network_interface_ids     = [azurerm_network_interface.az_mra_nic1.id]
  disable_password_authentication = true
  admin_password            = "x0ei1892"

  #Se incluye la clave generada
  admin_ssh_key {
    username    = "adminUsername"
    public_key  = file("~/.ssh/id_rsa.pub")
  }

  #Especificamos el tipo de almacenaje
  os_disk {
    caching                = "ReadWrite"
    storage_account_type   = "Standard_LRS"
  }

  #Especificamos la imagen que se quiere utilizar al crear la VM
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  tags={
    enviroment="CP2"
  }
}

