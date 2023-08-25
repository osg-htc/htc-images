FROM hub.opensciencegrid.org/htc/rocky:8

LABEL opensciencegrid.name="Matlab Runtime"
LABEL opensciencegrid.description="This is the Matlab runtime component you can use to execute compiled Matlab codes"
LABEL opensciencegrid.url="https://www.mathworks.com/products/compiler/matlab-runtime.html"
LABEL opensciencegrid.category="Languages"
LABEL opensciencegrid.definition_url="https://github.com/opensciencegrid/osgvo-matlab-runtime"

COPY labels.json /.singularity.d/labels.json
COPY 90-osgvo-matlab-runtime.sh /.singularity.d/env/90-osgvo-matlab-runtime.sh

RUN wget -nv https://ssd.mathworks.com/supportfiles/downloads/R2023a/Release/3/deployment_files/installer/complete/glnxa64/MATLAB_Runtime_R2023a_Update_3_glnxa64.zip && \
    unzip MATLAB*.zip -d MATLAB_Runtime_Installer && \
    cd MATLAB_Runtime_Installer && \
    ./install -mode silent -agreeToLicense yes -outputFile ./install.log && \
    cd .. && \
    rm -rf MATLAB*.zip MATLAB_Runtime_Installer
