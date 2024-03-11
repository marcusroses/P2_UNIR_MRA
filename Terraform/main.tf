# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
# https://github.com/hashicorp/terraform-provider-azurerm

# 1. Especificamos la versión del proveedor AzureRM que se utilizará
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.0.1"
    }
  }
}

# 2. Configuramos el proveedor de AzureRM 
provider "azurerm" {
  # The AzureRM Provider supports authenticating using via the Azure CLI, a Managed Identity
  # and a Service Principal. More information on the authentication methods supported by
  # the AzureRM Provider can be found here:
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#authenticating-to-azure

  # The features block allows changing the behaviour of the Azure Provider, more
  # information can be found here:
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/features-block
  features {}
}

# 3. Creamos un grupo de recursos, con la localizacioon
# definida como variable en el fichero vars.tf
resource "azurerm_resource_group" "az_mra_rg" {
  name     = "resource_group_cp2"
  location = var.location
  tags={
  	enviroment="CP2"
  }
}

# 4. Creamos la cuenta de almacenaje, asociandola al grupo
# de recursos definido en el punto 3, así como la localizacion
resource "azurerm_storage_account" "az_mra_stAccount" {
  name                		= "storageaccountcp2"
  resource_group_name 		= azurerm_resource_group.az_mra_rg.name
  location            		= azurerm_resource_group.az_mra_rg.location
  account_tier	      		= "Standard"
  account_replication_type 	="LRS"
  
  tags={
	  enviroment="CP2"
  }
}
