#' Predict counts of one or more proteins and one haplotype
#'
#' Predict the number of binders and the number of binders
#' that overlap with at least one amino acid with a TMH
#' for one or more proteins.
#'
#' Use \link{predict_counts} to predict these
#' counts for one protein.
#' @inheritParams default_params_doc
#' @return a tibble with
#' \enumerate{
#'   \item n_binders number of epitopes that bind
#'   \item n_binders_tmh number of epitopes that bind and have one
#'     amino acid overlapping with a TMH
#'   \item n_spots number of spots for the n-mer
#'   \item n_spots_tmh number of spots that have one
#'     amino acid overlapping with a TMH
#' }
#' The number of will equal the number of proteins.
#' @author Richèl J.C. Bilderbeek
#' @examples
#' library(mhcnuggetsr)
#' library(pureseqtmr)
#'
#' if (is_pureseqtm_installed()) {
#'
#'   protein_sequences <- c(
#'     "SWINGTRANSMITWILLINGFASCINATEARISERISKGRATE",
#'     "FANTASTICALLYFAMILYVW"
#'   )
#'
#'   predict_counts_per_proteome(
#'     protein_sequences = protein_sequences,
#'     haplotype = get_mhc1_haplotypes()[1],
#'     peptide_length = 9,
#'     percentile = 0.123,
#'     ic50_prediction_tool = "EpitopePrediction"
#'   )
#' }
#' @export
predict_counts_per_proteome <- function(
  protein_sequences,
  haplotype,
  peptide_length,
  percentile,
  verbose = FALSE,
  ic50_prediction_tool
) {
  tibbles <- list()
  for (i in seq_along(protein_sequences)) {
    tibbles[[i]] <- bbbq::predict_counts(
      protein_sequence = protein_sequences[i],
      haplotype = haplotype,
      peptide_length = peptide_length,
      percentile = percentile,
      verbose = verbose,
      ic50_prediction_tool = ic50_prediction_tool
    )
  }
  dplyr::bind_rows(tibbles)
}
