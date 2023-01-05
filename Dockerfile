FROM maven:3.5.2-jdk-9 AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
WORKDIR /usr/src/app
RUN mvn clean package

FROM openjdk:9
COPY --from=build /usr/src/app/target/flighttracker-1.0.0-SNAPSHOT.jar /usr/app/flighttracker-1.0.0-SNAPSHOT.jar 
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/app/flighttracker-1.0.0-SNAPSHOT.jar"]

FROM tomcat:9
COPY --from=build target/my-app*.war /usr/local/tomcat/webapps/newapp.war
