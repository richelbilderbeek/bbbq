#' Create a random TMH sequences
#' @inheritParams default_params_doc
#' @param create_random_peptide_fun function to create a random
#'   peptide fragment of the desired length
#' @author Richèl J.C. Bilderbeek
#' @export
create_random_tmh <- function(
  peptide_length,
  create_random_peptide_fun = bbbq::create_random_hydrophobic_peptide
) {
  seq <- create_random_peptide_fun(peptide_length)
  while (!pureseqtmr::is_tmh(seq)) {
    seq <- create_random_peptide_fun(peptide_length)
  }
  seq
}
