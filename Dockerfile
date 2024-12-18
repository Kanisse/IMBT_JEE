FROM maven:3.9-eclipse-temurin-17 as builder
WORKDIR /App
COPY . .
RUN mvn clean package
FROM tomcat:9-jdk11
COPY  --from=builder /App/target/*.war /usr/local/tomcat/webApps
EXPOSE 8080
CMD [ "catalina.sh" ,"run" ]
