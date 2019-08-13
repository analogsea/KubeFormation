# KubeFormation
Kubernetes on OpenStack for impatient people. Infrastructure as Code.

## Ansible
Ansible options:
- skip_prereqs: Skips grabbing packages
- apply_BGP: Optionally enables Calico BGP
- skip_join: Skips nodes joining the Kubernetes cluster
- untaint_master: Optionally untaints the master for a single node
