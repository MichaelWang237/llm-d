FROM ghcr.io/llm-d/llm-d-cuda-dev:sha-9e6d12d
USER root
# Install OTEL (stop-gap measure while vLLM fixes dependency issue.)
RUN pip install \
    'opentelemetry-sdk>=1.26.0,<1.27.0' \
    'opentelemetry-api>=1.26.0,<1.27.0' \
    'opentelemetry-exporter-otlp>=1.26.0,<1.27.0' \
    'opentelemetry-semantic-conventions-ai>=0.4.1,<0.5.0'

USER vllm