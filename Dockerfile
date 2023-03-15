FROM tomcat:8-jre8

#Copy executable jar file from the builder image
COPY /build/target/*.war /usr/local/tomcat/webapps
