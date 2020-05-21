#' Determine if MHC-I or MHC-II has at least one binder to the polypeptide
#' @inheritParams default_params_doc
#' @export
is_detected <- function(
  protein_sequence,
  mhc_1_haplotype = "HLA-A-02-01"
) {
  is_detected_by_mhc_1(
      protein_sequence = protein_sequence,
      mhc_1_haplotype = mhc_1_haplotype
    ) ||
    is_detected_by_mhc_2(protein_sequence)
}
