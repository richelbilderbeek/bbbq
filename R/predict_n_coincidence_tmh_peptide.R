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
#'   protein_sequence <- paste0(
#'     "MYSFVSEETGTLIVNSVLLFLAFVVFLLV",
#'     "TLAILTALRLCAYCCNIVNVSLVKPSFYVYSRV"
#'   )
#'
#'   predict_n_coincidence_tmh_peptide(
#'     protein_sequence = protein_sequence,
#'     peptide_length = 9,
#'     ic50_prediction_tool = "EpitopePrediction"
#'   )
#' }
#' @export
predict_n_coincidence_tmh_peptide <- function(# nolint indeed a long function name
  protein_sequence,
  peptide_length,
  verbose = FALSE,
  ic50_prediction_tool
) {
  bbbq::predict_counts(
    protein_sequence = protein_sequence,
    peptide_length = peptide_length,
    haplotype = get_mhc1_haplotypes()[1],
    percentile = 0.0,
    verbose = verbose,
    ic50_prediction_tool = ic50_prediction_tool
  )
}
