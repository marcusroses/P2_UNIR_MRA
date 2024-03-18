# Repo de código relativo al Caso Práctico 2 - DevOps&Cloud - UNIR - 2023/24

Este repositorio incluye el código relativo al Caso Práctico 2 del curso DevOps&Cloud de UNIR. El código se estructura en dos carpertas:

- __Terraform__: Contiene los ficheros Terrafom relativos al despliegue de la infraestructura mediante Terraform.

- __Ansible__: Contiene los ficheros "inventory" y distintos "playbooks" de Ansible utilizados para distintas tareas:
  
  - Una tarea simple de conectar a la VM de Azure para cambiar la zona horaria
  - Tareas para obtener las variables de retorno de Terraform e intentar asociarlas a un fichero de variables
  - Tareas para instalar Podman en la VM de Azure
  - Tareas para descargar una imagen de un servidor web de Apache de un repositorio de imágenes público, renombrarla y subirla al repositorio de imágenes de contenedor (ACR) de Azure
  - Tareas para descargar una imagen de un Redis de un repositorio de imágenes público, renombrarla y subirla al repositorio de imágenes de contenedor (ACR) de Azure
  - Tareas para descargar una imagen de la aplicación Azure Frontal que cuenta perros y gatos de un repositorio de imágenes público, renombrarla y subirla al repositorio de imágenes de contenedor (ACR) de Azure
  - Tareas para creación de un contenedor Podman
  - Tareas para el arranque de un contenedor Podman creado mapeando los puertos para que sea accesible a través de la IP pública de la máquina virtual de Azure.
