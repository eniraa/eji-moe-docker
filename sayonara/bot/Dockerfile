FROM rust:alpine AS builder

WORKDIR /opt

RUN apk add musl-dev git --no-cache && \
    git clone https://github.com/eniraa/sayonara.git && \
    cargo build --release --manifest-path sayonara/Cargo.toml

FROM alpine:3.14 AS runtime

WORKDIR /opt/sayonara

COPY --from=builder /opt/sayonara/target/release/sayonara .
ADD https://raw.githubusercontent.com/eficode/wait-for/master/wait-for wait.sh

COPY .env .

RUN adduser -h /opt/sayonara -s /bin/false -D -H sayonara && \
    chown sayonara -R /opt/sayonara

USER sayonara

ENTRYPOINT ["sh", "wait.sh", "lavalink:2333", "--", "/opt/sayonara/sayonara"]
