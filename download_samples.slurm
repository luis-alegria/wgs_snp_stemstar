#!/bin/bash

#SBATCH --job-name=download_wgs_snp_samples
#SBATCH --account=
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6
#SBATCH --time=02:00:00
#SBATCH --out=download_wgs_snp_samples_test.out
#SBATCH --chdir=
#SBATCH --mail-user=
#SBATCH --mail-type=BEGIN,END,FAIL

module load sratoolkit/3.1.1

# Download samples with prefetch, convert to fastq, remove SRA directory and file
while IFS= read -r sra_id; do
    prefetch "$sra_id" && \
    fasterq-dump "$sra_id" --split-files --outdir ./wgs_snp_samples
    rm -rf "$sra_id"
done < sample_sra_ids.txt