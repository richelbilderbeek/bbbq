#' Create a random peptide likelier to have an
#' extreme hydrophobicity
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_random_extreme_peptide <- function(peptide_length) {
  aas <- Peptides::aaList()
  hs <- Peptides::hydrophobicity(aas)
  prob <- abs(hs ^ 5)
  paste0(
    sample(
      x = aas, size = peptide_length, replace = TRUE, prob = prob),
    collapse = ""
  )
}
