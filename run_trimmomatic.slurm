#!/bin/bash

#SBATCH --job-name=run_trimmomatic
#SBATCH --account=
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH --time=05:00:00
#SBATCH --out=trimmomatic.out
#SBATCH --chdir=
#SBATCH --mail-user=
#SBATCH --mail-type=BEGIN,END,FAIL

module load trimmomatic/0.39

adapters="$TRIMMOMATIC_BASE/bin/adapters/TruSeq3-PE.fa"
cd ./wgs_snp_samples

for fastq_file in ./*_1.fastq; do
    base=$(basename "$fastq_file" _1.fastq)
    trimmomatic PE -threads 10 \
        ${fastq_file} ${base}_2.fastq \
        ${base}_1.trim.fastq ${base}_1.trim_un.fastq \
        ${base}_2.trim.fastq ${base}_2.trim_un.fastq \
        ILLUMINACLIP:"$adapters":2:30:10 \
        SLIDINGWINDOW:4:20 \
        MINLEN:50 \
        AVGQUAL:20
done

# move trimmed files to a new directory
mkdir ../trimmed_samples
mv *.trim.fastq ../trimmed_samples/
