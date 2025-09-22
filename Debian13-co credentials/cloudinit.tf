# --- Snippet Cloud-Init pour installer le qemu-guest-agent ---
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
    EOF
  }
}
