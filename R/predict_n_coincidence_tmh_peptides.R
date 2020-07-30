#' Predict the number of n-mers and the number of n-mers
#' that overlap with at least one amino acid with a TMH
#' for one peptide.
#'
#' For one peptide, use \link{predict_n_coincidence_tmh_peptide}
#' @inheritParams default_params_doc
#' @return a tibble with
#' \enumerate{
#'   \item n_spots number of spots for the n-mer
#'   \item n_spots_tmh number of spots that have one
#'     amino acid overlapping with a TMH
#' }
#' and one row per peptide
#' @author Richèl J.C. Bilderbeek
#' @export
predict_n_coincidence_tmh_peptides <- function(# nolint indeed a long function name
  peptides,
  n_aas,
  verbose = FALSE
) {
  tibbles <- list()
  for (i in seq_along(peptides)) {
    tibbles[[i]] <- bbbq::predict_n_coincidence_tmh_peptide(
      peptide = peptides[i],
      n_aas = n_aas,
      verbose = verbose
    )
  }
  dplyr::bind_rows(tibbles)
}
