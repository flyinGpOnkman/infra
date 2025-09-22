terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.84.0"
    }
  }
}

provider "proxmox" {
  endpoint = "https://192.168.8.24:8006"
  username = var.pm_username
  password = var.pm_password  
  insecure = true               
}
