FROM hub.opensciencegrid.org/htc/ubuntu:22.04

LABEL opensciencegrid.name="scikit-learn:1.3.2"
LABEL opensciencegrid.description="scikit-learn, configured for execution on OSG"
LABEL opensciencegrid.url="https://scikit-learn.org/"
LABEL opensciencegrid.category="AI"
LABEL opensciencegrid.definition_url="https://github.com/osg-htc/htc-images"

COPY 90-scikit-learn.sh /.singularity.d/env/90-scikit-learn.sh

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && \
    apt update && apt install -y --no-install-recommends \
        python3-venv \
        && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN cd /opt && \
    python3 -m venv sklearn-venv && \
    . sklearn-venv/bin/activate && \
    pip3 install -U scikit-learn==1.3.2


