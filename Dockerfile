FROM ubuntu:22.04

# Definindo variáveis de ambiente
ENV omnetpp_version=6.1.0
ENV omnetpp_folder_name=omnetpp-6.1
ENV osgEarth_version=3.7
ENV country_mirror=BR
ENV region_name=America
ENV city_name=Sao_Paulo
ENV DISPLAY=:0

# Alterando o Mirror
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y apt-transport-mirrors || true
RUN DEBIAN_FRONTEND=noninteractive apt install -y apt-transport-https || true
RUN DEBIAN_FRONTEND=noninteractive apt install -y apt-utils || true
RUN DEBIAN_FRONTEND=noninteractive apt install -y apt-mirror || true
RUN sed -i "s/http:\/\/archive.ubuntu.com\/ubuntu\//mirror:\/\/mirrors.ubuntu.com\/${country_mirror}.txt/g" "/etc/apt/sources.list"
RUN apt update

# Definindo região geográfica
RUN echo "tzdata tzdata/Areas select ${region_name}" | debconf-set-selections
RUN echo "tzdata tzdata/Zones/${region_name} select ${city_name}" | debconf-set-selections

RUN DEBIAN_FRONTEND=noninteractive apt install -y x11-apps curl build-essential clang lld gdb bison flex perl python3 python3-pip libpython3-dev qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools libqt5opengl5-dev libxml2-dev zlib1g-dev doxygen graphviz libwebkit2gtk-4.1-0 xdg-utils libdw-dev mpi-default-dev bash pkg-config openscenegraph libopenscenegraph-dev libgtk-3-0 libgtk-3-bin libgtk-3-common libglib2.0-bin libgdk-pixbuf2.0-0 libcanberra-gtk3-module libgtk2.0-0 libcanberra-gtk-module fonts-dejavu fontconfig xvfb x11-apps git wget ca-certificates make python3-pandas python3-numpy python3-matplotlib python3-scipy python3-seaborn python3-posix-ipc tzdata x11vnc xvfb fluxbox libglew-dev libcurl4-openssl-dev libgdal-dev unzip cmake

# Instalando pacotes que podem falhar
RUN DEBIAN_FRONTEND=noninteractive apt install -y openscenegraph-plugin-osgearth || true
RUN DEBIAN_FRONTEND=noninteractive apt install -y libosgearth-dev || true
RUN DEBIAN_FRONTEND=noninteractive apt install -y nemiver || true

# Baixando, extraindo e limpando o osgEarth
WORKDIR /
RUN git clone https://github.com/gwaldron/osgearth.git
WORKDIR /osgearth
RUN git checkout osgearth-${osgEarth_version}
RUN git submodule update --init --recursive
WORKDIR /osgearth/build
RUN cmake ..
RUN make
RUN make install

# Baixando e instalando o SUMO
RUN DEBIAN_FRONTEND=noninteractive apt install -y software-properties-common
RUN add-apt-repository ppa:sumo/stable
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y sumo

# Baixando, extraindo e limpando o OmNet++
WORKDIR /
RUN curl -L https://github.com/omnetpp/omnetpp/releases/download/omnetpp-${omnetpp_version}/omnetpp-${omnetpp_version}-linux-x86_64.tgz --output omnetpp-${omnetpp_version}-linux-x86_64.tgz
RUN tar -xvf omnetpp-${omnetpp_version}-linux-x86_64.tgz
RUN rm omnetpp-${omnetpp_version}-linux-x86_64.tgz

# Instalando dependências python
RUN python3 -m pip install -r ${omnetpp_folder_name}/python/requirements.txt

# Compilando o OmNet++
WORKDIR /${omnetpp_folder_name}
COPY OMNeTpp/configure.user .
RUN bash -c "source setenv; /bin/bash ./configure; make"

# Configurando arquivo .bashrc
RUN echo ". /${omnetpp_folder_name}/setenv" >> /root/.bashrc

# Criando script de inicialização
WORKDIR /
RUN echo "#!/bin/bash" > start.bash
RUN echo "x11vnc -create &" >> start.bash
RUN echo "sleep 15s" >> start.bash
RUN echo ". ${omnetpp_folder_name}/setenv" >> start.bash
RUN echo "${omnetpp_folder_name}/bin/opp_ide" >> start.bash
RUN echo "sleep 1m" >> start.bash
RUN echo "while pgrep -x \"opp_ide\" > /dev/null; do" >> start.bash
RUN echo "sleep 1m" >> start.bash
RUN echo "done" >> start.bash
RUN chmod +x start.bash

# Definindo a inicialização
CMD ["/bin/bash", "start.bash" ]