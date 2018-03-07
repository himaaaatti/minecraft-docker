FROM debian:wheezy
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y upgrade && apt-get install -y apt-utils wget vim
RUN apt-get install -y openjdk-7-jre
RUN mkdir /etc/minecraft && \
    cd /etc/minecraft && \
    wget http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.8-11.14.1.1336/forge-1.8-11.14.1.1336-installer.jar && \
    touch eula.txt && \
    echo "eula=true" > eula.txt
ADD server.properties /etc/minecraft/server.properties
WORKDIR /etc/minecraft
RUN java -jar forge-1.8-11.14.1.1336-installer.jar --installServer
EXPOSE 25565
CMD ["java","-jar","forge-1.8-11.14.1.1336-universal.jar"]


