#' Determine if the haplotype has at least one binder to the peptide
#' @inheritParams default_params_doc
#' @param fragment_length the length of the peptide fragments
#'   the peptide will be cut into
#' @author Richèl J.C. Bilderbeek
#' @export
is_detected <- function(
  protein_sequence,
  mhc_haplotype,
  fragment_length = 9,
  percentile = get_ic50_percentile_binder()
) {
  bbbq::check_mhc_haplotype_name(mhc_haplotype)


  ic50_threshold <- mhcnpreds::get_ic50_threshold(
    peptide_length = fragment_length,
    mhc_haplotype = mhcnuggetsr::to_mhcnuggets_name(mhc_haplotype),
    percentile = percentile
  )

  results <- mhcnuggetsr::predict_ic50s(
    mhcnuggets_options = mhcnuggetsr::create_mhcnuggets_options(
      mhc = mhcnuggetsr::to_mhcnuggets_name(mhc_haplotype)
    ),
    peptide = protein_sequence,
    n_aas = fragment_length
  )
  sum(results$ic50 < ic50_threshold) > 0
}
