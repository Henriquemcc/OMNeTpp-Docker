# OMNeT++ - Docker

## Versão em Português

Rode o [OMNet++](https://omnetpp.org) com interface gráfica no Docker! Este repositório Docker contém a imagem de um container Docker com o OMNeT++.

[Disponível no GitHub](https://github.com/Henriquemcc/OMNeTpp-Docker)

### Baixando a imagem

Para baixar a imagem Docker, em um terminal (ou prompt de comando), digite o seguinte comando para a versão desejada:

| OMNeT++ | osgEarth | SUMO   | Ubuntu    | Comando                                                                                 |
|---------|----------|--------|-----------|-----------------------------------------------------------------------------------------|
| 6.0     | 3.7      | 1.11.0 | 22.04 LTS | ```docker pull henriquemcc/omnetpp:omnetv6.0-sumov1.11.0-osgearthv3.7-ubuntu22.04-v1``` |

### Criando o container

Para criar o container Docker com o OMNeT++, em um terminal (ou prompt de comando), digite o seguinte comando para a versão desejada:

| OMNeT++ | osgEarth | SUMO   | Ubuntu    | Comando                                                                                                                                                                      |
|---------|----------|--------|-----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 6.0     | 3.7      | 1.11.0 | 22.04 LTS | ```docker run -it --name omnetppv6.0 -v /tmp/.X11-unix:/tmp/.X11-unix -e "DISPLAY=${DISPLAY:-:0.0}" henriquemcc/omnetpp:omnetv6.0-sumov1.11.0-osgearthv3.7-ubuntu22.04-v1``` |

### Criando o container e montando na pasta atual

Para criar o container Docker com o OMNeT++, montando a pasta atual, em um terminal (ou prompt de comando), digite o seguinte comando para a versão desejada:

| OMNeT++ | osgEarth | SUMO   | Ubuntu    | Comando                                                                                                                                                                                        |
|---------|----------|--------|-----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 6.0     | 3.7      | 1.11.0 | 22.04 LTS | ```docker run -it --name omnetppv6.0 -v /tmp/.X11-unix:/tmp/.X11-unix -v "$(pwd):/home" -e "DISPLAY=${DISPLAY:-:0.0}" henriquemcc/omnetpp:omnetv6.0-sumov1.11.0-osgearthv3.7-ubuntu22.04-v1``` |

### Como conectar com o terminal

Para se conectar ao terminal deste container, abra um terminal (ou prompt de comando) e digite o seguinte comando para a versão desejada:

| OMNeT++ | osgEarth | SUMO   | Ubuntu    | Comando                                |
|---------|----------|--------|-----------|----------------------------------------|
| 6.0     | 3.7      | 1.11.0 | 22.04 LTS | ```docker exec -it omnetppv6.0 bash``` |

## English Version

Run [OMNet++](https://omnetpp.org) with graphical user interface on Docker! This Docker repository contains a Docker container image with OMNeT++.

[Available on GitHub](https://github.com/Henriquemcc/OMNeTpp-Docker)

## Download and run the image from Docker Hub

### Download the imagem

To download the Docker image, on a terminal (or command prompt), type the following command for the desired version:

| OMNeT++ | osgEarth | SUMO   | Ubuntu    | Command                                                                                 |
|---------|----------|--------|-----------|-----------------------------------------------------------------------------------------|
| 6.0     | 3.7      | 1.11.0 | 22.04 LTS | ```docker pull henriquemcc/omnetpp:omnetv6.0-sumov1.11.0-osgearthv3.7-ubuntu22.04-v1``` |

### Creating the container

To create the Docker container with OMNeT++, in a terminal (or command prompt), type the following command to the desired version:

| OMNeT++ | osgEarth | SUMO   | Ubuntu    | Command                                                                                                                                                                      |
|---------|----------|--------|-----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 6.0     | 3.7      | 1.11.0 | 22.04 LTS | ```docker run -it --name omnetppv6.0 -v /tmp/.X11-unix:/tmp/.X11-unix -e "DISPLAY=${DISPLAY:-:0.0}" henriquemcc/omnetpp:omnetv6.0-sumov1.11.0-osgearthv3.7-ubuntu22.04-v1``` |

### Creating the container and mounting the current folder

To create the Docker container with OMNeT++, mounting the current folder, in a terminal (or command prompt), type the following command for the desired version:

| OMNeT++ | osgEarth | SUMO   | Ubuntu    | Command                                                                                                                                                                                        |
|---------|----------|--------|-----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 6.0     | 3.7      | 1.11.0 | 22.04 LTS | ```docker run -it --name omnetppv6.0 -v /tmp/.X11-unix:/tmp/.X11-unix -v "$(pwd):/home" -e "DISPLAY=${DISPLAY:-:0.0}" henriquemcc/omnetpp:omnetv6.0-sumov1.11.0-osgearthv3.7-ubuntu22.04-v1``` |

### How to connect to the terminal

To connect to the terminal from this container, open a terminal (or command prompt) and type the following command for the desired version:

| OMNeT++ | osgEarth | SUMO   | Ubuntu    | Command                                |
|---------|----------|--------|-----------|----------------------------------------|
| 6.0     | 3.7      | 1.11.0 | 22.04 LTS | ```docker exec -it omnetppv6.0 bash``` |