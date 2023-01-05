FROM maven:3.5.2-jdk-9 AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

FROM tomcat:9
# Take the war and copy to webapps of tomcat
COPY target/newapp.war /usr/local/tomcat/webapps/newapp.war
