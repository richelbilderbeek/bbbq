#' Determine if the haplotype has at least one binder to the peptide
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
is_detected <- function(
  protein_sequence,
  mhc_haplotype,
  peptide_length,
  percentile = get_ic50_percentile_binder(),
  ic50_prediction_tool
) {
  bbbq::check_mhc_haplotype_name(mhc_haplotype)


  ic50_threshold <- bbbq::get_ic50_threshold(
    peptide_length = peptide_length,
    haplotype = mhc_haplotype,
    percentile = percentile,
    ic50_prediction_tool = ic50_prediction_tool
  )

  results <- bbbq::predict_ic50s(
    protein_sequence = protein_sequence,
    peptide_length = peptide_length,
    haplotype = mhc_haplotype,
    ic50_prediction_tool = ic50_prediction_tool
  )
  sum(results$ic50 < ic50_threshold) > 0
}
