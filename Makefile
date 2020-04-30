all: inst/extdata/genetic_code.csv inst/extdata/flu_transitions.csv inst/extdata/flu_abundances.csv

inst/extdata/genetic_code.csv:
	Rscript scripts/recreate_genetic_code.R 

inst/extdata/flu_transitions.csv: inst/extdata/Flu_All_it2.txt_PAML.txt
	Rscript scripts/recreate_flu.R 

inst/extdata/flu_abundances.csv: inst/extdata/Flu_All_it2.txt_PAML.txt
	Rscript scripts/recreate_flu.R 

inst/extdata/Flu_All_it2.txt_PAML.txt:
	wget ftp://ftp.sanger.ac.uk/pub/1000genomes/lsq/FLU/Flu_All_it2.txt_PAML.txt \
	  -o inst/extdata/Flu_All_it2.txt_PAML.txt
