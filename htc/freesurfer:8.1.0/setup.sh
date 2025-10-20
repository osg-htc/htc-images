#!/bin/bash

# source this file to get the environment set up

# FreeSurfer
export FREESURFER_HOME=/usr/local/freesurfer/8.1.0-1
export MNI_DIR=$FREESURFER_HOME/mni
export LOCAL_DIR=$FREESURFER_HOME/local
export FSFAST_HOME=$FREESURFER_HOME/fsfast
export MINC_BIN_DIR=$FREESURFER_HOME/mni/bin
export MINC_LIB_DIR=$FREESURFER_HOME/mni/lib
export MNI_DATAPATH=$FREESURFER_HOME/mni/data
export FMRI_ANALYSIS_DIR=$FREESURFER_HOME/fsfast
export PERL5LIB=$FREESURFER_HOME/mni/lib/perl5/5.8.5
export MNI_PERL5LIB=$FREESURFER_HOME/mni/lib/perl5/5.8.5
export PATH=$FREESURFER_HOME/bin:$FREESURFER_HOME/fsfast/bin:$FREESURFER_HOME/tktools:$FREESURFER_HOME/mni/bin:$PATH
