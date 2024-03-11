# 0. Definimos las variables "location" y "vm_size"
variable "location"{
	type=string
	description = "Region de Azure donde crearemos la infraestructura"
	default = "northeurope"
	/*
	#AZ CLI
	#az account list-locations -o table
	*/
}

variable "vm_size"{
	type=string
	description="Tamaño de la máquina virtual"
	default="Standard_B2ms"
	/*
	#AZ CLI
	# az vm list-sizes --location northeurope --output table
	*/	
}