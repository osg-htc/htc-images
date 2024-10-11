FROM pytorch/pytorch:2.3.1-cuda11.8-cudnn8-devel

LABEL opensciencegrid.name="PyTorch 2.3.1"
LABEL opensciencegrid.description="A rich ecosystem of tools and libraries extends PyTorch and supports development in computer vision, NLP and more."
LABEL opensciencegrid.url="https://pytorch.org/"
LABEL opensciencegrid.category="Tools"
LABEL opensciencegrid.definition_url="https://github.com/osg-htc/htc-images"

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && \
    apt update && apt install -y --no-install-recommends \
        curl \
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

