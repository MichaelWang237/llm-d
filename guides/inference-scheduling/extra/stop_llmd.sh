ns=$1

if [ -z "$ns" ]; then
  ns="llm-d-inference-scheduler"
fi
export NAMESPACE=$ns # should match namespace used for secret.

helmfile destroy -n ${NAMESPACE} -e kgateway 