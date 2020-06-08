#' Are the protein sequences detected by either MHC-I or MHC-II?
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
are_detected <- function(
  protein_sequences,
  mhc_1_haplotype = "HLA-A*02-01"
) {
  bbbq::check_mhc_1_haplotype_name(mhc_1_haplotype)
  results <- rep(NA, length(protein_sequences))
  for (i in seq_along(protein_sequences)) {
    results[i] <- bbbq::is_detected(
      protein_sequence = protein_sequences[i],
      mhc_1_haplotype = mhc_1_haplotype
    )
  }
  results
}
