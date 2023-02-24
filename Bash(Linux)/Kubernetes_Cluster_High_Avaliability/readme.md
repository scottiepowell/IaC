The provided bash script is used to install a Kubernetes cluster with high availability (HA) using k3s as the Kubernetes distribution. It installs the k3s master nodes on three separate machines with the IP addresses defined as `master1`, `master2`, and `master3`, and the worker nodes on two separate machines with the IP addresses defined as `worker1` and `worker2`.

The script uses the `k3sup` tool to install and join nodes to the cluster. `k3sup` is a lightweight tool that can be used to bootstrap a K3s cluster over an SSH connection.

Additionally, this script uses the `kube-vip` tool to set up a virtual IP address (VIP) that will be shared among the three master nodes in the cluster. `kube-vip` is a tool that provides a virtual IP address for the Kubernetes control plane to enable high availability. In this case, `kube-vip` is used to enable the virtual IP address for the control plane of the k3s cluster.

To use this script, you need to update the values of the IP addresses for the master and worker nodes, as well as the VIP to match your environment. Once you have updated the IP addresses, you can execute the script to create a highly available Kubernetes cluster.

To execute the script, navigate to the directory where the script is saved and run the following command:

`$ bash k3s-master-nodes.sh`

This will run the script and start the installation process.

Note that before running this script, you will need to have passwordless SSH access to the master and worker nodes, and you will need to have the `k3sup` and `kubectl` tools installed on the machine where you will run the script. Additionally, this script assumes that you have set up a user with sudo access on the master and worker nodes.

## `remote-ssh-kube-vip-pull.sh`

This script runs a single command on the remote server with public key authentication to download the desired version of the kube-vip image from the Docker registry. The script also sets up the manifest daemonset for kube-vip and writes it to the appropriate location.

The variables used in the script include the path to the SSH key file (`keyfile`), the IP address of the master node (`master1`), the version of kube-vip to be downloaded (`KVVERSION`), the command to be run for kube-vip (`kube_vip_command`), and the virtual IP address for the cluster (`vip`).

To use this script, copy it to the location where you want to run it and update the variables to match your environment. Then, run the script from the command line. Note that you must have public key authentication set up for the `ssh` command to work correctly.