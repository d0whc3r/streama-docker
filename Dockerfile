FROM alpine:latest as getter

RUN apk --update add curl jq
RUN curl -sL $(curl -sL https://api.github.com/repos/streamaserver/streama/releases/latest | jq -r '.assets[].browser_download_url') -o /streama.jar

FROM openjdk:8-jre-stretch

RUN apt-get update \
    && apt-get install -y ffmpeg \
    && rm -rf /var/lib/apt/lists/*

COPY --from=getter /streama.jar /streama.jar
RUN chmod +x /streama.jar

ENV environments.production.dataSource.driverClassName org.h2.Driver
ENV environments.production.dataSource.url jdbc:h2:/streama/database;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE
ENV environments.production.dataSource.username root
ENV environments.production.dataSource.password ""
ENV server.port 8080

EXPOSE 8080

VOLUME /data/streama

CMD ["java", "-jar", "/streama.jar"]
