cd "${0%/*}"
ansible-playbook -i inventory.yaml run.yaml -e "skip_prereqs=yes"
