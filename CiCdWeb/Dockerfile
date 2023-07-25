FROM node:16.18.1
MAINTAINER Biomapas <laimonas.sutkus@biomapas.com>

# Update system.
RUN \
    apt update -y && \
    apt upgrade -y

# Install tools.
RUN \
    apt install -y jq && \
    npm install -g @angular/cli && \
    apt install chromium -y

ENV CHROME_BIN=/usr/bin/chromium

# Fix python.
RUN \
    apt install -y python3-pip && \
    ln -s /usr/bin/python3 /usr/bin/python -f && \
    ln -s /usr/bin/pip3 /usr/bin/pip -f

# Install AWS CLI.
RUN pip install awscli

ENTRYPOINT []
