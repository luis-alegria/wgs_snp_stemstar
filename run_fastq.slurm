#SBATCH --job-name=run_fastq
#SBATCH --account=
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6
#SBATCH --time=01:00:00
#SBATCH --out=run_fastq.out
#SBATCH --chdir=
#SBATCH --mail-user=
#SBATCH --mail-type=BEGIN,END,FAIL

module load fastqc
mkdir ./fastqc_results_pretrim

for fastq_file in ./wgs_snp_samples/*.fastq; do
    fastqc "$fastq_file" --outdir ./fastqc_results_pretrim --quiet
done