# B.CiCdWeb

Docker based project that creates a docker image with various useful 
tools required for **_Angular_**-based frontend application pipelines. 
The project also assumes that you are using **_Cypress_** to test your 
web applications. If you are not using this testing tool, probably you 
shouldn't use this docker image either.

### Description

Project that builds a docker image with these tools:

- CHROME: **83-ff77**
- CYPRESS PACKAGE: **6.0.0**
- CYPRESS BINARY: **6.0.0**
- ELECTRON: **11.0.2**
- NODE: **12.18.3**
- NPM: **6.14.9**
- JQ: **jq-1.5-1-a5b5cbe**
- ANGULAR CLI: **11.0.2**
- PYTHON PIP: **18.1**
- PYTHON: **3.7.3**

The image is based on cypress docker image that is based on node image.
Official cypress docker image can be found here:
https://hub.docker.com/r/cypress/included.

### Remarks

[Biomapas](https://biomapas.com) aims to modernise life-science 
industry by sharing its IT knowledge with other companies and 
the community. This is an open source library intended to be used 
by anyone. Improvements and pull requests are welcome.

### Related technology

- Docker
- Dockerfile
- Cypress
- Node/Npm

### Assumptions

The project assumes the following:

- You have basic-good knowledge in Docker.

### Useful sources

- Official Cypress Dockerhub:<br>
https://hub.docker.com/u/cypress

- Cypress website:<br>
https://www.cypress.io/

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
