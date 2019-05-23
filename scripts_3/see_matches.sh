#!/bin/bash
# egrep "AAAGFAS" ../inst/extdata/UP000001584_83332.fasta 

while read LINE; 
do 
  egrep $LINE ../inst/extdata/UP000001584_83332.fasta
done < elutes.txt
