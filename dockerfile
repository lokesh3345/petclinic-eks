FROM tomcat 
EXPOSE 8080
COPY target/petclinic.war /usr/local/tomcat/webapps/