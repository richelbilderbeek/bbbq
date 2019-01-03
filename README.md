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

## Install

The `bbbq` package depends on the `tmhmm` package, which needs
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

Additionall, The `bbbq` package depends on the `netmhc2pan` package, which needs
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

Another dependency is the `epitopiome` package.
Installing the `epitopeome` package:

```{r}
devtools::install_github("richelbilderbeek/epitopeome")
```

```{r}
devtools::install_github("richelbilderbeek/bbbq")
```

## Usage

From a protein sequence, `bbbq` estimates where amino acids of transmembrane proteins 
are located (inside, outside, in the membrane) and which bind to an MHC2
allele with a certain strength.

We need a FASTA file with at least one protein sequence in it to work on:

```{r}
fasta_filename <- system.file("extdata", "short.fasta", package = "bbbq")
```

This is how (the top of) such a FASTA file looks like:

```{r}
cat(head(readLines(fasta_filename, warn = FALSE)), sep = "\n")
```

```
>sp|A0A089QKZ7|Y155A_MYCTU Uncharacterized protein Rv1155A OS=Mycobacterium tuberculosis (strain ATCC 25618 / H37Rv) OX=83332 GN=Rv1155A PE=1 SV=1
MGESKSPQESSSEGETKRKFREALDRKMAQSSSGSDHKDGGGKQSRAHGPVASRREFRRK
SG
>sp|A0A089QRB9|MSL3_MYCTU Mycolipanoate synthase OS=Mycobacterium tuberculosis (strain ATCC 25618 / H37Rv) OX=83332 GN=msl3 PE=1 SV=2
MRTATATSVAVIGMACRLPGGIDSPQRLWEALLRGDDLVGEIPADRWDANVYYDPEPGVP
>sp|E2FZM4|SOCA_MYCTU Uncharacterized protein SocA OS=Mycobacterium tuberculosis (strain ATCC 25618 / H37Rv) OX=83332 GN=socA PE=2 SV=1
```

Different MHC2 alleles bind differently to protein epitopes. 
By default, `bbbq` uses only the default MHC2 allele used by NetMCHIIpan.
In this demo, we'll use the first two MHC2 alleles from the complete
NetMHCIIpan set of more than 5000 alleles:

```{r}
alleles <- netmhc2pan::get_netmhc2pan_alleles()[1:2]
testit::assert(all(alleles %in% netmhc2pan::get_netmhc2pan_alleles()))
```

Select a binding strength. For example, a value of `5.0` will select
those epitopes that are in the top 5 percent.

```{r}
binding_strength_threshold <- 5.0
```

Here, the BBBQ is answered:

```{r}
df <- bbbq::answer_bbbq(
  fasta_filename = fasta_filename,
  alleles = alleles,
  binding_strength_threshold = binding_strength_threshold
)
```

Resulting in:

```{r}
knitr::kable(df)
```

|epitopium |   n|
|:---------|---:|
|i         | 276|
|m         |  27|
|o         | 774|
|I         |  69|
|M         |  19|
|O         | 148|

Legend:

Location|Strong binder|Weak binder
---|---|---
outside|O|o
membrane|M|m
inside|I|i

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

### Links

 * [NetMHCIIpan](www.cbs.dtu.dk/services/NetMHCIIpan) website
 * [TMHMM](www.cbs.dtu.dk/services/TMHMM)
