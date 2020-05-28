#' Create a random peptide
#' @param n_aas number of amino acids
#' @author Richèl J.C. Bilderbeek
#' @export
create_random_peptide <- function(n_aas)
{
  paste0(
    sample(x = bbbq::get_amino_acids(), size = n_aas, replace = TRUE),
    collapse = ""
  )
}

