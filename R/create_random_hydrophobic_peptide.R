#' Create a random hydrophobic peptide
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_random_hydrophobic_peptide <- function(peptide_length) { # nolint indeed a long function name
  aas <- Peptides::aaList()
  hs <- Peptides::hydrophobicity(aas)
  prob <- hs - min(hs)
  prob <- prob * prob
  paste0(
    sample(
      x = aas, size = peptide_length, replace = TRUE, prob = prob),
    collapse = ""
  )
}
