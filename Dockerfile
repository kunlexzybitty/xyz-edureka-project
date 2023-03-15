FROM tomcat:8-jre8

#Copy executable jar file from the builder image
COPY /target/*.war /usr/local/tomcat/webapps
