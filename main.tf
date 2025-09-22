resource "proxmox_virtual_environment_vm" "debian13" {
  name      = "debian13-tf"
  node_name = "pve01"
  tags      = ["terraform","debian13"]

  clone {
    vm_id = 9999
  }

  cpu {
    sockets = 1
    cores   = 2
  }

  memory {
    dedicated = 2048
  }

  disk {
    datastore_id = "local-lvm"
    size         = 30
    interface    = "scsi0"
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  initialization {
    datastore_id = "local-lvm"

    user_account {
      username = "admin"
      password = "SuperSecret123!"
    }

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

  }

  agent {
    enabled = true
  }

  started = true
}
