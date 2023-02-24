resource "null_resource" "ubuntu-script" {
    depends_on = [
    proxmox_vm_qemu.proxmox-tf-vanilla
  ]
  count = var.vm_count

  connection {
      type        = "ssh"
      host        = element(var.public_ip, count.index)
      user        = var.ssh_user
      private_key = var.ssh_private_key
    }

   provisioner "file" {
      source = "/home/scottie/projects/IaC/proxmox/proxmox-vanilla/scripts"
      destination = "/tmp/"        
    }

   provisioner "remote-exec" {
      inline = [
            "chmod +x /tmp/scripts/ubuntu-update.sh",
            "chmod 755 /tmp/scripts/",
            "chmod +x /tmp/scripts/sudo-passwordless.sh",
            "/tmp/scripts/ubuntu-update.sh",
        ]
    }
}
resource "null_resource" "docker_install" {
    depends_on = [
    proxmox_vm_qemu.proxmox-tf-vanilla,
    null_resource.ubuntu-script
  ]
  count = var.vm_count

  connection {
      type        = "ssh"
      host        = element(var.public_ip, count.index)
      user        = var.ssh_user
      private_key = var.ssh_private_key
    }
    
   provisioner "file" {
      source = "/home/scottie/projects/IaC/proxmox/proxmox-vanilla/scripts"
      destination = "/tmp/"        
    }

   provisioner "remote-exec" {
      inline = [
            "chmod +x /tmp/scripts/docker-install.sh",
            "chmod 755 /tmp/scripts/",
            "/tmp/scripts/docker-install.sh",
        ]
    }
}
resource "null_resource" "k3s_uninstall" {
    depends_on = [
    proxmox_vm_qemu.proxmox-tf-vanilla,
    null_resource.ubuntu-script,
    null_resource.docker_install
  ]
  count = var.vm_count

  connection {
      type        = "ssh"
      host        = element(var.public_ip, count.index)
      user        = var.ssh_user
      private_key = var.ssh_private_key
    }
    
   provisioner "file" {
      source = "/home/scottie/projects/IaC/proxmox/proxmox-ansible-k3s/scripts"
      destination = "/tmp/"        
    }

   provisioner "remote-exec" {
      inline = [
            "chmod +x /tmp/scripts/k3s-uninstall.sh",
            "chmod 755 /tmp/scripts/",
            "/tmp/scripts/k3s-uninstall.sh",
        ]
    }
}