### QUALITY CONTROL OF THE Clostridium perfringens GENOME ###

# Monse Vallejo, ENCB, IPN, Mex.
# This is a script to do quality control with the fastqc program of
# the Clostridium perfringens genome sequenced with Ilumina MiSeq.

# Requirements:
# - Have miniconda installed and initialized
# - Add bioconda and conda-forge channels to conda
# - Have mamba installed

# Create the work environment and install fastqc and trimmomatic
# (the latter is used in the next stage)
mamba create -n qc -yc bioconda fastqc trimmomatic

# Create the project directory wherever you want (desktop
# recommended with the bacteria species)
cd ~/Desktop
mkdir C_perfrin
cd C_perfrin/

# Create raw_00 and 01_qc directories
mkdir 00_raw
mkdir 01_qc

# Download and save the genome sequences with the accession number
cd 00_raw
wget -O C_perfrin_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR147/027/SRR14715227/SRR14715227_1.fastq.gz
wget -O C_perfrin_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR147/027/SRR14715227/SRR14715227_2.fastq.gz

# Activate the qc environment
conda activate qc

# Make and save reports directly in the 01_qc folder
cd ../01_qc
mkdir report1
cd ../00_raw
fastqc --nogroup -f fastq C_perfrin_*fastq.gz -o ../01_qc/report1

# Open the .HTML files in the directory report1 to see the reports
cd ../01_qc/report1
xdg-open C_perfrin_1_fastqc.html 
xdg-open C_perfrin_2_fastqc.html 
