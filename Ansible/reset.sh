cd "${0%/*}"
ansible-playbook -i inventory.yaml reset.yaml
