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
    # For those who run into AWS CDK issues,
    # (https://github.com/aws/aws-cdk/issues/12536)
    # we downgrade node.
    curl -sL https://deb.nodesource.com/setup_14.x | bash && \
    apt-get install -y nodejs && \
    node -v && \
    npm -v

# Install AWS CLI.
RUN pip install awscli

ENTRYPOINT []