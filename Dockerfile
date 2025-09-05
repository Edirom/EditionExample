FROM eclipse-temurin:17-jdk-jammy as builder

# Install Ant
RUN apt-get update && \
    apt-get install -y ant && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Define working directory
WORKDIR /build

# Default command: run Ant
CMD ["ant"]


# Build the Docker Image
# From the directory containing the Dockerfile:
    # docker build -t ant-builder .

# Run the Docker Container with Volume Mount
# Mount your local project directory (/your-local-dir) to the container:
    # docker run --rm -v "$PWD":/build ant-builder
