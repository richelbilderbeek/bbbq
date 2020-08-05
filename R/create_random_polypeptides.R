#' Create a random peptide
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @examples
#' create_random_peptides(
#'   n_peptides = 2,
#'   peptide_length = 9
#' )
#' @export
create_random_peptides <- function(
  n_peptides,
  peptide_length
) {
  replicate(
    n = n_peptides,
    mhcnpreds::create_random_peptide(length = peptide_length)
  )
}
