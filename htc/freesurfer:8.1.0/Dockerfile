FROM hub.opensciencegrid.org/htc/rocky:8

LABEL opensciencegrid.name="FreeSurfer"
LABEL opensciencegrid.description="A software package for the analysis and visualization of structural and functional neuroimaging data from cross-sectional or longitudinal studies"
LABEL opensciencegrid.url="https://surfer.nmr.mgh.harvard.edu/fswiki/FreeSurferWiki"
LABEL opensciencegrid.category="Tools"
LABEL opensciencegrid.definition_url="https://github.com/opensciencegrid/osgvo-freesurfer"

RUN rpm -e --noscripts pegasus && \
    dnf -y upgrade --disablerepo=Pegasus --skip-broken --nobest && \
    dnf -y install --disablerepo=Pegasus \
      tcsh \
      https://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/8.1.0/freesurfer-Rocky8-8.1.0-1.x86_64.rpm && \
    dnf -y clean all && \
    rm -rf /var/tmp/yum*

# build info
RUN echo "Timestamp:" `date --utc` | tee /image-build-info.txt

# environment
ENV FREESURFER_HOME=/usr/local/freesurfer/8.1.0-1
ENV MNI_DIR=/usr/local/freesurfer/8.1.0-1/mni
ENV LOCAL_DIR=/usr/local/freesurfer/8.1.0-1/local
ENV FSFAST_HOME=/usr/local/freesurfer/8.1.0-1/fsfast
ENV MINC_BIN_DIR=/usr/local/freesurfer/8.1.0-1/mni/bin
ENV MINC_LIB_DIR=/usr/local/freesurfer/8.1.0-1/mni/lib
ENV MNI_DATAPATH=/usr/local/freesurfer/8.1.0-1/mni/data
ENV FMRI_ANALYSIS_DIR=/usr/local/freesurfer/8.1.0-1/fsfast
ENV PERL5LIB=/usr/local/freesurfer/8.1.0-1/mni/lib/perl5/5.8.5
ENV MNI_PERL5LIB=/usr/local/freesurfer/8.1.0-1/mni/lib/perl5/5.8.5
ENV PATH=/usr/local/freesurfer/8.1.0-1/bin:/usr/local/freesurfer/8.1.0-1/fsfast/bin:/usr/local/freesurfer/8.1.0-1/tktools:/usr/local/freesurfer/8.1.0-1/mni/bin:/usr/bin:/bin


