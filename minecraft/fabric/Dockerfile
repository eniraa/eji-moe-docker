FROM openjdk:17-alpine

WORKDIR /opt/minecraft

EXPOSE 25565

ADD server-icon.png ops.txt server.properties launch.sh \
    https://github.com/eniraa/fabric-mods/archive/refs/heads/master.zip \
    https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.9.0/fabric-installer-0.9.0.jar \
    /opt/minecraft/

RUN java -jar fabric-installer*.jar server -mcversion 1.17.1 -downloadMinecraft && \
    apk add --no-cache wget unzip && \
    unzip master.zip && \
    mv fabric-mods-master mods && \
    sh launch.sh && \
    sed -i "s/false/true/g" eula.txt

ADD carpet.conf /opt/minecraft/world/

# run as non-root
RUN adduser -h /opt/minecraft -s /bin/false -D -H fabric && \
    chown fabric -R /opt/minecraft 
USER fabric

CMD [ "sh", "launch.sh" ]