# syntax=docker/dockerfile:1
FROM debian
RUN \
    apt update && apt -y upgrade && \
    apt install -y --no-install-recommends curl ca-certificates && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

COPY . /opt/simple
WORKDIR /opt/simple

SHELL ["/bin/bash", "--login", "-c"]
RUN nvm install && nvm use && npm install

VOLUME /opt/simple
EXPOSE 3000
ENTRYPOINT ["/bin/bash", "--login", "-c", "npm start"]
