cd "${0%/*}"
ansible-playbook -i inventory.yaml fetch_kube_config_overwrite.yaml
