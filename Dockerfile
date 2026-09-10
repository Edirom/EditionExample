#########################
# multi stage Dockerfile
# 1. set up the build environment and build the expath-packages
# 2. run the eXist-db
#########################
FROM eclipse-temurin:25-jre AS builder
LABEL maintainer="Peter Stadler for the ViFE"
LABEL maintainer="Daniel Jettka"

ARG BACKEND_VERSION=1.4.0
ARG FRONTEND_VERSION=1.4.0
ARG ROASTER_VERSION=1.11.0
ARG BACKEND_URL=http://localhost:8080/apps/Edirom-Online-Backend/
ARG BACKEND_PATH=/apps/Edirom-Online-Backend

# install ant, curl and unzip
RUN apt-get update \
    && apt-get install -y --no-install-recommends ant curl unzip zip

# build the edition
WORKDIR "/opt/data-build"
COPY . .
RUN ant

# download xar packages
WORKDIR "/opt/packages"

RUN echo "Downloading Edirom Online Backend xar..." && \
    curl -L -O "https://github.com/Edirom/Edirom-Online-Backend/releases/download/v${BACKEND_VERSION}/Edirom-Online-Backend-${BACKEND_VERSION}.xar";

RUN echo "Downloading Edirom Online Frontend xar..." && \
    curl -L -O "https://github.com/Edirom/Edirom-Online-Frontend/releases/download/v${FRONTEND_VERSION}/Edirom-Online-Frontend-${FRONTEND_VERSION}.xar";

# replace backendURL and backendPath value in config.json inside the Edirom-Online-Frontend xar package
RUN unzip -o "Edirom-Online-Frontend-${FRONTEND_VERSION}.xar" "config.json" && \
    sed -i "s|\"backendURL\": \".*\"|\"backendURL\": \"${BACKEND_URL}\"|g" config.json && \
    sed -i "s|\"backendPath\": \".*\"|\"backendPath\": \"${BACKEND_PATH}\"|g" config.json && \
    zip -q -f "Edirom-Online-Frontend-${FRONTEND_VERSION}.xar" "config.json" && \
    rm config.json;

RUN echo "Downloading Roaster xar..." && \
    curl -L -O "https://exist-db.org/exist/apps/public-repo/public/roaster-${ROASTER_VERSION}.xar";


#########################
# Now running the eXist-db
# and adding our freshly built and downloaded xar-packages
#########################
FROM stadlerpeter/existdb:6

# add specific settings for this app 
# For more details about the options see  
# https://github.com/peterstadler/existdb-docker
#ENV EXIST_ENV="production"
ENV EXIST_CONTEXT_PATH="/"
ENV EXIST_DEFAULT_APP_PATH="xmldb:exist:///db/apps/Edirom-Online-Frontend"

# simply copy our xar packages
# to the eXist-db autodeploy folder
COPY --from=builder /opt/data-build/dist/*.xar ${EXIST_HOME}/autodeploy/
COPY --from=builder /opt/packages/*.xar ${EXIST_HOME}/autodeploy/
