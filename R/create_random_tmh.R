#' Create a random TMH sequences
#' @param n_aas number of amino acids
#' @param create_random_peptide_fun function to create a random
#'   peptide fragment of the desired length
#' @author Richèl J.C. Bilderbeek
#' @export
create_random_tmh <- function(
  n_aas,
  create_random_peptide_fun = bbbq::create_random_hydrophobic_peptide
) {
  seq <- create_random_peptide_fun(n_aas)
  while (!pureseqtmr::is_tmh(seq)) {
    stop("X")
    seq <- create_random_peptide_fun(n_aas)
  }
  seq
}
