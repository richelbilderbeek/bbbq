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
# DRB1*0101
sbatch run_bbbq.sh DRB1_0101
 
# DRB1*0301
sbatch run_bbbq.sh DRB1_0301

# DRB1*0401
sbatch run_bbbq.sh DRB1_0401

# DRB1*0405
sbatch run_bbbq.sh DRB1_0405

# DRB1*0701
sbatch run_bbbq.sh DRB1_0701

# DRB1*0802
sbatch run_bbbq.sh DRB1_0802

# DRB1*0901
sbatch run_bbbq.sh DRB1_0901

# DRB1*1101
sbatch run_bbbq.sh DRB1_1101

# DRB1*1201
sbatch run_bbbq.sh DRB1_1201

# DRB1*1302
sbatch run_bbbq.sh DRB1_1302

# DRB1*1501
sbatch run_bbbq.sh DRB1_1501

# DRB3*0101
sbatch run_bbbq.sh DRB3_0101

# DRB3*0202
sbatch run_bbbq.sh DRB3_0202

# DRB4*0101
sbatch run_bbbq.sh DRB4_0101

# DRB5*0101
sbatch run_bbbq.sh DRB5_0101 

# DQA1*0501/DQB1*0201
sbatch run_bbbq.sh HLA-DQA10501-DQB10201

# DQA1*0501/DQB1*0301
sbatch run_bbbq.sh HLA-DQA10501-DQB10301

# DQA1*0301/DQB1*0302
sbatch run_bbbq.sh HLA-DQA10301-DQB10302

# DQA1*0401/DQB1*0402
sbatch run_bbbq.sh HLA-DQA10401-DQB10402

# DQA1*0101/DQB1*0501
sbatch run_bbbq.sh HLA-DQA10101-DQB10501

# DQA1*0102/DQB1*0602
sbatch run_bbbq.sh HLA-DQA10102-DQB10602

# DPB1*0101
# Has many:
# * HLA-DPA10103-DPB10101               
# * HLA-DPA10104-DPB10101               
# * HLA-DPA10105-DPB10101               
# * HLA-DPA10106-DPB10101               
# * HLA-DPA10107-DPB10101               
# * HLA-DPA10108-DPB10101               
# * HLA-DPA10109-DPB10101               
# * HLA-DPA10110-DPB10101               
# * HLA-DPA10201-DPB10101               
# * HLA-DPA10202-DPB10101               
# * HLA-DPA10203-DPB10101               
# * HLA-DPA10204-DPB10101               
# * HLA-DPA10301-DPB10101               
# * HLA-DPA10302-DPB10101               
# * HLA-DPA10303-DPB10101               
# * HLA-DPA10401-DPB10101 
#sbatch run_bbbq.sh DPB10101

# DPB1*0201
# Has many
#sbatch run_bbbq.sh DPB10201

# DPB1*0401
# Has many
#sbatch run_bbbq.sh DPB10401

# DPB1*0402
# Has many
#sbatch run_bbbq.sh DPB10402

# DPB1*0501
# Has many
#sbatch run_bbbq.sh DPB10501

# DPB1*1401
# Has many
#sbatch run_bbbq.sh DPB11401
