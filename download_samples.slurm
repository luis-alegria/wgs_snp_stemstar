#!/bin/bash --login

#SBATCH --job-name=download_wgs_snp_samples
#SBATCH --account=
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6
#SBATCH --time=00:30:00
#SBATCH --out=download_wgs_snp_samples.out
#SBATCH --chdir=
#SBATCH --mail-user=
#SBATCH --mail-type=BEGIN,END,FAIL

module load sratoolkit/3.1.1

mkdir wgs_snp_samples
cd wgs_snp_samples

# Download samples in sample_sra_ids.txt from NCBI SRA with sratoolkit
while IFS= read -r sra_id; do
    echo "Downloading $sra_id"
    fasterq-dump --split-files --origfmt --gzip "$sra_id"
done < ../sample_sra_ids.txt