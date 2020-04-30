#' Create a random TMH sequences
#' @param n_aas number of amino acids
#' @param create_random_polypeptide_fun function to create a random
#'   peptide fragment of the desired length
#' @export
create_random_tmh <- function(
  n_aas,
  create_random_polypeptide_fun = bbbq::create_random_hydrophobic_polypeptide
) {
  seq <- create_random_polypeptide_fun(n_aas)
  while (!tmhmm::is_tmh(seq)) {
    seq <- create_random_polypeptide_fun(n_aas)
  }
  seq
}
