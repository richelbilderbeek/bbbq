% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predict_counts_per_proteome.R
\name{predict_counts_per_proteome}
\alias{predict_counts_per_proteome}
\title{Predict counts of one or more proteins and one haplotype}
\usage{
predict_counts_per_proteome(
  protein_sequences,
  haplotype,
  peptide_length,
  percentile,
  verbose = FALSE,
  ic50_prediction_tool
)
}
\arguments{
\item{protein_sequences}{one or more protein sequences}

\item{haplotype}{one MHC-I or MHC-II haplotype}

\item{peptide_length}{length of the peptide in amino acids}

\item{percentile}{how low the IC50 must be for the protein to
be considered a binder. For example, 0.02 denotes that the protein
must have an IC50 in the lowest 2 percent range.
The default value is returned by \link{get_ic50_percentile_binder}.}

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
  \item n_binders number of epitopes that bind
  \item n_binders_tmh number of epitopes that bind and have one
    amino acid overlapping with a TMH
  \item n_spots number of spots for the n-mer
  \item n_spots_tmh number of spots that have one
    amino acid overlapping with a TMH
}
The number of will equal the number of proteins.
}
\description{
Predict the number of binders and the number of binders
that overlap with at least one amino acid with a TMH
for one or more proteins.
}
\details{
Use \link{predict_counts} to predict these
counts for one protein.
}
\examples{
library(mhcnuggetsr)
library(pureseqtmr)

if (is_pureseqtm_installed()) {

  protein_sequences <- c(
    "SWINGTRANSMITWILLINGFASCINATEARISERISKGRATE",
    "FANTASTICALLYFAMILYVW"
  )

  predict_counts_per_proteome(
    protein_sequences = protein_sequences,
    haplotype = get_mhc1_haplotypes()[1],
    peptide_length = 9,
    percentile = 0.123,
    ic50_prediction_tool = "EpitopePrediction"
  )
}
}
\author{
Richèl J.C. Bilderbeek
}
