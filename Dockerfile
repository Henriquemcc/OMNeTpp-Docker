FROM ubuntu:22.04

# Alterando o Mirror
RUN apt update
RUN apt install -y apt-transport-mirrors || true
RUN apt install -y apt-transport-https || true
RUN apt install -y apt-utils || true
RUN apt install -y apt-mirror || true
RUN sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu\//mirror:\/\/mirrors.ubuntu.com\/BR.txt/g' "/etc/apt/sources.list"
RUN apt update

# Instalando requisitos
RUN apt install -y x11-apps
RUN apt install -y curl
RUN apt install -y build-essential
RUN apt install -y clang
RUN apt install -y lld
RUN apt install -y gdb
RUN apt install -y bison
RUN apt install -y flex
RUN apt install -y perl
RUN apt install -y python3
RUN apt install -y python3-pip
RUN apt install -y libpython3-dev
RUN apt install -y qtbase5-dev
RUN apt install -y qtchooser
RUN apt install -y qt5-qmake
RUN apt install -y qtbase5-dev-tools
RUN apt install -y libqt5opengl5-dev
RUN apt install -y libxml2-dev
RUN apt install -y zlib1g-dev
RUN apt install -y doxygen
RUN apt install -y graphviz
RUN apt install -y libwebkit2gtk-4.1-0
RUN apt install -y xdg-utils
RUN apt install -y libdw-dev
RUN apt install -y openscenegraph-plugin-osgearth || true
RUN apt install -y libosgearth-dev || true
RUN apt install -y mpi-default-dev
RUN apt install -y bash
RUN apt install -y pkg-config
RUN apt install -y openscenegraph
RUN apt install -y libopenscenegraph-dev
RUN apt install -y libgtk-3-0
RUN apt install -y libgtk-3-bin
RUN apt install -y libgtk-3-common
RUN apt install -y libglib2.0-bin
RUN apt install -y libgdk-pixbuf2.0-0
RUN apt install -y libcanberra-gtk3-module
RUN apt install -y libgtk2.0-0
RUN apt install -y libcanberra-gtk-module
RUN apt install -y fonts-dejavu
RUN apt install -y fontconfig
RUN apt install -y xvfb
RUN apt install -y x11-apps
RUN apt install -y git
RUN apt install -y wget
RUN apt install -y ca-certificates
RUN apt install -y make
RUN apt install -y python3-pandas
RUN apt install -y python3-numpy
RUN apt install -y python3-matplotlib
RUN apt install -y python3-scipy
RUN apt install -y python3-seaborn
RUN apt install -y python3-posix-ipc
RUN echo "tzdata tzdata/Areas select America" | debconf-set-selections
RUN echo "tzdata tzdata/Zones/America select Sao_Paulo" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt install -y tzdata
RUN apt install -y x11vnc
RUN apt install -y xvfb
RUN apt install -y fluxbox

# Baixando, extraindo e limpando o OmNet++
RUN curl -L https://github.com/omnetpp/omnetpp/releases/download/omnetpp-6.1.0/omnetpp-6.1.0-linux-x86_64.tgz --output omnetpp-6.1.0-linux-x86_64.tgz
RUN tar -xvf omnetpp-6.1.0-linux-x86_64.tgz
RUN rm omnetpp-6.1.0-linux-x86_64.tgz

# Instalando dependências python
RUN python3 -m pip install -r omnetpp-6.1/python/requirements.txt

# Compilando o OmNet++
RUN bash -c "cd omnetpp-6.1; source setenv; /bin/bash ./configure; make"

# Definindo a inicialização
ENV DISPLAY :0
COPY start.bash start.bash
CMD ["/bin/bash", "start.bash" ]