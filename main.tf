resource "proxmox_virtual_environment_vm" "vm" {
  name        = var.vm_name
  node_name   = var.node
  description = "Managed by Terraform"
  tags        = ["dev", "tf"]

  clone {
    vm_id = var.template_id
    full  = true
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  disk {
    interface    = "scsi0"
    size         = "20"
    datastore_id = var.datastore
  }

  network_device {
    bridge = var.bridge
  }

  agent {
    enabled = true
  }

  initialization {

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      username = "devops"
      # password = "ChangeMe123!"  # si tu veux un mot de passe (sinon clé SSH only)
      keys = [file(var.ssh_pubkey_path)]
    }
  }
}

output "vm_id" {
  value = proxmox_virtual_environment_vm.vm.vm_id
}

output "vm_node" {
  value = proxmox_virtual_environment_vm.vm.node_name
}
