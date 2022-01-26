# B.CiCdWeb

Docker based project that creates a docker image with various useful
tools required for **_Angular_**-based frontend application pipelines.

### Description

Project that builds a docker image with these tools:

- NODE: **16.13.2**
- NPM: **8.1.2**
- JQ: **jq-1.5-1-a5b5cbe**
- ANGULAR CLI: **13.1.4**
- PYTHON PIP: **20.2.3**
- PYTHON: **3.8.9**

The image is based on node docker image.
Official node docker image can be found here:
https://hub.docker.com/_/node.

### Remarks

[Biomapas](https://biomapas.com) aims to modernise life-science
industry by sharing its IT knowledge with other companies and
the community. This is an open source library intended to be used
by anyone. Improvements and pull requests are welcome.

### Related technology

- Docker
- Dockerfile
- Node/Npm

### Assumptions

The project assumes the following:

- You have basic-good knowledge in Docker.

### Useful sources

- Read about docker technology:<br>
  https://www.docker.com/

- Read about creating Dockerfiles:<br>
  https://docs.docker.com/engine/reference/builder/

### Install

Pull the image.

```
docker pull biomapas/cicd-web:latest
```

### Usage & Examples

Use it in your Dockerfile:

```
image: biomapas/cicd-web:0.0.2
```

Or execute it and login:

```
docker run -it biomapas/cicd-web:latest
```

### Testing

This project has no tests to run.

### Contribution

Found a bug? Want to add or suggest a new feature?<br>
Contributions of any kind are gladly welcome. You may contact us
directly, create a pull-request or an issue in github platform.
Lets modernize the world together.
