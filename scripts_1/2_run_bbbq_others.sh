#!/bin/bash
# Script to answer the BBBQ
# on the Peregrine computer cluster
#SBATCH --time=1:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks=1
#SBATCH --mem=1G
#SBATCH --job-name=answer_bbbq
#SBATCH --output=answer_bbbq.log
module load GCCcore/4.9.3
module load XZ/5.2.2-foss-2016a
module load R

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
# Using R regex ...
#
# > cat(paste("sbatch run_bbbq.sh", grep("DPB10101", netmhc2pan::get_netmhc2pan_alleles(), perl = TRUE, value = TRUE)), sep = '\n')
#
# to get:
sbatch run_bbbq.sh HLA-DPA10103-DPB10101
sbatch run_bbbq.sh HLA-DPA10104-DPB10101
sbatch run_bbbq.sh HLA-DPA10105-DPB10101
sbatch run_bbbq.sh HLA-DPA10106-DPB10101
sbatch run_bbbq.sh HLA-DPA10107-DPB10101
sbatch run_bbbq.sh HLA-DPA10108-DPB10101
sbatch run_bbbq.sh HLA-DPA10109-DPB10101
sbatch run_bbbq.sh HLA-DPA10110-DPB10101
sbatch run_bbbq.sh HLA-DPA10201-DPB10101
sbatch run_bbbq.sh HLA-DPA10202-DPB10101
sbatch run_bbbq.sh HLA-DPA10203-DPB10101
sbatch run_bbbq.sh HLA-DPA10204-DPB10101
sbatch run_bbbq.sh HLA-DPA10301-DPB10101
sbatch run_bbbq.sh HLA-DPA10302-DPB10101
sbatch run_bbbq.sh HLA-DPA10303-DPB10101
sbatch run_bbbq.sh HLA-DPA10401-DPB10101

# DPB1*0201
# Use R code:
# cat(paste("sbatch run_bbbq.sh", grep("DPB10201", netmhc2pan::get_netmhc2pan_alleles(), perl = TRUE, value = TRUE)), sep = '\n')
sbatch run_bbbq.sh HLA-DPA10103-DPB10201
sbatch run_bbbq.sh HLA-DPA10104-DPB10201
sbatch run_bbbq.sh HLA-DPA10105-DPB10201
sbatch run_bbbq.sh HLA-DPA10106-DPB10201
sbatch run_bbbq.sh HLA-DPA10107-DPB10201
sbatch run_bbbq.sh HLA-DPA10108-DPB10201
sbatch run_bbbq.sh HLA-DPA10109-DPB10201
sbatch run_bbbq.sh HLA-DPA10110-DPB10201
sbatch run_bbbq.sh HLA-DPA10201-DPB10201
sbatch run_bbbq.sh HLA-DPA10202-DPB10201
sbatch run_bbbq.sh HLA-DPA10203-DPB10201
sbatch run_bbbq.sh HLA-DPA10204-DPB10201
sbatch run_bbbq.sh HLA-DPA10301-DPB10201
sbatch run_bbbq.sh HLA-DPA10302-DPB10201
sbatch run_bbbq.sh HLA-DPA10303-DPB10201
sbatch run_bbbq.sh HLA-DPA10401-DPB10201

# DPB1*0401
# > cat(paste("sbatch run_bbbq.sh", grep("DPB10401", netmhc2pan::get_netmhc2pan_alleles(), perl = TRUE, value = TRUE)), sep = '\n')
sbatch run_bbbq.sh HLA-DPA10103-DPB10401
sbatch run_bbbq.sh HLA-DPA10104-DPB10401
sbatch run_bbbq.sh HLA-DPA10105-DPB10401
sbatch run_bbbq.sh HLA-DPA10106-DPB10401
sbatch run_bbbq.sh HLA-DPA10107-DPB10401
sbatch run_bbbq.sh HLA-DPA10108-DPB10401
sbatch run_bbbq.sh HLA-DPA10109-DPB10401
sbatch run_bbbq.sh HLA-DPA10110-DPB10401
sbatch run_bbbq.sh HLA-DPA10201-DPB10401
sbatch run_bbbq.sh HLA-DPA10202-DPB10401
sbatch run_bbbq.sh HLA-DPA10203-DPB10401
sbatch run_bbbq.sh HLA-DPA10204-DPB10401
sbatch run_bbbq.sh HLA-DPA10301-DPB10401
sbatch run_bbbq.sh HLA-DPA10302-DPB10401
sbatch run_bbbq.sh HLA-DPA10303-DPB10401
sbatch run_bbbq.sh HLA-DPA10401-DPB10401

