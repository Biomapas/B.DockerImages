FROM python:3.9.1
MAINTAINER Biomapas <laimonas.sutkus@biomapas.com>

# Update system.
RUN \
    apt-get update -y && \
    apt-get upgrade -y

# Install other python-specific packages.
RUN pip install pip wheel twine setuptools --upgrade --upgrade-strategy eager

# Install node and npm.
RUN \
    curl -sL https://deb.nodesource.com/setup_15.x | bash && \
    apt-get install -y nodejs && \
    node -v && \
    npm -v

# Install AWS CLI.
RUN pip install awscli

ENTRYPOINT []