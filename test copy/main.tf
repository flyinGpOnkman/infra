resource "proxmox_virtual_environment_vm" "ubuntu_clone" {
  name      = "alma9-clone"
  node_name = "proxmoxald"

  clone {
    vm_id = "9009"
  }

  agent {
    enabled = false
  }

  memory {
    dedicated = 768
  }

  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
}

output "vm_ipv4_address" {
  value = "dhcp"
}