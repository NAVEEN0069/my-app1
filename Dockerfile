FROM maven:3.8.7-openjdk-18 AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
WORKDIR /usr/src/app
RUN mvn clean package

FROM tomcat:9
COPY --from=build /usr/src/app/target/myweb*.war /usr/local/tomcat/webapps/newapp.war
