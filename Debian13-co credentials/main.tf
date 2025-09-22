resource "proxmox_virtual_environment_vm" "debian13" {
  name      = "debian13-tf"
  node_name = "proxmoxald"
  tags      = ["terraform", "debian13"]

  clone {
    vm_id = 9999
    full  = true             # retire cette ligne pour un linked clone (plus rapide) si ton storage le permet
  }

  cpu {
    sockets = 1
    cores   = 2
  }

  memory {
    dedicated = 2048
  }

  disk {
    datastore_id = "local-lvm"  # <= là où tu veux le disque de la VM
    size         = 30
    interface    = "scsi0"
    iothread     = true
    discard      = "on"
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  agent {
    enabled = true
  }

  initialization {
    datastore_id = "local-lvm"  # <= où sera le drive cloud-init

    user_account {
      username = "admin"
      password = "popopopopopo"
    }

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    # <<< IMPORTANT : on référence le snippet Cloud-Init >>>
    user_data_file_id = proxmox_virtual_environment_file.cloudinit_user_data.id
  }

  started = true
}
