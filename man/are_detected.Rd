% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/are_detected.R
\name{are_detected}
\alias{are_detected}
\title{Are the protein sequences detected by either MHC-I or MHC-II?}
\usage{
are_detected(
  protein_sequences,
  mhc_haplotype,
  peptide_length,
  percentile = get_ic50_percentile_binder(),
  ic50_prediction_tool
)
}
\arguments{
\item{protein_sequences}{one or more protein sequences}

\item{mhc_haplotype}{haplotype of either HMC-I or MHC-II.
Use \link{get_mhc1_haplotypes} to get a list of all MHC-I haplotypes.
Use \link{get_mhc2_haplotypes} to get a list of all MHC-II haplotypes.}

\item{peptide_length}{length of the peptide in amino acids}

\item{percentile}{how low the IC50 must be for the protein to
be considered a binder. For example, 0.02 denotes that the protein
must have an IC50 in the lowest 2 percent range.
The default value is returned by \link{get_ic50_percentile_binder}.}

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
\description{
Are the protein sequences detected by either MHC-I or MHC-II?
}
\author{
Richèl J.C. Bilderbeek
}
