FROM maven:3.5.2-jdk-9 AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
WORKDIR /usr/src/app
RUN mvn clean package

FROM tomcat:9
COPY --from=build target/my-app*.war /usr/local/tomcat/webapps/newapp.war
