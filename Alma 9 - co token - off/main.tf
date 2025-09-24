# Snippet (inchangé)
resource "proxmox_virtual_environment_file" "user_data_cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = "proxmoxald"

  source_raw {
    file_name = "user-data-cloud-config.yaml"
    data = <<-EOF
      #cloud-config
      hostname: test-alma
      timezone: Europe/Paris
      users:
        - name: almalinux
          groups: [ wheel ]
          shell: /bin/bash
          sudo: ALL=(ALL) NOPASSWD:ALL
          ssh_authorized_keys:
            - ${trimspace(data.local_file.ssh_public_key.content)}
      ssh_pwauth: false
      package_update: true
      packages: [ qemu-guest-agent, net-tools, curl ]
      runcmd:
        - systemctl enable --now qemu-guest-agent || true
        - echo "done" > /tmp/cloud-config.done
    EOF
  }
}

# VM Alma 9 en DHCP — CLONE du template 9009
resource "proxmox_virtual_environment_vm" "alma9_vm" {
  name      = "test-alma9"
  node_name = "proxmoxald"

  clone { vm_id = 9009 }   # 👈 on clone le template créé à la main

  agent  { enabled = true }
  cpu    { cores = 2 }
  memory { dedicated = 2048 }

  initialization {
    datastore_id      = "local-lvm"
    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id
    ip_config { ipv4 { address = "dhcp" } }   # DHCP
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }
}
