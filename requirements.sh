### PREPARATION OF THE WORK ENVIRONMENT WITH BACTERIAL GENOMES ###

# Monse Vallejo, ENCB, IPN, Mex.
# This is a script to install miniconda in linux, add the bioconda and
# forge-conda channels, and install mamba for working with bacterial genomes.

# Installation of miniconda for linux 
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
# NOTE: For other operating systems, or different Linux versions, visit the
# following page:
# https://docs.anaconda.com/free/miniconda/miniconda-install/

# Initialize conda in the bash shell or zsh
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh

# Add conda channels
nano $HOME/.condarc
# Add the channels bioconda and conda-forge and exit
# NOTE: If you have a previous installation of conda, first check the .condarc
# file to avoid duplication of channels, which could generate an error when you
# want to install programs.

# Install mamba
conda install -yc conda-forge mamba
