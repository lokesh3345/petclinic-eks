FROM maven:3.5-jdk-8 as BUILD
COPY  . /usr/src/
RUN mvn -f /usr/src/pom.xml clean package

FROM tomcat
COPY --from=BUILD /usr/src/myapp/target/people-1.0-petclinic.war /usr/local/tomcat/webapps