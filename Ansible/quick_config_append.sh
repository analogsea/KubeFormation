cd "${0%/*}"

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <name>"
  exit 1
fi

ansible-playbook -i inventory.yaml fetch_kube_config_append.yaml -e "context_name=$1 cluster_name=$1 cluster_admin_username=$1-admin"
