FROM openjdk:8-jdk-alpine
COPY target/app-one-0.0.1-SNAPSHOT.jar app-one-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/app-one-0.0.1-SNAPSHOT.jar"]