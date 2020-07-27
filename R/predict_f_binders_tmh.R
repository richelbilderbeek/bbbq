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
predict_f_binders_tmh <- function(
  target_name,
  haplotypes,
  n_aas,
  percentile
) {
  testthat::expect_true(
    target_name %in% c("test", "human", "covid", "myco")
  )
  t <- predict_n_binders_tmh(
    target_name = target_name,
    haplotypes = haplotypes,
    n_aas = n_aas,
    percentile = percentile
  )
  t
  t$f <- t$n_binders_tmh / t$n_binders
  t
}

