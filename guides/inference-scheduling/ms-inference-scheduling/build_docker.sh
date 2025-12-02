docker build -f with_otel.dockerfile -t localhost:5000/vllm_otel:0 .
# Push the image
docker push localhost:5000/vllm_otel:0