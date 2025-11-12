FROM almalinux:10

LABEL opensciencegrid.name="AlmaLinux 10"
LABEL opensciencegrid.description="AlmaLinux 10 base image"
LABEL opensciencegrid.url="https://almalinux.org/"
LABEL opensciencegrid.category="Base"
LABEL opensciencegrid.definition_url="https://github.com/osg-htc/htc-images"

# base dnf/yum setup
RUN dnf -y update && \
    dnf -y install yum-utils && \
    dnf -y install epel-release

# osg repo
RUN dnf -y install https://repo.opensciencegrid.org/osg/25-main/osg-25-main-el10-release-latest.rpm

# pegasus repo 
RUN echo -e "# Pegasus\n[Pegasus]\nname=Pegasus\nbaseurl=https://download.pegasus.isi.edu/pegasus/development/5.1/rhel/10/\$basearch/\ngpgcheck=0\nenabled=1\npriority=50" >/etc/yum.repos.d/pegasus.repo

# well rounded basic system to support a wide range of user jobs
RUN dnf -y groupinstall "Development Tools" \
                        "Scientific Support"

RUN dnf -y install --allowerasing \
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
           java-21-openjdk \
           java-21-openjdk-devel \
           jq \
           libgfortran \
           libGLU \
           libgomp \
           libicu \
           libtool \
           libtool-ltdl \
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
           pegasus \
           pelican \
           pelican-osdf-compat \
           python3-devel \
           python3-numpy \
           python3-scipy \
           rsync \
           subversion \
           tcl-devel \
           tcsh \
           time \
           tk-devel \
           wget \
           which \
           xxhash-devel

# pelican
RUN dnf -y upgrade --enablerepo=osg-upcoming pelican pelican-osdf-compat

# Cleaning caches to reduce size of image
RUN dnf clean all

# build info
RUN echo "Timestamp:" `date --utc` | tee /image-build-info.txt

