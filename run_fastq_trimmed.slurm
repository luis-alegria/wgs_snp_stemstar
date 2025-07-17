#!/bin/bash

#SBATCH --job-name=run_fastq_trimmed
#SBATCH --account=
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH --time=01:00:00
#SBATCH --out=run_fastq_trim.out
#SBATCH --chdir=
#SBATCH --mail-user=
#SBATCH --mail-type=BEGIN,END,FAIL

module load fastqc
mkdir ./fastqc_results_posttrim

for fastq_file in ./trimmed_samples/*.trim.fastq; do
    fastqc "$fastq_file" --threads 10 \
    --outdir ./fastqc_results_posttrim --quiet
done