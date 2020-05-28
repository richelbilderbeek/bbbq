#' Creates a random peptide of a certain hydrophobicity
#' @inheritParams default_params_doc
#' @param n_attempts number of attempts before the algorithm will \link{stop}
#' @examples
#' library(testthat)
#'
#' peptide <- create_random_peptide_with_hydrophobicity(
#'   n_aas = 2,
#'   min_hydrophobicity = 1.0,
#'   max_hydrophobicity = 1.5
#' )
#' expect_true(Peptides::hydrophobicity(peptide) >= 1.0)
#' expect_true(Peptides::hydrophobicity(peptide) <= 1.5)
#' @author Richèl J.C. Bilderbeek
#' @export
create_random_peptide_with_hydrophobicity <- function(
  n_aas,
  min_hydrophobicity,
  max_hydrophobicity,
  n_attempts = 1000
) {
  aas <- bbbq::get_amino_acids()
  hs <- Peptides::hydrophobicity(aas)
  # Probabilities decrease the more distant from the desired hydrophobicity
  mid <- (min_hydrophobicity + max_hydrophobicity) / 2.0
  prob <- exp(-abs(hs - mid))

  for (i in seq_len(n_attempts)) {
    candidate <- paste0(
      sample(
        x = aas, size = n_aas, replace = TRUE, prob = prob),
      collapse = ""
    )
    h <- Peptides::hydrophobicity(candidate)
    if (h >= min_hydrophobicity && h <= max_hydrophobicity) {
      return(candidate)
    }
  }
  stop("Too many attempts to generate peptide")
}
