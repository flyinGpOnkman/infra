terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.84.0"
    }
  }
}

provider "proxmox" {
  endpoint  = var.virtual_environment_endpoint
  username = var.username
  password = var.password
  insecure  = true
  ssh {
    agent    = true
    username = "root"
  }
}