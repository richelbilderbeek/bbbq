% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculate-overlap-controls.R
\name{hydrophobe_overlap_controls}
\alias{hydrophobe_overlap_controls}
\title{Performs the same analysis as "calculate-overlap.R", but now for the
'control population' consisting of 9mers that do not overlap with
transmembrane helices.}
\usage{
hydrophobe_overlap_controls(
  hydrophobe_control_peptides_as_data_filename,
  protein_lengths_filename
)
}
\arguments{
\item{hydrophobe_control_peptides_as_data_filename}{filename that stores hydrophobe control peptides
as R data,
for example `work/hydrophobe-control-peptides.Rdata`}

\item{protein_lengths_filename}{filename to store the
length of all proteins in proteome,
for example `work/protein-lengths.txt`}
}
\description{
Inputs:
 * hydrophobe_control_peptides_as_data_filename
}
\author{
Richèl J.C. Bilderbeek, adapted from Johannes Textor
}
