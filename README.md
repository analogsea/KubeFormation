# KubeFormation
Kubernetes on OpenStack for impatient people. Infrastructure as Code.

## Terraform
Single master for now.
**Source your openrc file before running terraform apply!**

## Ansible
Ansible options:
- skip_prereqs: Skips grabbing packages
- apply_BGP: Optionally enables Calico BGP
- skip_join: Skips nodes joining the Kubernetes cluster
- print_token: Optionally prints the kubeadm join command for debugging
- untaint_master: Optionally untaints the master for a single node
