# bbbq

Branch   |[![GitHub Actions logo](man/figures/GitHubActions.png)](https://github.com/richelbilderbeek/bbbq/actions)| [![Codecov logo](pics/Codecov.png)](https://www.codecov.io)
---------|---------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------
`master` |![R-CMD-check](https://github.com/richelbilderbeek/bbbq/workflows/R-CMD-check/badge.svg?branch=master)   |[![codecov.io](https://codecov.io/github/richelbilderbeek/bbbq/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/bbbq?branch=master)
`develop`|![R-CMD-check](https://github.com/richelbilderbeek/bbbq/workflows/R-CMD-check/badge.svg?branch=develop)  |[![codecov.io](https://codecov.io/github/richelbilderbeek/bbbq/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/bbbq?branch=develop)

Part of the code of [Bilderbeek, Richèl JC, et al. "Transmembrane Helices Are an Over-Presented and Evolutionarily Conserved Source of Major Histocompatibility Complex Class I and II Epitopes." Frontiers in immunology 12 (2021)](https://github.com/richelbilderbeek/bbbq_article).

## [Install](install.Rmd)

See [install.Rmd](install.Rmd).

## Dependencies

Package             |Build status
--------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------
`pureseqtmr`        |[![Build Status](https://travis-ci.com/richelbilderbeek/pureseqtmr.svg?branch=master)](https://travis-ci.com/richelbilderbeek/pureseqtmr)
`epitope-prediction`|[![Build Status](https://travis-ci.com/jtextor/epitope-prediction.svg?branch=master)](https://travis-ci.com/jtextor/epitope-prediction)
`epiprepreds`       |[![Build Status](https://travis-ci.com/richelbilderbeek/epiprepreds.svg?branch=master)](https://travis-ci.com/richelbilderbeek/epiprepreds)
`mhcnuggetsr`       |[![Build Status](https://travis-ci.com/richelbilderbeek/mhcnuggetsr.svg?branch=master)](https://travis-ci.com/richelbilderbeek/mhcnuggetsr)
`mhcnpreds`         |[![Build Status](https://travis-ci.com/richelbilderbeek/mhcnpreds.svg?branch=master)](https://travis-ci.com/richelbilderbeek/mhcnpreds)
`netmhc2pan`        |[![Build Status](https://travis-ci.com/richelbilderbeek/netmhc2pan.svg?branch=master)](https://travis-ci.com/richelbilderbeek/netmhc2pan)
`nmhc2ppreds`       |[![Build Status](https://travis-ci.com/richelbilderbeek/nmhc2ppreds.svg?branch=master)](https://travis-ci.com/richelbilderbeek/nmhc2ppreds)
`prodigalr`         |[![Build Status](https://travis-ci.com/richelbilderbeek/prodigalr.svg?branch=master)](https://travis-ci.com/richelbilderbeek/prodigalr)

## Downloads

Human proteome: 
 * ID: `UP000005640`
 * Download via web browser: [https://www.uniprot.org/uniprot/?query=proteome:UP000005640&format=fasta](https://www.uniprot.org/uniprot/?query=proteome:UP000005640&format=fasta)
 * Direct download URL: [http://richelbilderbeek.nl/UP000005640.fasta](http://richelbilderbeek.nl/UP000005640.fasta)

Human proteome without selenocysteines: 
 * Direct download URL: [http://richelbilderbeek.nl/UP000005640_no_u.fasta](http://richelbilderbeek.nl/UP000005640_no_u.fasta)

Topology of human proteome: 

 * TMHMM topology (from human proteome without selenocysteines): [http://richelbilderbeek.nl/UP000005640_no_u.tmhmm](http://richelbilderbeek.nl/UP000005640_no_u.tmhmm)

 * PureseqTM topology: [https://www.richelbilderbeek.nl/UP000005640.pureseqtm](https://www.richelbilderbeek.nl/UP000005640.pureseqtm) [1]

## References

 * [1] Changed the predicted topology of `TRDD1_HUMAN` from `[nothing]` to `00` (i.e. cytosolic)
