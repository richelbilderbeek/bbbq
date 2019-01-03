# bbbq

Branch|[![Travis CI logo](pics/TravisCI.png)](https://travis-ci.org)|[![Codecov logo](pics/Codecov.png)](https://www.codecov.io)
---|---|---
`master`|[![Build Status](https://travis-ci.org/richelbilderbeek/bbbq.svg?branch=master)](https://travis-ci.org/richelbilderbeek/bbbq) | [![codecov.io](https://codecov.io/github/richelbilderbeek/bbbq/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/bbbq?branch=master)
`develop`|[![Build Status](https://travis-ci.org/richelbilderbeek/bbbq.svg?branch=develop)](https://travis-ci.org/richelbilderbeek/bbbq) | [![codecov.io](https://codecov.io/github/richelbilderbeek/bbbq/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/bbbq?branch=develop)

The Bilderbeek Bianchi and Bogaart Question.

It relies on:

 * [tmhprot](https://github.com/richelbilderbeek/tmhprot): 
   from a proteome and a TMHMM file,
   creates a proteome with the sequences of only the TMHs
 * [netmhc2pan](https://github.com/richelbilderbeek/netmhc2pan): install, 
   call and parse the output of 'NetMHC2pan'
 * [epitopeome](https://github.com/richelbilderbeek/epitopeome): 
   from a TMHMM and NetMHC2pan file,
   create an 'epitopeome'

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

 * 8. Select the strong MHC2 binders

```{r}
df_all <- read.csv(file = "~/bbbq/tbc_netmhc2pan_bindings.csv")
# Strong binders
df <- df_all[df_all$Rank <= 5.0, ]
# All we need
df_sub <-df[, c("Pos", "Peptide", "ID", "Rank")]
utils::write.csv(
  x = df_sub,
  file = "~/bbbq/tbc_netmhc2pan_bindings_strong.csv",
  row.names = FALSE
)
``` 

 * 9. Create the epitopeome, `tbc_epitiopeome.fasta`

```c++
const std::string tmh_filename = "/home/richel/bbbq/tbc_tmhmm.txt";
assert(QFile::exists(tmh_filename.c_str()));
const std::string netmhc2pan_filename = "/home/richel/bbbq/tbc_netmhc2pan_bindings_strong.csv";
assert(QFile::exists(netmhc2pan_filename.c_str()));
const std::string result_filename = "/home/richel/tbc_epitiopeome.fasta";

create_epitopeome_file_cpp(
  tmh_filename,
  netmhc2pan_filename,
  result_filename
);
```

 * 10. Stats

```
richel@oldskool:~/bbbq$ cat tbc_epitiopeome.fasta | egrep -v "^>" | egrep -o "o" | wc --chars
1882706
richel@oldskool:~/bbbq$ cat tbc_epitiopeome.fasta | egrep -v "^>" | egrep -o "O" | wc --chars
453788
richel@oldskool:~/bbbq$ cat tbc_epitiopeome.fasta | egrep -v "^>" | egrep -o "i" | wc --chars
138308
richel@oldskool:~/bbbq$ cat tbc_epitiopeome.fasta | egrep -v "^>" | egrep -o "I" | wc --chars
38224
richel@oldskool:~/bbbq$ cat tbc_epitiopeome.fasta | egrep -v "^>" | egrep -o "t" | wc --chars
76648
richel@oldskool:~/bbbq$ cat tbc_epitiopeome.fasta | egrep -v "^>" | egrep -o "T" | wc --chars
73628
```

Location|AAs non-binder|AA binder|Total AAs|Percentage bound
--------|-------|------|-------|---
Inside  | 138308| 38224| 176532|21
Outside |1882706|453788|2336494|19
TMH     |  76648| 73628| 150276|48

### Links

 * [epitope-prediction](https://github.com/jtextor/epitope-prediction)
 * [NetMHCIIpan](www.cbs.dtu.dk/services/NetMHCIIpan) website







`epitopeome` depends on:

 * [netmhc2pan](https://github.com/richelbilderbeek/netmhc2pan): 
   obtain MHC2 epitopes for a proteome
 * [tmhmm](https://github.com/richelbilderbeek/tmhmm):
   obtain the topology of a transmembrane protein

## Install

The `epitopeome` package depends on the `tmhmm` package, which needs
to be installed first:

```{r}
devtools::install_github("richelbilderbeek/tmhmm")
```

The `tmhmm` package relies on TMHMM that needs to be installed:

```{r}
tmhmm::install_tmhmm("http://www.cbs.dtu.dk/download/D3198788-0F1D-11E9-883C-84B3B9CD16B5/")
```

The URL can be obtained by requesting a download link at 
the [TMHMM](http://www.cbs.dtu.dk/services/TMHMM) website 
at [http://www.cbs.dtu.dk/services/TMHMM](http://www.cbs.dtu.dk/services/TMHMM).
As this URL expires after four hours, `tmhmm` cannot do this for you.

The installation of NetMHC2pan is checked, with the goal of giving
a helpful error message:

```{r}
tmhmm::check_tmhmm_installation()
```

Additionall, The `epitopeome` package depends on the `netmhc2pan` package, which needs
to be installed as well:

```{r}
devtools::install_github("richelbilderbeek/netmhc2pan")
```

The `netmhc2pan` package relies on NetMHCIIpan that needs to be installed:

```{r}
netmhc2pan::install_netmhc2pan("http://www.cbs.dtu.dk/download/33A6B0AC-0F2E-11E9-B4D1-8ABCB9CD16B5/")
```

The URL can be obtained by requesting a download link at
the [NetMHCIIpan](www.cbs.dtu.dk/services/NetMHCIIpan) website 
at [www.cbs.dtu.dk/services/NetMHCIIpan]www.cbs.dtu.dk/services/NetMHCIIpan).
As this URL expires after four hours, `netmhc2pan` cannot do this for you.

The installation of NetMHC2pan is checked, with the goal of giving
a helpful error message:

```{r}
netmhc2pan::check_netmhc2pan_installation()
```

Installing the `epitopeome` package:

```{r}
devtools::install_github("richelbilderbeek/epitopeome")
```

## Usage

We need a FASTA file to work on:

```{r}
fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
```

The FASTA file should contain the protein sequences of one or more
genes. Reading the file ...

```{r}
cat(readLines(fasta_filename), sep = "\n")
```

results in:

```
>5H2A_CRIGR you can have comments after the ID
MEILCEDNTSLSSIPNSLMQVDGDSGLYRNDFNSRDANSSDASNWTIDGENRTNLSFEGYLPPTCLSILHL
QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLMSLAIADMLLGFLVMPVSMLTILYGYRWP
LPSKLCAVWIYLDVLFSTASIMHLCAISLDRYVAIQNPIHHSRFNSRTKAFLKIIAVWTISVGVSMPIPVF
GLQDDSKVFKQGSCLLADDNFVLIGSFVAFFIPLTIMVITYFLTIKSLQKEATLCVSDLSTRAKLASFSFL
PQSSLSSEKLFQRSIHREPGSYTGRRTMQSISNEQKACKVLGIVFFLFVVMWCPFFITNIMAVICKESCNE
HVIGALLNVFVWIGYLSSAVNPLVYTLFNKTYRSAFSRYIQCQYKENRKPLQLILVNTIPALAYKSSQLQA
GQNKDSKEDAEPTDNDCSMVTLGKQQSEETCTDNINTVNEKVSCV
```

## Dependencies

Package|Build status
---|---
`epitopeome`|[![Build Status](https://travis-ci.org/richelbilderbeek/epitopeome.svg?branch=master)](https://travis-ci.org/richelbilderbeek/epitopeome)
`netmhc2pan`|[![Build Status](https://travis-ci.org/richelbilderbeek/netmhc2pan.svg?branch=master)](https://travis-ci.org/richelbilderbeek/netmhc2pan)
`tmhmm`|[![Build Status](https://travis-ci.org/richelbilderbeek/tmhmm.svg?branch=master)](https://travis-ci.org/richelbilderbeek/tmhmm)

## FAQ

### Under which operating systems does `bbbq` work?

`bbbq` can only work on the set of operating systems 
that both TMHMM and NetMHCIIpan work on. 
Therefore, `bbbq` works under Linux only. 

Operating system|Supported by TMHMM|NetMHCIIpan|Supported by `bbbq`
---|---|---|---
AIX|Y|N|N
IRIX32|Y|N|N
IRIX64|Y|N|N
Darwin|N|Y|N
Linux|Y|Y|Y
MacOS|N|N|N
OSF1|Y|N|N
SunOS|Y|N|N
Windows|N|N|N
