FROM openjdk:8-slim

RUN mkdir /webgoat
WORKDIR /webgoat
ADD ./webgoat-container-7.1-exec.jar /webgoat/webgoat-container-7.1-exec.jar

RUN mkdir /opt/contrastsecurity
ADD ./contrast.jar /opt/contrastsecurity
EXPOSE 8080
CMD ["java","-javaagent:/opt/contrastsecurity/contrast.jar","-Dcontrast.agent.java.standalone_app_name=WebGoatDocker","-Dcontrast.server.name=RajsServer","-jar","/webgoat/webgoat-container-7.1-exec.jar"]

