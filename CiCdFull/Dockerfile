FROM python:3.8
MAINTAINER Biomapas <laimonas.sutkus@biomapas.com>

# Update system.
RUN \
    apt-get update -y && \
    apt-get upgrade -y

# Install other python-specific packages.
RUN pip install pip wheel twine setuptools awscli requests --upgrade --upgrade-strategy eager

# Install Gcc/Cmake related libraries.
RUN \
    apt-get install -y gcc clang clang-tools cmake && \
    rm -rf /var/lib/apt/lists/*

# Install node and npm.
RUN \
    curl -sL https://deb.nodesource.com/setup_14.x | bash && \
    apt-get install -y nodejs && \
    node -v && \
    npm -v

# Add node/npm related packages.
RUN \
    npm install swagger-inline -g

# Copy bitbucket util files.
# These scripts let you do actions related to bitbuceket and bitbucket pipeliens.
ADD bitbucket_utils /usr/local/bitbucket_utils

# Copy magic util files.
# These scripts are very specific and don't make much sense to regular users.
ADD magic_utils /usr/local/magic_utils

# Copy node util files.
# These scripts let you do actions with node/npm.
ADD node_utils /usr/local/node_utils

# Copy python util files.
# These scripts let you do actions with python/pip and related libraries.
ADD python_utils /usr/local/python_utils

# Copy documentation util files.
# These scripts let you do various actions for creating documentation.
ADD python_utils /usr/local/documentation_utils

ENTRYPOINT []
