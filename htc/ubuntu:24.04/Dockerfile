FROM ubuntu:24.04

LABEL opensciencegrid.name="Ubuntu 24.04"
LABEL opensciencegrid.description="Ubuntu 24.04 (Nobel Numbat) base image"
LABEL opensciencegrid.url="https://www.ubuntu.com"
LABEL opensciencegrid.category="Base"
LABEL opensciencegrid.definition_url="https://github.com/osg-htc/htc-images"

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && \
    apt update && apt install -y --no-install-recommends \
        build-essential \
        cmake \
        curl \
        davix-dev \
        dcap-dev \
        fonts-freefont-ttf \
        g++ \
        gcc \
        gfal2 \
        gfortran \
        git \
        libafterimage-dev \
        libavahi-compat-libdnssd-dev \
        libcfitsio-dev \
        libfftw3-dev \
        libfreetype6-dev \
        libftgl-dev \
        libgfal2-dev \
        libgif-dev \
        libgl2ps-dev \
        libglew-dev \
        libglu-dev \
        libgraphviz-dev \
        libgsl-dev \
        libjemalloc-dev \
        libjpeg-dev \
        libkrb5-dev \
        libldap2-dev \
        liblz4-dev \
        liblzma-dev \
        libmysqlclient-dev \
        libpng-dev \
        libpq-dev \
        libreadline-dev \
        libsqlite3-dev \
        libssl-dev \
        libtbb-dev \
        libtiff-dev \
        libx11-dev \
        libxext-dev \
        libxft-dev \
        libxml2-dev \
        libxpm-dev \
        libz-dev \
        libzmq3-dev \
        locales \
        lsb-release \
        lsb-release \
        make \
        openjdk-11-jdk \
        pkg-config \
        python3 \
        python3-pip \
        python3-dev \
        python3-numpy \
        python3-pandas \
        python3-scipy \
        python3-tk \
        r-base \
        r-cran-rcpp \
        r-cran-rinside \
        rsync \
        srm-ifce-dev \
        unixodbc-dev \
        unzip \
        vim \
        wget \
        && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# pelican
RUN URL=$(curl -L -s https://api.github.com/repos/PelicanPlatform/pelican/releases/latest | grep -E "browser_download_url.*/pelican_.*amd64.deb" | head -n 1 |  cut -d : -f 2,3 | tr -d \") && \
    echo "Picked Pelican version: $URL ..." && \
    curl -L -o pelican.deb $URL && \
    URL=$(curl -L -s https://api.github.com/repos/PelicanPlatform/pelican/releases/latest | grep -E "browser_download_url.*/pelican-osdf-compat_.*amd64.deb" | head -n 1 |  cut -d : -f 2,3 | tr -d \") && \
    echo "Picked Pelican compat version: $URL ..." && \
    curl -L -o pelican-osdf-compat.deb $URL && \
    apt install ./pelican.deb ./pelican-osdf-compat.deb && \
    rm -f pelican.deb pelican-osdf-compat.deb

# build info
RUN echo "Timestamp:" `date --utc` | tee /image-build-info.txt

