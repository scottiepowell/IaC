output "vm_ip_0" {
  value = slice(split("/", element(split(",", replace(proxmox_vm_qemu.proxmox-tf-vanilla[0].ipconfig0, "ip=", "")), 0)), 0, 1)[0]
}

output "vm_ip_1" {
  value = slice(split("/", element(split(",", replace(proxmox_vm_qemu.proxmox-tf-vanilla[1].ipconfig0, "ip=", "")), 0)), 0, 1)[0]
}

output "vm_ip_2" {
  value = slice(split("/", element(split(",", replace(proxmox_vm_qemu.proxmox-tf-vanilla[2].ipconfig0, "ip=", "")), 0)), 0, 1)[0]
}

output "vm_ip_3" {
  value = slice(split("/", element(split(",", replace(proxmox_vm_qemu.proxmox-tf-vanilla[3].ipconfig0, "ip=", "")), 0)), 0, 1)[0]
}
output "vm_ip_4" {
  value = slice(split("/", element(split(",", replace(proxmox_vm_qemu.proxmox-tf-vanilla[4].ipconfig0, "ip=", "")), 0)), 0, 1)[0]
}

