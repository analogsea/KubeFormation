cd "${0%/*}"
ansible-playbook -i inventory.yaml ceph-prereqs.yaml
