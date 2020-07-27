#' Calculate the fractions of MHC epitopes that overlap with a TMH
#' for multiple MHC haplotypes for one type of agent.
#'
#' For one peptide, use \link{predict_n_binders_tmh_peptide}
#' @inheritParams default_params_doc
#' @return a tibble with columns:
#' \enumerate{
#'   \item n_binders number of epitopes that bind
#'   \item n_binders_tmh number of epitopes that bind and have one
#'     amino acid overlapping with a TMH
#' }
#' and one row per peptide
#' @author Richèl J.C. Bilderbeek
#' @export
predict_n_binders_tmh_peptides <- function(
  peptides,
  target_name,
  haplotype,
  n_aas,
  verbose = FALSE
) {
  testthat::expect_true(
    target_name %in% c("test", "human", "covid", "myco")
  )
  testthat::expect_true(target_name == "test")

  tibbles <- list()
  for (i in seq_along(peptides)) {
    tibbles[[i]] <- bbbq::predict_n_binders_tmh_peptide(
      peptide = peptides[i],
      target_name = target_name,
      haplotype = haplotype,
      n_aas = n_aas,
      verbose = verbose
    )
  }
  dplyr::bind_rows(tibbles)
}

