variable "proxmox_api_url" {
    type = string
}
variable "proxmox_api_token_id" {
    type = string
}
variable "proxmox_api_token_secret" {
    type = string
}
variable "ssh_public_key" {
    type = string
}
variable "root_password" {
    type = string
}
variable "public_ip" {
    type = list(string)
}
variable "ssh_private_key" {
    type = string
}
variable "vmid" {
    type = list(string)
}
variable "vm_name" {
    type = list(string)
}
variable "vm_desc" {
    type = string
}
variable "vm_count" {
    type = number
}
variable "ssh_user" {
    type = string
}
