[Versão em Português](README.md)

# OMNeT++ - Docker

Run OMNet++ with graphical user interface on Docker! This repository contains the Dockerfile that was used to build a Docker container with OMNeT++.

## How to build

To build this Docker container, in the project folder open a terminal (or command prompt) and type the following command:

```
docker buildx build --rm --tag omnetpp .
```

## How to run

To run this container, with the [container built](#how-to-build), in the project folder open a terminal (or command prompt) and type the following command:

```
docker run -it --name omnetpp -v /tmp/.X11-unix:/tmp/.X11-unix -e "DISPLAY=${DISPLAY:-:0.0}" omnetpp
```

To run this container, mounting the current directory, with the [container built](#how-to-build), in the project folder open a terminal (or command prompt) and type the following command:

```
docker run -it --name omnetpp -v /tmp/.X11-unix:/tmp/.X11-unix -v "$(pwd):/home" -e "DISPLAY=${DISPLAY:-:0.0}" omnetpp
```

## How to connect to the terminal

To connect to the container terminal, open a terminal (or command prompt) and type the following command:

```
docker exec -it omnetpp bash
```