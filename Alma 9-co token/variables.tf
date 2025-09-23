variable "virtual_environment_endpoint" {
  type        = string
  description = "Proxmox API endpoint (https://host:8006/). Use IP if you don't want DNS."
  default     = "https://192.168.8.24:8006/"
}

variable "api_token" {
  type        = string
#  sensitive   = true
  description = "API token USER@REALM!TOKENID=SECRET (set via TF_VAR_virtual_environment_api_token)"
#  default = "terraform-prov@pve!terraform=41990a19-643a-416b-afee-18f3f703b7f5"
}

variable "pve_node" {
  type        = string
  description = "Exact node name as shown in PVE UI (not resolved by DNS here)"
  default     = "proxmoxald"
}

variable "datastore_iso" {
  type        = string
  description = "Datastore for downloading the cloud image (content=iso or import)."
  default     = "local"
}

variable "datastore_disks" {
  type        = string
  description = "Datastore to hold VM disks (e.g., local-lvm, rpool)."
  default     = "local-lvm"
}

variable "vm_name" {
  type        = string
  default     = "alma9-ci"
}

variable "vm_id" {
  type        = number
  default     = 100
}

variable "cpu_cores" {
  type        = number
  default     = 2
}

variable "memory_mb" {
  type        = number
  default     = 2048
}

variable "disk_gb" {
  type        = number
  default     = 20
}

variable "bridge" {
  type        = string
  default     = "vmbr0"
}

variable "ipv4_gw" {
  type        = string
  description = "IPv4 gateway"
  default     = "192.168.8.1"
}

variable "ssh_pubkey" {
  type        = string
  description = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPAsHW3eCtTzZGwYv41RquzGc43tPz5Xk9AlJJ3zxSUx yann.allard@cgx-group.com"
}
