variable "pm_api_url"      { type = string }
variable "pm_token_id"     { type = string } # ex: "terraform@pve!tf"
variable "pm_token_secret" { type = string   sensitive = true }
variable "node"            { type = string   default = "pve01" }
variable "datastore"       { type = string   default = "local-lvm" }
variable "bridge"          { type = string   default = "vmbr0" }
variable "template_id"     { type = number   default = 9000 }
variable "vm_name"         { type = string   default = "dev-01" }
variable "ssh_pubkey_path" { type = string   default = "~/.ssh/id_ed25519.pub" }
