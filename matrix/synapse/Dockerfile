FROM python:3.9-alpine

WORKDIR /opt/synapse

RUN apk add --no-cache build-base python3-dev gcc libc-dev libffi-dev cargo postgresql-dev openssl-dev jpeg-dev zlib-dev && \
    pip install matrix-synapse[postgres] && \
    python3 -m synapse.app.homeserver \
        --server-name eji.moe \
        --config-path homeserver.yaml \
        --generate-config \
        --report-stats=no

COPY homeserver.yaml .
    
ENTRYPOINT ["python", "-m", "synapse.app.homeserver", "--config-path", "homeserver.yaml"]
