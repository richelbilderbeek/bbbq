% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predict_n_coincidence_tmh_peptide.R
\name{predict_n_coincidence_tmh_peptide}
\alias{predict_n_coincidence_tmh_peptide}
\title{Predict the number of n-mers and the number of n-mers
that overlap with at least one amino acid with a TMH
for one peptide.}
\usage{
predict_n_coincidence_tmh_peptide(
  protein_sequence,
  peptide_length,
  verbose = FALSE,
  ic50_prediction_tool
)
}
\arguments{
\item{protein_sequence}{a protein sequence}

\item{peptide_length}{length of the peptide in amino acids}

\item{verbose}{set to TRUE for more output}

\item{ic50_prediction_tool}{tool to predict the IC50 from a
  peptide. Possible values are:\cr
\itemize{
  \item mhcnuggetsr \link[mhcnuggetsr]{mhcnuggetsr},
    which uses MHCnuggets
  \item mhcnuggetsr \link[netmhc2pan]{netmhc2pan},
    which uses NetMHC2pam
  \item EpitopePrediction uses \code{EpitopePrediction}
}}
}
\value{
a tibble with
\enumerate{
  \item n_spots number of spots for the n-mer
  \item n_spots_tmh number of spots that have one
    amino acid overlapping with a TMH
}
}
\description{
Predict the number of n-mers and the number of n-mers
that overlap with at least one amino acid with a TMH
for one peptide.
}
\examples{
library(pureseqtmr)

if (is_pureseqtm_installed()) {

  protein_sequence <- paste0(
    "MYSFVSEETGTLIVNSVLLFLAFVVFLLV",
    "TLAILTALRLCAYCCNIVNVSLVKPSFYVYSRV"
  )

  predict_n_coincidence_tmh_peptide(
    protein_sequence = protein_sequence,
    peptide_length = 9,
    ic50_prediction_tool = "EpitopePrediction"
  )
}
}
\author{
Richèl J.C. Bilderbeek
}
