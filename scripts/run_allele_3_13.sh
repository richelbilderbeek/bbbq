#!/bin/bash
# Script to answer the BBBQ
# on the Peregrine computer cluster
#SBATCH --time=100:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks=1
#SBATCH --mem=1G
#SBATCH --job-name=answer_bbbq
#SBATCH --output=answer_bbbq.log
module load GCCcore/4.9.3
module load XZ/5.2.2-foss-2016a
module load R
#
# percentage of genome ------------------+
#                                        |
# allele number -----+                   |
#                    |                   |
#                    v                   v
Rscript run_allele.R 3 UP000001584_83332_13.fasta
