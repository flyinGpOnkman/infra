# --- Snippet Cloud-Init pour installer le qemu-guest-agent et activer la console série ---
resource "proxmox_virtual_environment_file" "cloudinit_user_data" {
  content_type = "snippets"
  datastore_id = "local"         # <= stockage de type 'Directory' qui supporte Snippets
  node_name    = "proxmoxald"

  source_raw {
    file_name = "debian13-user-data.yaml"
    data      = <<-EOF
    #cloud-config
    package_update: true
    packages:
      - qemu-guest-agent
    runcmd:
      - systemctl enable --now qemu-guest-agent
      - echo "ttyS0" >> /etc/securetty
      - sed -i 's/^GRUB_CMDLINE_LINUX="\(.*\)"/GRUB_CMDLINE_LINUX="\1 console=ttyS0"/' /etc/default/grub
      - update-grub
      - systemctl enable serial-getty@ttyS0.service
    EOF
  }
}