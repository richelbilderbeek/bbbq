#' Create a random peptide
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_random_peptides <- function(n_peptides, n_aas) {
  replicate(
    n = n_peptides,
    create_random_peptide(n_aas = n_aas)
  )
}