# DPB1*0402
# > cat(paste("sbatch run_bbbq.sh", grep("DPB10402", netmhc2pan::get_netmhc2pan_alleles(), perl = TRUE, value = TRUE)), sep = '\n')
sbatch run_bbbq.sh HLA-DPA10103-DPB10402
sbatch run_bbbq.sh HLA-DPA10104-DPB10402
sbatch run_bbbq.sh HLA-DPA10105-DPB10402
sbatch run_bbbq.sh HLA-DPA10106-DPB10402
sbatch run_bbbq.sh HLA-DPA10107-DPB10402
sbatch run_bbbq.sh HLA-DPA10108-DPB10402
sbatch run_bbbq.sh HLA-DPA10109-DPB10402
sbatch run_bbbq.sh HLA-DPA10110-DPB10402
sbatch run_bbbq.sh HLA-DPA10201-DPB10402
sbatch run_bbbq.sh HLA-DPA10202-DPB10402
sbatch run_bbbq.sh HLA-DPA10203-DPB10402
sbatch run_bbbq.sh HLA-DPA10204-DPB10402
sbatch run_bbbq.sh HLA-DPA10301-DPB10402
sbatch run_bbbq.sh HLA-DPA10302-DPB10402
sbatch run_bbbq.sh HLA-DPA10303-DPB10402
sbatch run_bbbq.sh HLA-DPA10401-DPB10402

# DPB1*0501
# > cat(paste("sbatch run_bbbq.sh", grep("DPB10501", netmhc2pan::get_netmhc2pan_alleles(), perl = TRUE, value = TRUE)), sep = '\n')
sbatch run_bbbq.sh HLA-DPA10103-DPB10501
sbatch run_bbbq.sh HLA-DPA10104-DPB10501
sbatch run_bbbq.sh HLA-DPA10105-DPB10501
sbatch run_bbbq.sh HLA-DPA10106-DPB10501
sbatch run_bbbq.sh HLA-DPA10107-DPB10501
sbatch run_bbbq.sh HLA-DPA10108-DPB10501
sbatch run_bbbq.sh HLA-DPA10109-DPB10501
sbatch run_bbbq.sh HLA-DPA10110-DPB10501
sbatch run_bbbq.sh HLA-DPA10201-DPB10501
sbatch run_bbbq.sh HLA-DPA10202-DPB10501
sbatch run_bbbq.sh HLA-DPA10203-DPB10501
sbatch run_bbbq.sh HLA-DPA10204-DPB10501
sbatch run_bbbq.sh HLA-DPA10301-DPB10501
sbatch run_bbbq.sh HLA-DPA10302-DPB10501
sbatch run_bbbq.sh HLA-DPA10303-DPB10501
sbatch run_bbbq.sh HLA-DPA10401-DPB10501

# DPB1*1401
# > cat(paste("sbatch run_bbbq.sh", grep("DPB11401", netmhc2pan::get_netmhc2pan_alleles(), perl = TRUE, value = TRUE)), sep = '\n')
sbatch run_bbbq.sh HLA-DPA10103-DPB11401
sbatch run_bbbq.sh HLA-DPA10104-DPB11401
sbatch run_bbbq.sh HLA-DPA10105-DPB11401
sbatch run_bbbq.sh HLA-DPA10106-DPB11401
sbatch run_bbbq.sh HLA-DPA10107-DPB11401
sbatch run_bbbq.sh HLA-DPA10108-DPB11401
sbatch run_bbbq.sh HLA-DPA10109-DPB11401
sbatch run_bbbq.sh HLA-DPA10110-DPB11401
sbatch run_bbbq.sh HLA-DPA10201-DPB11401
sbatch run_bbbq.sh HLA-DPA10202-DPB11401
sbatch run_bbbq.sh HLA-DPA10203-DPB11401
sbatch run_bbbq.sh HLA-DPA10204-DPB11401
sbatch run_bbbq.sh HLA-DPA10301-DPB11401
sbatch run_bbbq.sh HLA-DPA10302-DPB11401
sbatch run_bbbq.sh HLA-DPA10303-DPB11401
sbatch run_bbbq.sh HLA-DPA10401-DPB11401