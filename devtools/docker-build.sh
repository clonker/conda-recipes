#!/bin/bash
set -e
# Activate Holy Build Box environment.
source /hbb_exe/activate

echo "UPLOAD = $UPLOAD"

set -x
yum install -y git
curl -s -O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p /anaconda
PATH=/opt/rh/devtoolset-2/root/usr/bin:/opt/rh/autotools-latest/root/usr/bin:/anaconda/bin:$PATH
conda config --add channels omnia
conda install -yq conda-build jinja2 anaconda-client
/io/conda-build-all --check-against omnia $UPLOAD /io/*
