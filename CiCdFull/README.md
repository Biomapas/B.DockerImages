# B.CiCdFull

Docker based project that creates a docker image with various useful 
tools required for AWS-Python infrastructure pipelines.

### Description

Project that builds a docker image with these tools:

- BASH: **5.1.0-r0**
- CURL: **7.74.0-r0**
- LIBGCC: **10.2.1_pre1-r3**
- GCC: **10.2.1_pre1-r3**
- LIBC_DEV: **0.7.2-r3**
- LIBFFI_DEV: **3.3-r2**
- OPENSSL_DEV: **1.1.1i-r0**
- JQ **1.6-r1**
- RUST **1.47.0-r2**
- CARGO **1.47.0-r2**
- GIT **2.30.1-r0**

- NPM: **14.15.4-r0**
- PYTHON3: **3.8.7-r0**
- AWS_CLI: **1.18.159**
- PIP3: **latest**
- AWS_CDK: **latest**
- WHEEL: **latest**
- TWINE: **latest**

The image is based on Alpine Linux (https://alpinelinux.org/).

### Remarks

[Biomapas](https://biomapas.com) aims to modernise life-science 
industry by sharing its IT knowledge with other companies and 
the community. This is an open source library intended to be used 
by anyone. Improvements and pull requests are welcome.

### Related technology

- Docker
- Dockerfile

### Assumptions

The project assumes the following:

- You have basic-good knowledge in Docker.

### Useful sources

- The built image is Alpine-based:<br>
https://alpinelinux.org/

- Read about docker technology:<br>
https://www.docker.com/

- Read about creating Dockerfiles:<br>
https://docs.docker.com/engine/reference/builder/

### Install

Pull the image.
```
docker pull biomapas/cicd-full:latest
```

### Usage & Examples

Use it in your Dockerfile:
```
image: biomapas/cicd-full:0.0.1
```

Or execute it and login:
```
docker run -it biomapas/cicd-full:latest
```

### Testing

This project has no tests to run.

### Contribution

Found a bug? Want to add or suggest a new feature?<br>
Contributions of any kind are gladly welcome. You may contact us 
directly, create a pull-request or an issue in github platform.
Lets modernize the world together.
