variable "pm_api_url" {
  type = string
}

variable "pm_token_id" {
  type = string
}

variable "pm_token_secret" {
  type      = string
  sensitive = true
}

variable "node" {
  type = string
}

variable "datastore" {
  type = string
}

variable "bridge" {
  type = string
}

variable "template_id" {
  type = number
}

variable "vm_name" {
  type = string
}

variable "ssh_pubkey_path" {
  type = string
}
