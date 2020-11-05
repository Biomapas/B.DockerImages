FROM alpine:latest
MAINTAINER Biomapas <laimonas.sutkus@biomapas.com>

ARG BASH_VERSION=5.0.17-r0
ARG CURL_VERSION=7.69.1-r1
ARG GCC_VERSION=9.3.0-r2
ARG LIBC_DEV_VERSION=0.7.2-r3
ARG LIBFFI_DEV_VERSION=3.3-r2
ARG OPENSSL_DEV_VERSION=1.1.1g-r0
ARG JQ_VERSION=1.6-r1
ARG NPM_VERSION=12.18.4-r0
ARG PYTHON3_VERSION=3.8.5-r0
ARG PIP3_VERSION=20.1.1-r0
ARG AWS_CLI_VERSION=1.18.159

# Update system.
RUN \
    apk update && \
    apk upgrade

# Install basic tools.
RUN \
    apk add bash=$BASH_VERSION && \
    apk add curl=$CURL_VERSION && \
    apk add gcc=$GCC_VERSION && \
    apk add libc-dev=$LIBC_DEV_VERSION && \
    apk add libffi-dev=$LIBFFI_DEV_VERSION && \
    apk add openssl-dev=$OPENSSL_DEV_VERSION && \
    apk add jq=$JQ_VERSION

# Install node 12.
RUN apk add npm=$NPM_VERSION

# Install python 3.8.
RUN \
    apk add python3=$PYTHON3_VERSION && \
    apk add python3-dev=$PYTHON3_VERSION && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    apk add py3-pip=$PIP3_VERSION

# Install AWS CLI.
RUN pip install awscli==$AWS_CLI_VERSION

# Install latest AWS CDK.
RUN \
    npm install -g aws-cdk && \
    cdk --version

# Install other python-specific packages.
RUN \
    pip install wheel && \
    pip install twine
