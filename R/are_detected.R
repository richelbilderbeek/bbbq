#' Are the protein sequences detected by either MHC-I or MHC-II?
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
are_detected <- function(
  protein_sequences,
  mhc_haplotype,
  peptide_length,
  percentile = get_ic50_percentile_binder(),
  ic50_prediction_tool
) {
  bbbq::check_mhc_haplotype_name(
    mhc_haplotype = mhc_haplotype,
    ic50_prediction_tool = ic50_prediction_tool
  )
  results <- rep(NA, length(protein_sequences))
  for (i in seq_along(protein_sequences)) {
    results[i] <- bbbq::is_detected(
      protein_sequence = protein_sequences[i],
      mhc_haplotype = mhc_haplotype,
      peptide_length = peptide_length,
      percentile = percentile,
      ic50_prediction_tool = ic50_prediction_tool
    )
  }
  results
}
