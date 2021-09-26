FROM azul/zulu-openjdk-alpine:13

WORKDIR /opt/lavalink

EXPOSE 2333

ADD https://ci.fredboat.com/repository/download/Lavalink_Build/.lastSuccessful/Lavalink.jar?guest=1 lavalink.jar
COPY application.yml .

RUN adduser -h /opt/lavalink -s /bin/false -D -H lavalink && \
    chown lavalink -R /opt/lavalink

USER lavalink

ENTRYPOINT ["java", "-Djdk.tls.client.protocols=TLSv1.1,TLSv1.2", "-Xmx512M", "-jar", "lavalink.jar"]
