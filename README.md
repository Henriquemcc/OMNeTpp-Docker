# OMNeT++ - Docker

Rode o OMNet++ com interface gráfica no Docker! Este repositório contém o Dockerfile utilizado para construir um container Docker com o OMNeT++.

## Como construir

Para construír este container Docker, na pasta do projeto abra um terminal (ou prompt de comando) e digite o seguinte comando:

```
docker buildx build --rm --tag omnetpp .
```


## Como executar

Para executar este container, com o [container construído](#como-construir), na pasta do projeto abra um terminal (ou prompt de comando) e digite o seguinte comando:

```
docker run -it --name omnetpp -v /tmp/.X11-unix:/tmp/.X11-unix -e "DISPLAY=${DISPLAY:-:0.0}" omnetpp
```

Para executar, montando a pasta atual, com o [container construído](#como-construir), na pasta do projeto abra um terminal (ou prompt de comando) e digite o seguinte comando:

```
docker run -it --name omnetpp -v /tmp/.X11-unix:/tmp/.X11-unix -v "$(pwd):/home" -e "DISPLAY=${DISPLAY:-:0.0}" omnetpp
```

## Como conectar com o terminal

Para se conectar ao terminal deste container, abra um terminal (ou prompt de comando) e digite o seguinte comando:

```
docker attach omnetpp
```