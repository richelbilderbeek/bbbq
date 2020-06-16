#' Determine if MHC-I or MHC-II has at least one binder to the peptide
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
is_detected <- function(
  protein_sequence,
  mhc_haplotype = "HLA-A-02-01"
) {
  bbbq::check_mhc_haplotype_name(mhc_haplotype)

  ic50_threshold <- mhcnpreds::get_ic50_threshold(
    n_aas = 9,
    mhc_haplotype = mhcnuggetsr::to_mhcnuggets_name(mhc_haplotype),
    percentile = 0.02
  )

  results <- mhcnuggetsr::predict_ic50(
    mhcnuggets_options = mhcnuggetsr::create_mhcnuggets_options(
      mhc = mhcnuggetsr::to_mhcnuggets_name(mhc_haplotype)
    ),
    peptides = protein_sequence,
  )
  results$ic50 < ic50_threshold
}
