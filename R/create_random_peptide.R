#' Create a random peptide
#' @param n_aas number of amino acids
#' @author Richèl J.C. Bilderbeek
#' @export
create_random_peptide <- function(n_aas)
{
  paste0(
    sample(x = Peptides::aaList(), size = n_aas, replace = TRUE),
    collapse = ""
  )
}

