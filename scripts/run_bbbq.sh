#!/bin/bash
# Script to answer the BBBQ
# on the Peregrine computer cluster
#SBATCH --time=100:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks=1
#SBATCH --mem=1G
#SBATCH --job-name=run_bbq-%j
#SBATCH --output=run_bbq-%j.log
module load GCCcore/4.9.3
module load XZ/5.2.2-foss-2016a
module load R
echo $1
Rscript run_allele.R $1
