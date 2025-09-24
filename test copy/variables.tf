variable "datastore_id" {
  default = "local-lvm"
}
variable "virtual_environment_node_name" {
  default = "proxmoxald"
}
variable "endpoint" {
  default = "https://192.168.8.24:8006/api2/json"
}
variable "address" {
  default = "dhcp"  
}
variable "name" {
  default = "alma9-clone"  
}