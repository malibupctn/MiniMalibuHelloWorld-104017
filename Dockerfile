FROM maven:3.5.3-jdk-8-alpine
VOLUME /tmp
ADD ./src /src
ADD ./pom.xml /pom.xml
RUN mvn package
RUN wget https://github.com/prometheus/node_exporter/releases/download/v0.16.0/node_exporter-0.16.0.linux-amd64.tar.gz
RUN tar xvfz node_exporter-0.16.0.linux-amd64.tar.gz
RUN ./node_exporter-0.16.0.linux-amd64/node_exporter > node_logs
RUN jobs
EXPOSE 9100
EXPOSE 8080
WORKDIR ./target
RUN ls -l
CMD ["java", "-jar", "spinnaker-demo-1.0.jar"]