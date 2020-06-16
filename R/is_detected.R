#' Determine if the haplotype has at least one binder to the peptide
#' @inheritParams default_params_doc
#' @param percentile how low the IC50 must be for the protein to
#'   be considered a binder. For example, 0.02 denotes that the protein
#'   must have an IC50 in the lowest 2 percent range
#' @param fragment_length the length of the peptide fragments
#'   the peptide will be cut into
#' @author Richèl J.C. Bilderbeek
#' @export
is_detected <- function(
  protein_sequence,
  mhc_haplotype,
  fragment_length = 9,
  percentile = 0.02
) {
  bbbq::check_mhc_haplotype_name(mhc_haplotype)


  ic50_threshold <- mhcnpreds::get_ic50_threshold(
    n_aas = fragment_length,
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
