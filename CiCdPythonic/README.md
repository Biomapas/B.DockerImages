# B.CiCdPythonic

Docker based project that creates a docker image with various useful 
tools required for AWS and Python-heavy pipelines.

### Description

Project built on latest (`python:3.8`) image with additional support for:

- `nodejs`
- `clang`
- `cmake`

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
docker pull biomapas/cicd-pythonic:latest
```

### Usage & Examples

Use it in your Dockerfile:
```
image: biomapas/cicd-pythonic:0.0.1
```

Or execute it and login:
```
docker run -it biomapas/cicd-pythonic:latest
```

### Testing

This project has no tests to run.

### Contribution

Found a bug? Want to add or suggest a new feature?<br>
Contributions of any kind are gladly welcome. You may contact us 
directly, create a pull-request or an issue in github platform.
Lets modernize the world together.
