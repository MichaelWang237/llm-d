helmfile=$1
ns=$2

if [ -z "$helmfile" ]; then
  echo "Usage: $0 <helmfile>"
  exit 1
fi
if [ -z "$ns" ]; then
  ns="llm-d-inference-scheduler"
fi

export NAMESPACE=$ns # should match namespace used for secret.
export HF_TOKEN=$(cat hf_key.txt)
export HF_TOKEN_NAME=${HF_TOKEN_NAME:-llm-d-hf-token}
kubectl create secret generic ${HF_TOKEN_NAME} \
    --from-literal="HF_TOKEN=${HF_TOKEN}" \
    --namespace "${ns}" \
    --dry-run=client -o yaml | kubectl apply -f -

helmfile apply -f ${helmfile} -e kgateway -n ${NAMESPACE} -n ${NAMESPACE}
kubectl apply -f httproute.yaml -n ${NAMESPACE}