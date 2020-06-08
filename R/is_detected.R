#' Determine if MHC-I or MHC-II has at least one binder to the peptide
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
is_detected <- function(
  protein_sequence,
  mhc_1_haplotype = "HLA-A-02-01"
) {
  bbbq::check_mhc_1_haplotype_name(mhc_1_haplotype)
  is_detected_by_mhc_1(
      protein_sequence = protein_sequence,
      mhc_1_haplotype = mhc_1_haplotype
    ) ||
    is_detected_by_mhc_2(protein_sequence)
}
