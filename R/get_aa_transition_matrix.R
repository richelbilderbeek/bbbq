#' Get an amino acid transition matrix
#'
#' From Dang, Cuong Cao, et al. "FLU, an amino acid substitution model for
#' influenza proteins." BMC evolutionary biology 10.1 (2010): 99.
#'
#' File downloaded from \code{ftp://ftp.sanger.ac.uk/pub/1000genomes/lsq/FLU/Flu_All_it2.txt_PAML.txt}
#' @author Richèl J.C. Bilderbeek
#' @export
get_aa_transition_matrix <- function() {
  # TODO: the AAs at rows and columns may be incorrect
  df <- data.frame(
    utils::read.csv(
      system.file("extdata", "flu_transitions.csv", package = "bbbq"),
      stringsAsFactors = FALSE
    )
  )
  rownames(df) <- df$X
  df$X <- NULL
  colnames(df) <- substr(x = colnames(df), start = 3, 3)
  df
}
