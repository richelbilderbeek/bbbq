#' Are the protein sequences detected by either MHC-I or MHC-II?
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
are_detected <- function(
  protein_sequences,
  mhc_haplotype = "HLA-A*02-01",
  percentile = get_ic50_percentile_binder()
) {
  bbbq::check_mhc_haplotype_name(mhc_haplotype)
  results <- rep(NA, length(protein_sequences))
  for (i in seq_along(protein_sequences)) {
    results[i] <- bbbq::is_detected(
      protein_sequence = protein_sequences[i],
      mhc_haplotype = mhc_haplotype,
      percentile = percentile
    )
  }
  results
}
