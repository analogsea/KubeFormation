cd "${0%/*}"

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <context-name> <cluster-name> <cluster-admin-username>"
  exit 1
fi

ansible-playbook -i inventory.yaml fetch_kube_config_append.yaml -e "context_name=$1 cluster_name=$2 cluster_admin_username=$3"
