# Step 1: Base image
FROM eclipse-temurin:21-jre-alpine

# Step 2: Install required tools
RUN apk update && apk add --no-cache curl bash unzip

# Step 3: Working directory
WORKDIR /app

# Step 4: Download and unpack PMD
RUN curl -L -o pmd.zip https://github.com/pmd/pmd/releases/download/pmd_releases%2F7.5.0/pmd-dist-7.5.0-bin.zip \
    && unzip pmd.zip \
    && rm pmd.zip

# Step 5: Download Checkstyle
RUN curl -L -o checkstyle.jar https://github.com/checkstyle/checkstyle/releases/download/checkstyle-10.17.0/checkstyle-10.17.0-all.jar
