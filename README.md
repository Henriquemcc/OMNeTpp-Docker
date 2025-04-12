[English Version](README.EN.md)

# OMNeT++ - Docker

Rode o [OMNet++](https://omnetpp.org) com interface gráfica no Docker! Este repositório contém o Dockerfile utilizado para construir um container Docker com o OMNeT++.

[Disponível no Docker Hub](https://hub.docker.com/r/henriquemcc/omnetpp)

## Baixar e rodar a imagem a partir do Docker Hub

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

## Construir e rodar a imagem a partir do Dockerfile

### Como construir

Para construír este container Docker, na pasta do projeto abra um terminal (ou prompt de comando) e digite o seguinte comando:

```
docker buildx build --rm --tag omnetpp .
```


### Como executar

Para executar este container, com o [container construído](#como-construir), na pasta do projeto abra um terminal (ou prompt de comando) e digite o seguinte comando:

```
docker run -it --name omnetpp -v /tmp/.X11-unix:/tmp/.X11-unix -e "DISPLAY=${DISPLAY:-:0.0}" omnetpp
```

Para executar, montando a pasta atual, com o [container construído](#como-construir), na pasta do projeto abra um terminal (ou prompt de comando) e digite o seguinte comando:

```
docker run -it --name omnetpp -v /tmp/.X11-unix:/tmp/.X11-unix -v "$(pwd):/home" -e "DISPLAY=${DISPLAY:-:0.0}" omnetpp
```

### Como conectar com o terminal

Para se conectar ao terminal deste container, abra um terminal (ou prompt de comando) e digite o seguinte comando:

```
docker exec -it omnetpp bash
```
