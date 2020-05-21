#!/bin/bash
# Script to install bbbq and its dependencies
# on the Peregrine computer cluster
#
# Usage:
#
# * To install master:
#
# sbatch 1_install_bbbq.sh
#
# * To install a branch, e.g. develop:
#
# sbatch 1_install_bbbq.sh develop
#
#SBATCH --time=1:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks=1
#SBATCH --mem=1G
#SBATCH --job-name=install_bbbq
#SBATCH --output=install_bbbq.log
module load GCCcore/4.9.3
module load XZ/5.2.2-foss-2016a
module load Perl
module load R

branch=$1
if [ "$#" -ne 1 ]; then
  branch=master
fi


################################################################################
# pureseqtmr
################################################################################
echo "Installing pureseqtmr GitHub"
Rscript -e "devtools::install_github(\"richelbilderbeek/pureseqtmr\", ref = \"$branch\")"

echo "Installing PureseqTM"
Rscript -e 'pureseqtmr::install_pureseqtm()'

################################################################################
# BBBQ
################################################################################

echo "Installing bbbq GitHub"
Rscript -e "devtools::install_github(\"richelbilderbeek/bbbq\", ref = \"$branch\")"

echo "bbbq run:"
Rscript -e 'bbbq::answer_bbbq_1(system.file("extdata", "short.fasta", package = "bbbq"))'

