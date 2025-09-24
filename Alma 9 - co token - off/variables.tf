variable "virtual_environment_endpoint" {
  type        = string
  description = "Proxmox API endpoint"
  default     = "https://192.168.8.24:8006/"
}

variable "username" {
  type        = string
  description = "Proxmox username"
  default     = "terraform-prov@pve"
}

variable "password" {
  type        = string
  description = "Proxmox password"
  default     = "popopopopopo"
}