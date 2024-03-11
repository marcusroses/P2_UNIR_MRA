# 5. Creamos la red virtual
resource "azurerm_virtual_network" "az_mra_network" {
	name                = "virtual_network_cp2"
    address_space       = ["10.0.0.0/16"]
	location			= azurerm_resource_group.az_mra_rg.location
	resource_group_name	= azurerm_resource_group.az_mra_rg.name
	tags={
	  enviroment="CP2"
  }
}
	
# 6. Creamos la subred
resource "azurerm_subnet" "az_mra_subnet"{
	name					= "terraform_subnet_cp2"
	resource_group_name		= azurerm_resource_group.az_mra_rg.name
	virtual_network_name	= azurerm_virtual_network.az_mra_network.name
	address_prefixes		= ["10.0.1.0/25"]
}

# 7. Creamos el NIC 
resource "azurerm_network_interface" "az_mra_nic1"{
	name				= "vm_nic_1_cp2"
	location			= azurerm_resource_group.az_mra_rg.location
	resource_group_name	= azurerm_resource_group.az_mra_rg.name
	
	ip_configuration{
		name							= "my_ipconfiguration_1_cp2"
		subnet_id						= azurerm_subnet.az_mra_subnet.id
		private_ip_address_allocation	= "Static"
		private_ip_address				= "10.0.1.10"
		public_ip_address_id			= azurerm_public_ip.az_mra_my_Public_Ip_1.id
	}
	tags={
	  enviroment="CP2"
  }
}

# 8. Creamos la IP Publica
resource "azurerm_public_ip" "az_mra_my_Public_Ip_1"{
	name			= "vmip1_cp2"
	location		= azurerm_resource_group.az_mra_rg.location
	resource_group_name	= azurerm_resource_group.az_mra_rg.name
	allocation_method	= "Dynamic"
	sku			= "Basic"
	
	tags={
	  enviroment="CP2"
  }
}
