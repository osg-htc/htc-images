FROM tensorflow/tensorflow:2.15.0-gpu

LABEL opensciencegrid.name="Tensorflow 2.15"
LABEL opensciencegrid.description="Tensorflow image from the Tensorflow project, with OSG additions"
LABEL opensciencegrid.url="https://www.tensorflow.org/"
LABEL opensciencegrid.category="AI"
LABEL opensciencegrid.definition_url="https://github.com/osg-htc/htc-images"

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && \
    apt update && apt install -y --no-install-recommends \
        build-essential \
        cmake \
        curl \
        git \
        lsb-release \
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

