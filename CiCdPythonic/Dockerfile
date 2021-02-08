FROM python:3.10.0a5-buster
MAINTAINER Biomapas <laimonas.sutkus@biomapas.com>

# Update system.
RUN \
    apt-get update -y && \
    apt-get upgrade -y

# Install node and npm.
RUN \
    curl -sL https://deb.nodesource.com/setup_15.x | bash && \
    apt-get install -y nodejs && \
    node -v && \
    npm -v

# Install AWS CLI.
RUN pip install awscli

# Install latest AWS CDK.
RUN \
    npm install -g aws-cdk

# Install other python-specific packages.
RUN \
    pip install wheel && \
    pip install twine

ENTRYPOINT []