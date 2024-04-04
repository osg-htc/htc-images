FROM nvidia/cuda:12.3.2-cudnn9-devel-ubuntu22.04

LABEL opensciencegrid.name="Gromacs 2023.4"
LABEL opensciencegrid.description="Gromacs 2023.4 for use on OSG"
LABEL opensciencegrid.url="https://www.gromacs.org/"
LABEL opensciencegrid.category="Tools"
LABEL opensciencegrid.definition_url="https://github.com/osg-htc/htc-images"

COPY 90-gromacs.sh /.singularity.d/env/90-gromacs.sh

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && \
    apt update && apt install -y --no-install-recommends \
        build-essential \
        cmake \
        curl \
        wget \
        && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# stashcp
RUN URL=$(curl -L -s https://api.github.com/repos/htcondor/osdf-client/releases/latest | grep -E "browser_download_url.*/stashcp.*amd64.deb" | head -n 1 |  cut -d : -f 2,3 | tr -d \") && \
    echo "Picked stashcp version: $URL ..." && \
    curl -L -o stashcp.deb $URL && \
    apt install ./stashcp.deb && \
    rm -f stashcp.deb

RUN wget -O /tmp/gromacs.tar.gz http://ftp.gromacs.org/pub/gromacs/gromacs-2023.4.tar.gz && \
    tar -xvf /tmp/gromacs.tar.gz -C /tmp && \
    cd /tmp/gromacs* && \
    mkdir build && \
    cd /tmp/gromacs*/build && \
    cmake .. \
           -DCMAKE_INSTALL_PREFIX=/usr/local/gromacs \
           -DGMX_SIMD=AVX2_256 \
           -DGMXAPI=ON \
           -DGMX_THREAD_MPI=ON \
           -DGMX_GPU=CUDA \
           -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda \
           -DGMX_BUILD_OWN_FFTW=ON \
           -DGMX_BUILD_HELP=OFF \
           -DGMX_USE_RDTSCP=OFF \
           -DGMX_INSTALL_LEGACY_API=ON \
           -DCMAKE_BUILD_TYPE=Release && \
    make && \
    make tests && \
    make install

#cmake .. -DGMX_MPI=on -DGMX_THREAD_MPI=ON -DGMX_GPU=ON -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda -DGMX_BUILD_OWN_FFTW=ON -DCMAKE_INSTALL_PREFIX=/opt/gromacs && \
#make -j $(nproc) && make install

