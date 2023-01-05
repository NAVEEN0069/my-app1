FROM maven:latest AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
WORKDIR /usr/src/app
RUN mvn clean package

FROM tomcat:9
COPY --from=build /usr/src/app/myweb*.war /usr/local/tomcat/webapps/newapp.war
