cd "${0%/*}"

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <name>"
  exit 1
fi

kubectl config delete-cluster $1
kubectl config delete-context $1
kubectl config unset users.$1-admin
