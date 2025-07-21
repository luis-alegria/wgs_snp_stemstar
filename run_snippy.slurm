#!/bin/bash --login

#SBATCH --job-name=run_snippy
#SBATCH --account=
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --time=05:00:00
#SBATCH --out=snippy_run.out
#SBATCH --chdir=
#SBATCH --mail-user=
#SBATCH --mail-type=BEGIN,END,FAIL

source ~/.bashrc

module load micromamba
micromamba activate snippy

./run_snippy_for_core_snps.sh

micromamba deactivate
module unload snippy