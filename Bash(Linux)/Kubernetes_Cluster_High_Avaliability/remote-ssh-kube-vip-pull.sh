#!/bin/bash

# Define the variables
keyfile="~/.ssh/id_rsa"
master1="192.168.2.30"
KVVERSION="v0.5.7"
kube_vip_command="docker run --network host --rm ghcr.io/kube-vip/kube-vip:$KVVERSION"
vip="192.168.2.50"

# SSH into the server with public key authentication
ssh -i "$keyfile" scott@"$master1" <<- EOF
  # download the desired version of kube-vip from docker registry
  sudo ctr image pull docker.io/plndr/kube-vip:main
  echo "image pull complete"
  # Step 5: Create an alias or use variable for the Kube-VIP command
  echo $kube_vip_command
  # Step 6: Setup the manifest daemonset
  $kube_vip_command manifest daemonset \
    --arp \
    --interface eth0 \
    --address $vip \
    --controlplane \
    --leaderElection \
    --taint \
    --inCluster | sudo tee /var/lib/rancher/k3s/server/manifests/kube-vip.yaml
EOF


