# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "proxmox-tf-vanilla" {

    # number of virtual machines to Create
    count = var.vm_count

    # VM General Settings
    target_node = "proxmox"
    vmid = element(var.vmid, count.index)
    name = element(var.vm_name, count.index)
    desc = "${var.vm_desc}"

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = "template-ubuntu-20.04"

    # VM System Settings - quem agent set to true
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
        storage ="local-lvm"
        type = "scsi"
        size = "32G"
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway

    ipconfig0 = "ip=${element(split(",", element(var.public_ip, count.index)), 0)}/24,gw=192.168.2.1"
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
}




