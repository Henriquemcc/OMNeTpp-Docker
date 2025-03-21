[Versão em Português](README.md)

# OMNeT++ - Docker

Run [OMNet++](https://omnetpp.org) with graphical user interface on Docker! This repository contains the Dockerfile that was used to build a Docker container with OMNeT++.

[Available on Docker Hub](https://hub.docker.com/r/henriquemcc/omnetpp)

## Download and run the image from Docker Hub

### Download the imagem

To download the Docker image, on a terminal (or command prompt), type the following command for the desired version:

#### OMNeT++ 6.1.0 on Ubuntu 22.04 LTS

```
docker pull henriquemcc/omnetpp:omnetv6.1.0-ubuntu22.04-v1
```

#### OMNeT++ 6.0 on Ubuntu 22.04 LTS

```
docker pull henriquemcc/omnetpp:omnetv6.0-ubuntu22.04-v1
```

#### OMNeT++ 5.6.2 on Ubuntu 18.04 LTS

```
docker pull henriquemcc/omnetpp:omnetv5.6.2-ubuntu18.04-v1
```

### Creating the container

To create the Docker container with OMNeT++, in a terminal (or command prompt), type the following command to the desired version:

#### OMNeT++ 6.1.0 on Ubuntu 22.04 LTS

```
docker run -it --name omnetppv6.1.0 -v /tmp/.X11-unix:/tmp/.X11-unix -e "DISPLAY=${DISPLAY:-:0.0}" henriquemcc/omnetpp:omnetv6.1.0-ubuntu22.04-v1
```

#### OMNeT++ 6.0 on Ubuntu 22.04 LTS

```
docker run -it --name omnetppv6.0 -v /tmp/.X11-unix:/tmp/.X11-unix -e "DISPLAY=${DISPLAY:-:0.0}" henriquemcc/omnetpp:omnetv6.0-ubuntu22.04-v1
```

#### OMNeT++ 5.6.2 on Ubuntu 18.04 LTS

```
docker run -it --name omnetppv5.6.2 -v /tmp/.X11-unix:/tmp/.X11-unix -e "DISPLAY=${DISPLAY:-:0.0}" henriquemcc/omnetpp:omnetv5.6.2-ubuntu18.04-v1
```

### Creating the container and mounting the current folder

To create the Docker container with OMNeT++, mounting the current folder, in a terminal (or command prompt), type the following command for the desired version:

#### OMNeT++ 6.1.0 on Ubuntu 22.04 LTS

```
docker run -it --name omnetppv6.1.0 -v /tmp/.X11-unix:/tmp/.X11-unix -v "$(pwd):/home" -e "DISPLAY=${DISPLAY:-:0.0}" henriquemcc/omnetpp:omnetv6.1.0-ubuntu22.04-v1
```

#### OMNeT++ 6.0 on Ubuntu 22.04 LTS

```
docker run -it --name omnetppv6.0 -v /tmp/.X11-unix:/tmp/.X11-unix -v "$(pwd):/home" -e "DISPLAY=${DISPLAY:-:0.0}" henriquemcc/omnetpp:omnetv6.0-ubuntu22.04-v1
```

#### OMNeT++ 5.6.2 on Ubuntu 18.04 LTS

```
docker run -it --name omnetppv5.6.2 -v /tmp/.X11-unix:/tmp/.X11-unix -v "$(pwd):/home" -e "DISPLAY=${DISPLAY:-:0.0}" henriquemcc/omnetpp:omnetv5.6.2-ubuntu18.04-v1
```

### How to connect to the terminal

To connect to the terminal from this container, open a terminal (or command prompt) and type the following command for the desired version:

#### OMNeT++ 6.1.0 on Ubuntu 22.04 LTS

```
docker exec -it omnetppv6.1.0 bash
```

#### OMNeT++ 6.0 on Ubuntu 22.04 LTS

```
docker exec -it omnetppv6.0 bash
```

#### OMNeT++ 5.6.2 on Ubuntu 18.04 LTS

```
docker exec -it omnetppv5.6.2 bash
```

## Build and run the image from the Dockerfile

### How to build

To build this Docker container, in the project folder open a terminal (or command prompt) and type the following command:

```
docker buildx build --rm --tag omnetpp .
```

### How to run

To run this container, with the [container built](#how-to-build), in the project folder open a terminal (or command prompt) and type the following command:

```
docker run -it --name omnetpp -v /tmp/.X11-unix:/tmp/.X11-unix -e "DISPLAY=${DISPLAY:-:0.0}" omnetpp
```

To run this container, mounting the current directory, with the [container built](#how-to-build), in the project folder open a terminal (or command prompt) and type the following command:

```
docker run -it --name omnetpp -v /tmp/.X11-unix:/tmp/.X11-unix -v "$(pwd):/home" -e "DISPLAY=${DISPLAY:-:0.0}" omnetpp
```

### How to connect to the terminal

To connect to the container terminal, open a terminal (or command prompt) and type the following command:

```
docker exec -it omnetpp bash
```
