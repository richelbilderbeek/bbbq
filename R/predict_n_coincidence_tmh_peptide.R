#' Predict the number of n-mers and the number of n-mers
#' that overlap with at least one amino acid with a TMH
#' for one peptide.
#' @inheritParams default_params_doc
#' @return a tibble with
#' \enumerate{
#'   \item n_spots number of spots for the n-mer
#'   \item n_spots_tmh number of spots that have one
#'     amino acid overlapping with a TMH
#' }
#' @author Richèl J.C. Bilderbeek
#' @examples
#' library(pureseqtmr)
#'
#' if (is_pureseqtm_installed()) {
#'
#'   peptide <- "MYSFVSEETGTLIVNSVLLFLAFVVFLLVTLAILTALRLCAYCCNIVNVSLVKPSFYVYSRV"
#'
#'   predict_n_coincidence_tmh_peptide(
#'     peptide = peptide,
#'     peptide_length = 9
#'   )
#' }
#' @export
predict_n_coincidence_tmh_peptide <- function(# nolint indeed a long function name
  peptide,
  peptide_length,
  verbose = FALSE
) {
  bbbq::predict_counts(
    peptide = peptide,
    peptide_length = peptide_length,
    haplotype = get_mhc1_haplotypes()[1],
    percentile = 0.0,
    verbose = verbose
  )
}
