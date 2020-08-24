#' Check the installation of the IC50 prediction tool
#'
#' Check the installation of the IC50 prediction tool.
#' Will \link{stop} if the tool is not installed.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
check_ic50_prediction_tool_installation <- function(
  ic50_prediction_tool
) {
  bbbq::check_ic50_prediction_tool(ic50_prediction_tool)

  # Check installations
  if (ic50_prediction_tool == "mhcnuggetsr") {
    mhcnuggetsr::check_mhcnuggets_installation()
  } else if (ic50_prediction_tool == "netmhc2pan") {
    netmhc2pan::check_netmhc2pan_installation()
  } else if (ic50_prediction_tool == "EpitopePrediction") {
    # No need to check installation of this R package
  } else {
    stop("Unknown 'ic50_prediction_tool': ", ic50_prediction_tool)
  }
}
