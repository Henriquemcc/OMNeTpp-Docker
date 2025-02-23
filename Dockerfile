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
RUN DEBIAN_FRONTEND=noninteractive apt install -y x11-apps
RUN DEBIAN_FRONTEND=noninteractive apt install -y curl
RUN DEBIAN_FRONTEND=noninteractive apt install -y build-essential
RUN DEBIAN_FRONTEND=noninteractive apt install -y clang
RUN DEBIAN_FRONTEND=noninteractive apt install -y lld
RUN DEBIAN_FRONTEND=noninteractive apt install -y gdb
RUN DEBIAN_FRONTEND=noninteractive apt install -y bison
RUN DEBIAN_FRONTEND=noninteractive apt install -y flex
RUN DEBIAN_FRONTEND=noninteractive apt install -y perl
RUN DEBIAN_FRONTEND=noninteractive apt install -y python3
RUN DEBIAN_FRONTEND=noninteractive apt install -y python3-pip
RUN DEBIAN_FRONTEND=noninteractive apt install -y libpython3-dev
RUN DEBIAN_FRONTEND=noninteractive apt install -y qtbase5-dev
RUN DEBIAN_FRONTEND=noninteractive apt install -y qtchooser
RUN DEBIAN_FRONTEND=noninteractive apt install -y qt5-qmake
RUN DEBIAN_FRONTEND=noninteractive apt install -y qtbase5-dev-tools
RUN DEBIAN_FRONTEND=noninteractive apt install -y libqt5opengl5-dev
RUN DEBIAN_FRONTEND=noninteractive apt install -y libxml2-dev
RUN DEBIAN_FRONTEND=noninteractive apt install -y zlib1g-dev
RUN DEBIAN_FRONTEND=noninteractive apt install -y doxygen
RUN DEBIAN_FRONTEND=noninteractive apt install -y graphviz
RUN DEBIAN_FRONTEND=noninteractive apt install -y libwebkit2gtk-4.1-0
RUN DEBIAN_FRONTEND=noninteractive apt install -y xdg-utils
RUN DEBIAN_FRONTEND=noninteractive apt install -y libdw-dev
RUN DEBIAN_FRONTEND=noninteractive apt install -y openscenegraph-plugin-osgearth || true
RUN DEBIAN_FRONTEND=noninteractive apt install -y libosgearth-dev || true
RUN DEBIAN_FRONTEND=noninteractive apt install -y mpi-default-dev
RUN DEBIAN_FRONTEND=noninteractive apt install -y bash
RUN DEBIAN_FRONTEND=noninteractive apt install -y pkg-config
RUN DEBIAN_FRONTEND=noninteractive apt install -y openscenegraph
RUN DEBIAN_FRONTEND=noninteractive apt install -y libopenscenegraph-dev
RUN DEBIAN_FRONTEND=noninteractive apt install -y libgtk-3-0
RUN DEBIAN_FRONTEND=noninteractive apt install -y libgtk-3-bin
RUN DEBIAN_FRONTEND=noninteractive apt install -y libgtk-3-common
RUN DEBIAN_FRONTEND=noninteractive apt install -y libglib2.0-bin
RUN DEBIAN_FRONTEND=noninteractive apt install -y libgdk-pixbuf2.0-0
RUN DEBIAN_FRONTEND=noninteractive apt install -y libcanberra-gtk3-module
RUN DEBIAN_FRONTEND=noninteractive apt install -y libgtk2.0-0
RUN DEBIAN_FRONTEND=noninteractive apt install -y libcanberra-gtk-module
RUN DEBIAN_FRONTEND=noninteractive apt install -y fonts-dejavu
RUN DEBIAN_FRONTEND=noninteractive apt install -y fontconfig
RUN DEBIAN_FRONTEND=noninteractive apt install -y xvfb
RUN DEBIAN_FRONTEND=noninteractive apt install -y x11-apps
RUN DEBIAN_FRONTEND=noninteractive apt install -y git
RUN DEBIAN_FRONTEND=noninteractive apt install -y wget
RUN DEBIAN_FRONTEND=noninteractive apt install -y ca-certificates
RUN DEBIAN_FRONTEND=noninteractive apt install -y make
RUN DEBIAN_FRONTEND=noninteractive apt install -y python3-pandas
RUN DEBIAN_FRONTEND=noninteractive apt install -y python3-numpy
RUN DEBIAN_FRONTEND=noninteractive apt install -y python3-matplotlib
RUN DEBIAN_FRONTEND=noninteractive apt install -y python3-scipy
RUN DEBIAN_FRONTEND=noninteractive apt install -y python3-seaborn
RUN DEBIAN_FRONTEND=noninteractive apt install -y python3-posix-ipc
RUN DEBIAN_FRONTEND=noninteractive apt install -y tzdata
RUN DEBIAN_FRONTEND=noninteractive apt install -y x11vnc
RUN DEBIAN_FRONTEND=noninteractive apt install -y xvfb
RUN DEBIAN_FRONTEND=noninteractive apt install -y fluxbox

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