terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.54" # ou récent
    }
  }
  required_version = ">= 1.6.0"
}

provider "proxmox" {
  endpoint  = var.pm_api_url              # ex: "https://pve01:8006/"
  api_token = "${var.pm_token_id}=${var.pm_token_secret}"
  insecure  = true                         # ou gérez votre CA
  # utile si vous uploadez des fichiers/snippets via l'API SSH
  # ssh { agent = true  username = "root" }
}
