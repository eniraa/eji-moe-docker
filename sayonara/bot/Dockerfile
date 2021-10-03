FROM rust:alpine AS builder

WORKDIR /opt

RUN apk add musl-dev git --no-cache && \
    git clone https://github.com/eniraa/sayonara.git && \
    cargo build --release --manifest-path sayonara/Cargo.toml

FROM alpine:3.14 AS runtime

ADD https://raw.githubusercontent.com/eficode/wait-for/master/wait-for wait.sh
COPY --from=builder /opt/sayonara/target/release/sayonara /usr/local/bin
ADD https://raw.githubusercontent.com/eficode/wait-for/master/wait-for wait.sh

COPY .env .

ENTRYPOINT ["sh", "wait.sh", "lavalink:2333", "--", "/usr/local/bin/sayonara"]
