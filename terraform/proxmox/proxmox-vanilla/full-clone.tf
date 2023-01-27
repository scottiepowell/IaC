# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "proxmox-tf-vanilla" {

    # number of virtual machines to Create
    count = 5

    # VM General Settings
    target_node = "proxmox"
    vmid = "${var.vmid}${count.index}"
    name = "${var.vm_name}${count.index}"
    desc = "${var.vm_desc}${count.index}"

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = "template-ubuntu-20.04"

    # VM System Settings
    agent = 1
    
    # VM CPU Settings
    cores = 2
    sockets = 1
    cpu = "host"    
    
    # VM Memory Settings
    memory = 2048
    balloon = 512

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    # VM Disk Settings
    disk {
        storage ="stor-4tb-prox1"
        type = "scsi"
        size = "32G"
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    ipconfig0 = "ip=${var.public_ip}${count.index}/24,gw=192.168.2.1"
    nameserver = "1.1.1.1"

    # (Optional) Default User
    ciuser = "scott"
    
    # (Optional) Add your SSH KEY
    sshkeys = var.ssh_public_key
    ssh_private_key = var.ssh_private_key
    ssh_user = "scott"

    connection {
    type        = "ssh"
    user        = self.ssh_user
    private_key = var.ssh_private_key
    host        = self.ssh_host
    port        = self.ssh_port
    }

    provisioner "file" {
        source = "/home/scottie/projects/IaC/proxmox/proxmox-vanilla/scripts"
        destination = "/tmp/"        
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/scripts/ubuntu-update.sh",
            "/tmp/scripts/ubuntu-update.sh",  
        ]
    }
}

