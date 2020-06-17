#' Get an amino acid transition matrix
#'
#' From Dang, Cuong Cao, et al. "FLU, an amino acid substitution model for
#' influenza proteins." BMC evolutionary biology 10.1 (2010): 99.
#'
#' File downloaded from \code{
#'   ftp://ftp.sanger.ac.uk/pub/1000genomes/lsq/FLU/Flu_All_it2.txt_PAML.txt
#' }
#'
#' As can be seen in \url{
#'   https://github.com/stephaneguindon/phyml/blob/master/src/io.c#L3188
#' }, the column names are \code{Ala Arg Asn Asp Cys Gln Glu Gly His Ile Leu
#' Lys Met Phe Pro Ser Thr Trp Tyr Val}
#' @return a tibble, with column names equal to the uppercase
#'   amino acid name
#' @author Richèl J.C. Bilderbeek
#' @export
get_aa_transition_matrix <- function() {
  t <- as.matrix(
    readr::read_csv(
      system.file("extdata", "flu_transitions.csv", package = "bbbq"),
      col_types = readr::cols(.default = readr::col_double())
    )
  )
  rownames(t) <- colnames(t)
  t
}
