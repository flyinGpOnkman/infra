terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.84.0"
    }
  }
}

provider "proxmox" {
  endpoint  = var.endpoint
  api_token = "terraform@pam!terraform=2377fb9f-0aa4-49ad-95f5-c628763e795f"
  insecure  = true
  ssh {
    agent    = true
    username = "root@pam"
  }
}