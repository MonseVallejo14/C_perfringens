### TRIMMING OF THE Clostridium perfringens GENOME ###

# Monse Vallejo, ENCB, IPN, Mex.
# This is a script to trim Clostridium perfringens genome
# sequences to improve their quality.

# Make sure you are in the edl project folder, at the level
# of 00_raw and 01_qc.

# Trimming
trimmomatic PE -phred33 00_raw/C_perfrin_1.fastq.gz 00_raw/C_perfrin_2.fastq.gz 01_qc/C_perfrin_1.trim.fastq.gz 01_qc/C_perfrin_1U.trim.fq.gz 01_qc/C_perfrin_S01_R2.trim.fastq.gz 01_qc/C_perfrin_2U.trim.fq.gz SLIDINGWINDOW:4:20 MINLEN:240 CROP:250
# NOTE: The length of 240 to 250 bp was determined based on
# the distribution of the length of the sequences in the
# quality control. Adjust it to your parameters.

# Create a report2 directory in 01_qc
cd 01_qc/
mkdir report2

# Repeat QC with fastqc with .trim files
fastqc --nogroup -f fastq C_perfrin_*U.trim.fq.gz -o report2

# Open the .HTML files in the directory report2 to see the reports
cd report2
xdg-open C_perfrin_1U.trim_fastqc.html
xdg-open C_perfrin_2U.trim_fastqc.html
