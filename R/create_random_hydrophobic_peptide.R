#' Create a random hydrophobic peptide
#' @param n_aas number of amino acids
#' @author Richèl J.C. Bilderbeek
#' @export
create_random_hydrophobic_peptide <- function(n_aas) { # nolint indeed a long function name
  aas <- Peptides::aaList()
  hs <- Peptides::hydrophobicity(aas)
  prob <- hs - min(hs)
  prob <- prob * prob
  paste0(
    sample(
      x = aas, size = n_aas, replace = TRUE, prob = prob),
    collapse = ""
  )
}
