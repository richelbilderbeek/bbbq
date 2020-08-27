#' Check the haplotype
#'
#' Check if the haplotype can be converted to a valid
#'
#' Will \link{stop} if the name is invalid
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
check_haplotype <- function(
  haplotype,
  ic50_prediction_tool
) {
  bbbq::check_ic50_prediction_tool(ic50_prediction_tool)
  bbbq::check_ic50_prediction_tool_installation(ic50_prediction_tool)

  if (ic50_prediction_tool == "mhcnuggetsr") {
    mhcnuggets_name <- mhcnuggetsr::to_mhcnuggets_name(haplotype)
    if (!mhcnuggetsr::is_mhcnuggets_name(mhcnuggets_name)) {
      stop(
        "Invalid haplotype name: '", haplotype, "'. ",
        "mhcnuggetsr::to_mhcnuggets_name: '", mhcnuggets_name, "'"
      )
    }
  } else if (ic50_prediction_tool == "netmhc2pan") {
    netmhc2pan_haplotype <- netmhc2pan::to_netmhc2pan_name(haplotype)
    if (!netmhc2pan_haplotype %in% netmhc2pan::get_netmhc2pan_alleles()) {
      stop(
        "Invalid haplotype name: '", haplotype, "'. ",
        "netmhc2pan::to_netmhc2pan_name: '", netmhc2pan_haplotype, "'"
      )
    }
  } else if (ic50_prediction_tool == "EpitopePrediction") {
    epiprepreds::check_haplotype_name(haplotype)
  } else {
    stop("Unknown 'ic50_prediction_tool': ", ic50_prediction_tool)
  }

}
