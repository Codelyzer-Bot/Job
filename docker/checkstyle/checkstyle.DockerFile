# Base image with Java 21
FROM openjdk:21-jdk-slim

# Install wget
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

# Download Checkstyle JAR
RUN wget -q https://github.com/checkstyle/checkstyle/releases/download/checkstyle-11.1.0/checkstyle-11.1.0-all.jar -O /checkstyle.jar

# Set working directory
WORKDIR /workspace

# Default command (can be overridden)
ENTRYPOINT ["java", "-jar", "/checkstyle.jar"]
