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
sbatch run_bbbq.sh DRB1*0101
sbatch run_bbbq.sh DRB1*0301
sbatch run_bbbq.sh DRB1*0401
sbatch run_bbbq.sh DRB1*0405
sbatch run_bbbq.sh DRB1*0701
sbatch run_bbbq.sh DRB1*0802
sbatch run_bbbq.sh DRB1*0901
sbatch run_bbbq.sh DRB1*1101
sbatch run_bbbq.sh DRB1*1201
sbatch run_bbbq.sh DRB1*1302
sbatch run_bbbq.sh DRB1*1501
sbatch run_bbbq.sh DRB3*0101
sbatch run_bbbq.sh DRB3*0202
sbatch run_bbbq.sh DRB4*0101
sbatch run_bbbq.sh DRB5*0101
sbatch run_bbbq.sh DQA1*0501/DQB1*0201
sbatch run_bbbq.sh DQA1*0501/DQB1*0301
sbatch run_bbbq.sh DQA1*0301/DQB1*0302
sbatch run_bbbq.sh DQA1*0401/DQB1*0402
sbatch run_bbbq.sh DQA1*0101/DQB1*0501
sbatch run_bbbq.sh DQA1*0102/DQB1*0602
sbatch run_bbbq.sh DPB1*0101
sbatch run_bbbq.sh DPB1*0201
sbatch run_bbbq.sh DPB1*0401
sbatch run_bbbq.sh DPB1*0402
sbatch run_bbbq.sh DPB1*0501
sbatch run_bbbq.sh DPB1*1401
