#' Create a random hydrophobic polypeptide
#' @param n_aas number of amino acids
#' @export
create_random_hydrophobic_polypeptide <- function(n_aas)
{
  aas <- bbbq::get_amino_acids()
  hs <- Peptides::hydrophobicity(aas)
  prob <- hs - min(hs)
  prob <- prob * prob
  paste0(
    sample(
      x = aas, size = n_aas, replace = TRUE, prob = prob),
    collapse = ""
  )
}

