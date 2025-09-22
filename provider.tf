terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.84.0"
    }
  }
}

provider "proxmox" {
  # Configuration options
}

provider "proxmox" {
  endpoint = "https://192.168.8.24:8006/"
  insecure = true
  username = "root@realm"
  password = "popopopopopo"
}