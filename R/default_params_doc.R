#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param fasta_filename name of a FASTA file
#' @param proteome_filename name of the file the proteome will be stored at
#' @param tmh_fasta_filename name of the FASTA file containing only the
#'   TMHs
#' @param tmhs_filename file that contains the TMHs as created by TMHMM
#' @param verbose set to TRUE for more output
#' @author Richel J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  fasta_filename,
  proteome_filename,
  tmh_fasta_filename,
  tmhs_filename,
  verbose
) {
  # Nothing
}
