#' Predict the number of binders and the number of binders
#' that overlap with at least one amino acid with a TMH
#' for one peptide.
#' @inheritParams default_params_doc
#' @return a tibble with
#' \enumerate{
#'   \item n_binders number of epitopes that bind
#'   \item n_binders_tmh number of epitopes that bind and have one
#'     amino acid overlapping with a TMH
#' }
#' @author Richèl J.C. Bilderbeek
#' @examples
#' library(mhcnuggetsr)
#' library(pureseqtmr)
#'
#' if (is_mhcnuggets_installed() && is_pureseqtm_installed()) {
#'
#'   peptide <- "MYSFVSEETGTLIVNSVLLFLAFV"
#'
#'   predict_n_binders_tmh_peptide(
#'     peptide = peptide,
#'     haplotype = get_mhc1_haplotypes()[1],
#'     peptide_length = 9,
#'     percentile = 0.123
#'   )
#' }
#' @export
predict_n_binders_tmh_peptide <- function(
  peptide,
  haplotype,
  peptide_length,
  percentile,
  verbose = FALSE
) {
  bbbq::predict_counts(
    peptide = peptide,
    peptide_length = peptide_length,
    haplotype = haplotype,
    percentile = percentile,
    verbose = verbose
  )
}
