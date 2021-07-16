FROM maven:3.6-jdk-11-slim as BUILD
COPY . /src
WORKDIR /src
RUN mvn install -DskipTests

FROM openjdk:11.0.1-jre-slim-stretch
EXPOSE 8080
WORKDIR /app
ARG WAR=spring-petclinic-2.1.0.BUILD-petclinic.war

COPY --from=BUILD /src/target/$WAR /app.war
ENTRYPOINT ["java","-jar","/app.war"]


FROM tomcat
COPY --from=BUILD /usr/src/target/petclinic.war /usr/local/tomcat/webapps