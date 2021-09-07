FROM openjdk:17-alpine

WORKDIR /opt/minecraft

EXPOSE 25565

# download & configure
RUN wget https://ci.tivy.ca/job/Airplane-1.17/lastSuccessfulBuild/artifact/launcher-airplane.jar \
    && java -jar launcher-airplane.jar nogui \
    && sed -i 's/false/true/g' eula.txt \
    && sed -i 's/easy/hard/' server.properties \
    && sed -i 's/enable-command-block=false/enable-command-block=true/' server.properties

# run with aikar flags
ENTRYPOINT [ "java", "-Xms1G", "-Xmx1G", "-XX:+UseG1GC", "-XX:+ParallelRefProcEnabled", "-XX:MaxGCPauseMillis=200", "-XX:+UnlockExperimentalVMOptions", "-XX:+DisableExplicitGC", "-XX:+AlwaysPreTouch", "-XX:G1HeapWastePercent=5", "-XX:G1MixedGCCountTarget=4", "-XX:G1MixedGCLiveThresholdPercent=90", "-XX:G1RSetUpdatingPauseTimePercent=5", "-XX:SurvivorRatio=32", "-XX:+PerfDisableSharedMem", "-XX:MaxTenuringThreshold=1", "-XX:G1NewSizePercent=30", "-XX:G1MaxNewSizePercent=40", "-XX:G1HeapRegionSize=8M", "-XX:G1ReservePercent=20", "-XX:InitiatingHeapOccupancyPercent=15", "-Dusing.aikars.flags=https://mcflags.emc.gs", "-Daikars.new.flags=true", "-jar", "launcher-airplane.jar", "nogui" ]
