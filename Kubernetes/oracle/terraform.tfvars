compartment_id="ocid1.tenancy.oc1..aaaaaaaao6x7uwzfuasfh5ia5qz4zhw4j7oxl6hkhxq4vc7vdqchyxde3una"
region="us-phoenix-1"
#ssh_public_key="/home/scott/.oci/oci-api-public.pem"
ssh_public_key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCM7O7RZgSUQggM0Ork+AT/C05kVWJE1V52oN0k8kpRwbiLZifAommP+A8zLQq7YEd13ZB38Z6RnaNXzk2Q2AYWRQ02q+CXZb7NO24Z1TttVMujD5Ulhs9e7/yxrQYD5V5lyjUCUWOY8Ip4+GCj9ehhC6uQoZsMoNG1H4NJvHtApNpO9OMT0nE6IwRbPrlKap5aryWG4HgMTytz8WhjMkuYRZwUGu2jDspMuY2XA+UB1952s2O6Hmd2GopegmR/FfxCty1xXzgwioYOGo/VmDea8Q93fzJtK8hJk0i+M8tJN93p3mApiG/ZyGuGieY9Yitv4vdyDvFZbN1lHkpYY6rjLbRj+fB2ryUn8B464x5m+iwoATK0BAfRP68cwslQas+mYqVSKiMKr5y9kmU+NubK5xp4gSc7MvyjC0NS0/lc4CHbRfqcrJdn/kVGp8Rwkl1gEQi5T18I3i1iR8VbLcSEJLIkpldrw+bhAizWpQelYr24qgNn+g/xsUbiftb869k= scott@mobile-coder"
public_subnet_id="ocid1.subnet.oc1.phx.aaaaaaaajjw2o2hl3hr2y75ocifq63clltjlvodhkge2s6scthpr2wcdawyq"
node_pool_id="ocid1.nodepool.oc1.phx.aaaaaaaa7w43i5rzszofyq2ecfvpi6pclsicenu4zdko56fuxnam7ywnezza"

# OCI cluster ID = ocid1.cluster.oc1.phx.aaaaaaaa3fsg6qxzrovpdh3iruguu57r6ajql67ymt4upcrv6c3je7dsolxa
# oci ce cluster create-kubeconfig --cluster-id ocid1.cluster.oc1.phx.aaaaaaaa3fsg6qxzrovpdh3iruguu57r6ajql67ymt4upcrv6c3je7dsolxa --file ~/.kube/free-k8s-config --region us-phoenix-1 --token-version 2.0.0 --kube-endpoint PUBLIC_ENDPOINT
# oci iam compartment list -c ocid1.tenancy.oc1..aaaaaaaao6x7uwzfuasfh5ia5qz4zhw4j7oxl6hkhxq4vc7vdqchyxde3una
# nc -zvw10 158.101.42.249 6443
# /home/scottie/projects/IaC/oci-infra/keys/api/oci-api-priv.pem
# $ oci iam compartment list -c <tenancy-ocid>