FROM nvidia/cuda:11.0.3-cudnn8-devel-rockylinux8

LABEL opensciencegrid.name="Rocky 8 / CUDA 11.0.3"
LABEL opensciencegrid.description="Rocky Linux 8 / CUDA 11.0.3 image"
LABEL opensciencegrid.url="https://rockylinux.org/"
LABEL opensciencegrid.category="Base"
LABEL opensciencegrid.definition_url="https://github.com/osg-htc/htc-images"

# base dnf/yum setup
RUN dnf -y update && \
    dnf -y install 'dnf-command(config-manager)' && \
    yum -y config-manager --set-enabled powertools && \
    dnf -y install epel-release

# osg repo
RUN dnf -y install https://repo.osg-htc.org/osg/25-main/osg-25-main-el8-release-latest.rpm
   
# pegasus repo - 5.1.2dev repo
RUN echo -e "# Pegasus\n[Pegasus]\nname=Pegasus\nbaseurl=https://download.pegasus.isi.edu/pegasus/development/5.1/rhel/8/\$basearch/\ngpgcheck=0\nenabled=1\npriority=50" >/etc/yum.repos.d/pegasus.repo

# well rounded basic system to support a wide range of user jobs
RUN dnf -y groupinstall "Development Tools" \
                        "Scientific Support"

RUN dnf -y install --allowerasing --enablerepo=osg-testing \
           redhat-lsb \
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
           java-11-openjdk \
           java-11-openjdk-devel \
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
           pelican \
           pelican-osdf-compat \
           python3-devel \
           python3-numpy \
           python3-scipy \
           redhat-lsb-core \
           rsync \
           stashcp \
           subversion \
           tcl-devel \
           tcsh \
           time \
           tk-devel \
           wget \
           which \
    && dnf -y clean all

# pelican
RUN dnf -y upgrade --enablerepo=osg-upcoming pelican pelican-osdf-compat \
    && dnf -y clean all

# make sure we have a way to bind host provided libraries
# see https://github.com/singularityware/singularity/issues/611
RUN mkdir -p /host-libs /etc/OpenCL/vendors

# build info
RUN echo "Timestamp:" `date --utc` | tee /image-build-info.txt

