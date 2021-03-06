% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_ic50_prediction_tool_installation.R
\name{check_ic50_prediction_tool_installation}
\alias{check_ic50_prediction_tool_installation}
\title{Check the installation of the IC50 prediction tool}
\usage{
check_ic50_prediction_tool_installation(ic50_prediction_tool)
}
\arguments{
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
Check the installation of the IC50 prediction tool.
Will \link{stop} if the tool is not installed.
}
\author{
Richèl J.C. Bilderbeek
}
