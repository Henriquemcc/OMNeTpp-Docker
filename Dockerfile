FROM ubuntu:22.04

# Alterando o Mirror
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y apt-transport-mirrors || true
RUN DEBIAN_FRONTEND=noninteractive apt install -y apt-transport-https || true
RUN DEBIAN_FRONTEND=noninteractive apt install -y apt-utils || true
RUN DEBIAN_FRONTEND=noninteractive apt install -y apt-mirror || true
RUN sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu\//mirror:\/\/mirrors.ubuntu.com\/BR.txt/g' "/etc/apt/sources.list"
RUN apt update

# Instalando requisitos
RUN echo "tzdata tzdata/Areas select America" | debconf-set-selections
RUN echo "tzdata tzdata/Zones/America select Sao_Paulo" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt install -y x11-apps curl build-essential clang lld gdb bison flex perl python3 python3-pip libpython3-dev qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools libqt5opengl5-dev libxml2-dev zlib1g-dev doxygen graphviz libwebkit2gtk-4.1-0 xdg-utils libdw-dev mpi-default-dev bash pkg-config openscenegraph libopenscenegraph-dev libgtk-3-0 libgtk-3-bin libgtk-3-common libglib2.0-bin libgdk-pixbuf2.0-0 libcanberra-gtk3-module libgtk2.0-0 libcanberra-gtk-module fonts-dejavu fontconfig xvfb x11-apps git wget ca-certificates make python3-pandas python3-numpy python3-matplotlib python3-scipy python3-seaborn python3-posix-ipc tzdata x11vnc xvfb fluxbox
RUN DEBIAN_FRONTEND=noninteractive apt install -y openscenegraph-plugin-osgearth || true
RUN DEBIAN_FRONTEND=noninteractive apt install -y libosgearth-dev || true

# Baixando, extraindo e limpando o OmNet++
RUN curl -L https://github.com/omnetpp/omnetpp/releases/download/omnetpp-6.1.0/omnetpp-6.1.0-linux-x86_64.tgz --output omnetpp-6.1.0-linux-x86_64.tgz
RUN tar -xvf omnetpp-6.1.0-linux-x86_64.tgz
RUN rm omnetpp-6.1.0-linux-x86_64.tgz

# Instalando dependências python
RUN python3 -m pip install -r omnetpp-6.1/python/requirements.txt

# Compilando o OmNet++
RUN bash -c "cd omnetpp-6.1; source setenv; /bin/bash ./configure; make"

# Configurando arquivo .bashrc
RUN echo ". /omnetpp-6.1/setenv" >> /root/.bashrc

# Definindo a inicialização
COPY start.bash start.bash
CMD ["/bin/bash", "start.bash" ]