# bbbq

Branch|[![Travis CI logo](pics/TravisCI.png)](https://travis-ci.org)|[![Codecov logo](pics/Codecov.png)](https://www.codecov.io)
---|---|---
`master`|[![Build Status](https://travis-ci.org/richelbilderbeek/bbbq.svg?branch=master)](https://travis-ci.org/richelbilderbeek/bbbq) | [![codecov.io](https://codecov.io/github/richelbilderbeek/bbbq/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/bbbq?branch=master)
`develop`|[![Build Status](https://travis-ci.org/richelbilderbeek/bbbq.svg?branch=develop)](https://travis-ci.org/richelbilderbeek/bbbq) | [![codecov.io](https://codecov.io/github/richelbilderbeek/bbbq/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/bbbq?branch=develop)

The Bilderbeek Bianchi and Bogaart Question.

It relies on:

 * [tmhprot](https://github.com/richelbilderbeek/tmhprot): from a proteome,
   creates a proteome of only the TMHs
 * [netmhc2pan](https://github.com/richelbilderbeek/netmhc2pan): install, 
   call and parse the output of 'NetMHC2pan'

## Data

[Data files](http://richelbilderbeek.nl/bbbq.zip):

 * 1. `UP000001584_83332.fasta`: TBC proteome, 
   from [here](ftp://ftp.ebi.ac.uk/pub/databases/reference_proteomes/QfO/Bacteria/UP000001584_83332.fasta.gz) ([overview of reference genomes](ftp://ftp.ebi.ac.uk/pub/databases/reference_proteomes/QfO/README))

```
wget ftp://ftp.ebi.ac.uk/pub/databases/reference_proteomes/QfO/Bacteria/UP000001584_83332.fasta.gz
gunzip UP000001584_83332.fasta.gz
```

 * 2. `tbc_netmhc2pan_bindings.csv`: TBC proteome's presented MHC2 epitopes,
   from NetMHC2pan

```
write.csv(
  x = run_netmhc2pan("~/UP000001584_83332.fasta"), 
  file = "~/tbc_netmhc2pan_bindings.csv"
)
```

 * 3. `tbc_tmhmm.html`: TBC proteome's TMHs, 
   from TMHSS

Done by [the TMHMM server](http://www.cbs.dtu.dk/services/TMHMM), then:

```
wget -O tbc_tmhmm.html http://www.cbs.dtu.dk//cgi-bin/webface2.fcgi?jobid=5C27132C0000126487F0E5A6
```

 * 4. `tbc_tmhmm.txt`: TBC proteome's TMHs, 
   from TMHSS

```
cat tbc_tmhmm.html | egrep "^[a-z]{2}\|" > tbc_tmhmm.txt
```

 * 5. Sequences of the TMHs in the TBC proteome

```
tmhprot::create_tmh_prot_file(
  proteome_filename = "/home/richel/UP000001584_83332.fasta",
  tmhs_filename = "/home/richel/tbc_tmhmm.txt",
  tmh_prot_filename = "/home/richel/tbc_tmh_prot.fasta"
)
```

 * 6. Count the number of AAs in the proteome:
 
```
richel@oldskool:~$ cat UP000001584_83332.fasta | egrep -v "^>" | wc --chars
1355826
```

 * 7. Count the number of AAs in the TMH part of the proteome:

```
richel@oldskool:~$ cat tmh_prot.fasta | egrep -v "^>" | wc --chars
78507
```

### Links

 * [epitope-prediction](https://github.com/jtextor/epitope-prediction)
 * [NetMHCIIpan](www.cbs.dtu.dk/services/NetMHCIIpan) website
