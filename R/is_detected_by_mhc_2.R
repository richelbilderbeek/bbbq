#' Determine if the  protein sequence has one MHC-II binder
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
is_detected_by_mhc_2 <- function(
  protein_sequence = "VVIIRTIAGRILVIMARSLE",
  mhc_2_haplotype = "HLA-DRB104:05",
  ic50_threshold = get_mhc2_ic50_threshold()
) {
  results <- mhcnuggetsr::predict_ic50(
    mhc_class = "II",
    peptides = protein_sequence,
    mhc = mhc_2_haplotype
  )
  results$ic50 < ic50_threshold
}

