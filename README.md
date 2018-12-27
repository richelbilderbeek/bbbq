# bbbq

Branch|[![Travis CI logo](pics/TravisCI.png)](https://travis-ci.org)|[![Codecov logo](pics/Codecov.png)](https://www.codecov.io)
---|---|---
`master`|[![Build Status](https://travis-ci.org/richelbilderbeek/bbbq.svg?branch=master)](https://travis-ci.org/richelbilderbeek/bbbq) | [![codecov.io](https://codecov.io/github/richelbilderbeek/bbbq/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/bbbq?branch=master)
`develop`|[![Build Status](https://travis-ci.org/richelbilderbeek/bbbq.svg?branch=develop)](https://travis-ci.org/richelbilderbeek/bbbq) | [![codecov.io](https://codecov.io/github/richelbilderbeek/bbbq/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/bbbq?branch=develop)

The Bilderbeek Bianchi and Bogaart Question.

### Links

 * [epitope-prediction](https://github.com/jtextor/epitope-prediction)
 * [NetMHCIIpan](www.cbs.dtu.dk/services/NetMHCIIpan) website

## Genomes

Takes from the 
[overview of reference genomes](ftp://ftp.ebi.ac.uk/pub/databases/reference_proteomes/QfO/README):

Genome|URL
---|---
Tuberculosis|[ftp://ftp.ebi.ac.uk/pub/databases/reference_proteomes/QfO/Bacteria/UP000001584_83332.fasta.gz](ftp://ftp.ebi.ac.uk/pub/databases/reference_proteomes/QfO/Bacteria/UP000001584_83332.fasta.gz)
Human|[ftp://ftp.ebi.ac.uk/pub/databases/reference_proteomes/QfO/Eukaryota/UP000005640_9606.fasta.gz](ftp://ftp.ebi.ac.uk/pub/databases/reference_proteomes/QfO/Eukaryota/UP000005640_9606.fasta.gz)

## TMH prediction

Done by [the TMHMM server](http://www.cbs.dtu.dk/services/TMHMM).

```
wget -O tmhmm_result.html http://www.cbs.dtu.dk//cgi-bin/webface2.fcgi?jobid=5C20C1FC00000E32D41A9103
cat tmhmm_result.html | egrep "^[a-z]{2}\|" > tmhmm_result.txt
```
