FROM openjdk:17-jdk-alpine
WORKDIR /app

# Get datadog agent
RUN apk update
RUN apk add wget
RUN wget -O dd-java-agent.jar 'https://dtdg.co/latest-java-tracer'
RUN apk del wget

# Create and run as a non-root user for added security
RUN adduser -Ds /bin/bash nonroot
USER nonroot
COPY application.jar /app/application.jar

# Application runs on port 8080
EXPOSE 8080

ENTRYPOINT ["java", "-javaagent:dd-java-agent.jar","-jar","application.jar"]
