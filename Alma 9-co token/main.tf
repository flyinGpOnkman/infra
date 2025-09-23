resource "proxmox_virtual_environment_vm" "alma9" {
  vm_id     = var.vm_id
  name      = var.vm_name
  node_name = var.pve_node
  started   = true
  on_boot   = true
  tags      = ["alma9","cloudinit","terraform"]

  clone {
    vm_id = 9999
    full  = true
  }

  cpu {
    cores = var.cpu_cores
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = var.memory_mb
  }

  scsi_hardware = "virtio-scsi-single"

  network_device {
    bridge = var.bridge
    model  = "virtio"
  }

  serial_device {}

  agent {
    enabled = true
  }

  initialization {


    ip_config {
      ipv4 {
        address = "dhcp"
        gateway = var.ipv4_gw
      }
    }
  }
}