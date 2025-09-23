terraform {
  required_version = ">= 1.5.0"
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.84.0"
    }
  }
}

provider "proxmox" {

  endpoint = var.virtual_environment_endpoint
  api_token = "terraform-prov@pve!terraform=41990a19-643a-416b-afee-18f3f703b7f5"
  username = "root@pam"
  password = "popopopopopo"
  insecure  = true
  ssh {
    agent = true
  }

  # SÉCURITÉ MAX : laisse à false (cert valide exigé)
  # Si ton cert n’est pas valide pour l’IP, passe provisoirement à true le temps de corriger ton TLS.

}
