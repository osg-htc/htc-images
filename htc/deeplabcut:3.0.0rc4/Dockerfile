FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu22.04

LABEL opensciencegrid.name="DeepLabCut 3.0.0rc3"
LABEL opensciencegrid.description="A software package for animal pose estimation"
LABEL opensciencegrid.url="https://www.mackenziemathislab.org/deeplabcut"
LABEL opensciencegrid.category="Tools"
LABEL opensciencegrid.definition_url="https://github.com/osg-htc/htc-images"

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && \
    apt update -y && apt install -y --no-install-recommends \
        ca-certificates \
        curl \
        ffmpeg \
        gnupg \
        libsm6 \
        libxext6 \
        python3-pip \
        && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Install DeepLabCut and other Python dependencies
RUN python3 -m pip install --upgrade \
        deeplabcut==3.0.0rc4 \
        numpy \
        tensorflow==2.10 \
        tensorpack==0.11 \
        tensorrt \
        tf_slim \
        torch==2.4.1 \
    && \
    python3 -m pip install protobuf==3.19.5 && \
    rm -rf /root/.cache
 
# Pretrained directory has to be on a writeable disk. Once this image is 
# converted to singularity, use /tmp for this directory.
RUN mv /usr/local/lib/python3.10/dist-packages/deeplabcut/pose_estimation_tensorflow/models/pretrained /usr/local/lib/python3.10/dist-packages/deeplabcut/pose_estimation_tensorflow/models/pretrained.ORIG && \
    ln -s /tmp/pretrained /usr/local/lib/python3.10/dist-packages/deeplabcut/pose_estimation_tensorflow/models/pretrained

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

