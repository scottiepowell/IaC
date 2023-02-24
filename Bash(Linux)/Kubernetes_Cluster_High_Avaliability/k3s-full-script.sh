#!/bin/bash

# script 2 - install master nodes
KVVERSION="v0.5.7"

# Set the IP addresses of the master and work nodes
master1=192.168.2.30
master2=192.168.2.31
master3=192.168.2.32
worker1=192.168.2.33
worker2=192.168.2.34

# Set the virtual IP address (VIP)
vip=192.168.2.50

# Array of master nodes
masters=($master2 $master3)

# Array of worker nodes
workers=($worker1 $worker2)

# Step 0: Uninstall k3s binary,server and data
#source ./remote-ssh-uninstall.sh

# Step 1: Install the first master node
sudo k3sup install \
    --ip $master1 \
    --tls-san $vip \
    --cluster \
    --ssh-key $HOME/.ssh/id_rsa \
    --user scott \
    --local-path $HOME/.kube/config \
    --context k3s-HA \
    --no-extras \
    --k3s-extra-args "--flannel-iface=eth0 --disable servicelb --node-ip $master1"

# Step 2:  set the cluster, context and user with kubectl
sudo kubectl config set-context k3s-HA --cluster=default --user=k3s-HA  
# Verify the config changes
sudo kubectl config view --raw
# Pull docker image for kube-vip
sudo ctr image pull docker.io/plndr/kube-vip:main
# Verify that the context k3s-ha is valid
sudo kubectl config use-context k3s-HA

# Verify the config changes
kubectl config view --raw

# Verify that the context k3s-ha is valid
kubectl config use-context k3s-HA

# Step 3: Download the mainfest for kube-vip and apply it to the cluster
kubectl --context k3s-HA apply -f https://kube-vip.io/manifests/rbac.yaml

# Step 4: Download the desired version of kube-vip from docker registry for the first master node
# Step 5: Create an alias for the Kube-VIP command
# Step 6: Setup the manifest daemonset
source $HOME/projects/IaC/proxmox/proxmox-ansible-k3s/scripts/remote-ssh-kube-vip-pull.sh

# Step 7: Add remaining nodes using k3sup
for master in "${masters[@]}"; do
  k3sup join \
    --ip $master \
    --user scott \
    --sudo \
    --k3s-channel stable \
    --ssh-key /home/scottie/.ssh/id_rsa \
    --server \
    --server-ip $vip \
    --server-user scott \
    --sudo 
    --k3s-extra-args "--flannel-iface=eth0 --disable servicelb --node-ip $master"
done

# Step 8: Edit the local kubeconfig file to point to the kube-vip IP address
sudo sed -i 's/https:\/\/192.168.2.30:6443/https:\/\/192.168.2.50:6443/g' ~/.kube/config

# Step 9: Add worker nodes to the cluster
for worker in "${workers[@]}"; do
  k3sup join \
    --ip $worker \
    --user scott \
    --ssh-key $HOME/.ssh/id_rsa \
    --sudo \
    --k3s-channel stable \
    --server-ip $vip \
    --server-user scott \
    --sudo 
done

echo "script complete"
kubectl get nodes -o wide