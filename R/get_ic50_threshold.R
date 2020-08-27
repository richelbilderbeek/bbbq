#' Get the threshold IC50 value
#'
#' Get the threshold IC50 value for a certain percentile.
#' For examples, IC50s below this value may be defined as a binder
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
get_ic50_threshold <- function(
  peptide_length,
  haplotype,
  percentile,
  ic50_prediction_tool
) {
  bbbq::check_haplotype(
    haplotype = haplotype,
    ic50_prediction_tool = ic50_prediction_tool
  )

  ic50_threshold <- NA
  if (ic50_prediction_tool == "mhcnuggetsr") {
    ic50_threshold <- mhcnpreds::get_ic50_threshold(
      peptide_length = peptide_length,
      mhc_haplotype = mhcnuggetsr::to_mhcnuggets_name(haplotype),
      percentile = percentile
    )
  } else if (ic50_prediction_tool == "netmhc2pan") {
    ic50_threshold <- nmhc2ppreds::get_ic50_threshold(
      peptide_length = peptide_length,
      mhc_haplotype = netmhc2pan::to_netmhc2pan_name(haplotype),
      percentile = percentile
    )
  } else if (ic50_prediction_tool == "EpitopePrediction") {
    ic50_threshold <- epiprepreds::get_ic50_threshold(
      peptide_length = peptide_length,
      haplotype_name = haplotype,
      percentile = percentile
    )
  } else {
    stop("Unknown 'ic50_prediction_tool': ", ic50_prediction_tool)
  }
  ic50_threshold
}
