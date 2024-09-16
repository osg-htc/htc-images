FROM nvidia/cuda:12.6.0-cudnn-devel-rockylinux9

LABEL opensciencegrid.name="Rocky 9 / CUDA 2.6.0"
LABEL opensciencegrid.description="Rocky Linux 9 / CUDA 12.6.0 image"
LABEL opensciencegrid.url="https://rockylinux.org/"
LABEL opensciencegrid.category="Base"
LABEL opensciencegrid.definition_url="https://github.com/osg-htc/htc-images"

# base dnf/yum setup
RUN dnf -y update && \
    dnf -y install yum-utils && \
    dnf -y config-manager --set-enabled crb && \
    dnf -y install epel-release

# osg repo
RUN dnf -y install https://repo.opensciencegrid.org/osg/23-main/osg-23-main-el9-release-latest.rpm
   
# pegasus repo
RUN echo -e "# Pegasus\n[Pegasus]\nname=Pegasus\nbaseurl=http://download.pegasus.isi.edu/wms/download/rhel/9/\$basearch/\ngpgcheck=0\nenabled=1\npriority=50" >/etc/yum.repos.d/pegasus.repo

# well rounded basic system to support a wide range of user jobs
RUN dnf -y groupinstall "Development Tools" \
                        "Scientific Support"

RUN dnf -y install --allowerasing --enablerepo=osg-testing \
           bc \
           binutils \
           binutils-devel \
           coreutils \
           curl \
           fontconfig \
           gcc \
           gcc-c++ \
           gcc-gfortran \
           git \
           glib2-devel \
           glibc-langpack-en \
           glibc-locale-source \
           graphviz \
           gsl-devel \
           ImageMagick \
           iputils \
           java-17-openjdk \
           java-17-openjdk-devel \
           jq \
           libgfortran \
           libGLU \
           libgomp \
           libicu \
           libquadmath \
           libtool \
           libtool-ltdl \
           libtool-ltdl-devel \
           libX11-devel \
           libXaw-devel \
           libXext-devel \
           libXft-devel \
           libxml2 \
           libxml2-devel \
           libXmu-devel \
           libXpm \
           libXpm-devel \
           libXt \
           mesa-libGL-devel \
           openssh \
           openssh-server \
           osg-ca-certs \
           osg-wn-client \
           pegasus \
           python3-devel \
           python3-numpy \
           python3-scipy \
           rsync \
           stashcp \
           subversion \
           tcl-devel \
           tcsh \
           time \
           tk-devel \
           wget \
           which

# pelican
RUN dnf -y upgrade --enablerepo=osg-upcoming stashcp

# Cleaning caches to reduce size of image
RUN dnf clean all

# make sure we have a way to bind host provided libraries
# see https://github.com/singularityware/singularity/issues/611
RUN mkdir -p /host-libs /etc/OpenCL/vendors

# build info
RUN echo "Timestamp:" `date --utc` | tee /image-build-info.txt

