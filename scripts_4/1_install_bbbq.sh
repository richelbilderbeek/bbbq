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
# netmhc2pan
################################################################################
echo "Installing netmhc2pan GitHub"
Rscript -e "devtools::install_github(\"richelbilderbeek/netmhc2pan\", ref = \"$branch\")"

echo "Installing NetMHC2pan"
Rscript -e 'netmhc2pan::install_netmhc2pan()'

echo "NetMHC2pan binary installed:"
Rscript -e 'netmhc2pan::is_netmhc2pan_bin_installed()'

echo "NetMHC2pan data installed:"
Rscript -e 'netmhc2pan::is_netmhc2pan_data_installed()'

echo "NetMHC2pan set up:"
Rscript -e 'netmhc2pan::is_netmhc2pan_set_up()'

echo "TCSH installed:"
Rscript -e 'netmhc2pan::is_tcsh_installed()'

echo "NetMHC2pan run:"
Rscript -e 'netmhc2pan::run_netmhc2pan(fasta_filename = system.file("extdata", "example.fasta", package = "netmhc2pan"))'

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
