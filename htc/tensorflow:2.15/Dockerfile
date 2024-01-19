FROM tensorflow/tensorflow:2.15.0-gpu

LABEL opensciencegrid.name="Tensorflow 2.15"
LABEL opensciencegrid.description="Tensorflow image from the Tensorflow project, with OSG additions"
LABEL opensciencegrid.url="https://www.tensorflow.org/"
LABEL opensciencegrid.category="Base"
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

# OSDF
RUN URL=$(curl -L -s https://api.github.com/repos/htcondor/osdf-client/releases/latest | grep -E "browser_download_url.*/stashcp.*amd64.deb" | head -n 1 |  cut -d : -f 2,3 | tr -d \") && \
    echo "Picked stashcp version: $URL ..." && \
    curl -L -o stashcp.deb $URL && \
    apt install ./stashcp.deb && \
    rm -f stashcp.deb

# labeling
RUN mkdir -p /.singularity.d
COPY osg-labels.json /.singularity.d/labels.json
