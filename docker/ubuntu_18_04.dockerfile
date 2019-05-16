FROM ubuntu:18.04

LABEL maintainer="lukasz.towarek@intel.com"

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libssl-dev \
    libx11-dev \
    libva-dev \
    libpng-dev \
    ocl-icd-opencl-dev \
    libboost-all-dev \
    wget \
    unzip

COPY . /opt/src

RUN /opt/src/scripts/install/install_ubuntu_18_04.sh

RUN mkdir /opt/src/build; cd /opt/src/build; cmake .. -DCMAKE_BUILD_TYPE=RELEASE; cmake --build . -- -j

CMD ["/bin/bash"]

