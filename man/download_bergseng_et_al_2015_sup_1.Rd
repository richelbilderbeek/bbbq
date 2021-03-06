% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/download_bergseng_et_al_2015_sup_1.R
\name{download_bergseng_et_al_2015_sup_1}
\alias{download_bergseng_et_al_2015_sup_1}
\title{Downloads the XLSX file by Bergseng et al., 2015}
\usage{
download_bergseng_et_al_2015_sup_1(
  url = bbbq::get_bergseng_et_al_2015_sup_1_url(),
  xlsx_filename = file.path(rappdirs::user_data_dir(appname = "bbbq"),
    "251_2014_819_MOESM3_ESM.xlsx"),
  verbose = FALSE
)
}
\arguments{
\item{url}{the download URL.}

\item{xlsx_filename}{the XLSX filename}

\item{verbose}{set to TRUE for more output}
}
\value{
the XLSX filename of the downloaded file
}
\description{
Downloads the XLSX file by Bergseng et al., 2015
}
\seealso{
use \link{get_bergseng_et_al_2015_sup_1} to
  read the table as a \link{tibble}[tibble]
}
