# 9 Security Group
resource "azurerm_network_security_group" "az_mra_mySecGroup"{
	name			= "sshtraffic"
	location		= azurerm_resource_group.az_mra_rg.location
	resource_group_name	= azurerm_resource_group.az_mra_rg.name
	
	security_rule{
		name				= "SSH"
		priority			= 1001
		direction			= "Inbound"
		access				= "Allow"
		protocol			= "Tcp"
		source_port_range		= "*"
		destination_port_range		= "22"
		source_address_prefix		= "*"
		destination_address_prefix	= "*"
	}
	tags={
	  enviroment="CP2"
  }
}

# 10 Link Security Group to NIC
resource "azurerm_network_interface_security_group_association" "az_mra_mySecGroupAssociation1"{
	network_interface_id		= azurerm_network_interface.az_mra_nic1.id
	network_security_group_id	= azurerm_network_security_group.az_mra_mySecGroup.id
}

