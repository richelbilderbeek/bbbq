#' Create a random polypeptide likelier to have an
#' extreme hydrophobicity
#' @inheritParams default_params_doc
#' @export
create_random_extreme_polypeptide <- function(n_aas)
{
  aas <- bbbq::get_amino_acids()
  hs <- Peptides::hydrophobicity(aas)
  prob <- abs(hs ^ 5)
  paste0(
    sample(
      x = aas, size = n_aas, replace = TRUE, prob = prob),
    collapse = ""
  )
}

