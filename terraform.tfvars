# Informations de base
resource_group_name = "debian13-test"
location            = "francecentral"

# Paramètres de la VM
vm_name         = "vm-debian13-1"
vm_size         = "Standard_B1s"
os_disk_size_gb = 30

# Image Debian 13
image_publisher = "debian"
image_offer     = "debian-13"
image_sku       = "13-gen2"
image_version   = "latest"

# Utilisateur de connexion
admin_username = "adminuser"

# Tag
environment_tag = "devops"

pm_api_url  = "https://192.168.8.24:8006/"
pm_username = "root@pam"
pm_password = "popopopopopo"