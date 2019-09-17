cd "${0%/*}"
ansible-playbook -i inventory.yaml run.yaml
