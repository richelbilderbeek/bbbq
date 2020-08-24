#' Check the name of the IC50 prediction tool
#'
#' Check the name of the IC50 prediction tool.
#' Will \link{stop} if the name is invalid
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
check_ic50_prediction_tool <- function(
  ic50_prediction_tool
) {
  ic50_prediction_tools <- c("mhcnuggetsr", "EpitopePrediction", "netmhc2pan")
  if (!ic50_prediction_tool %in% ic50_prediction_tools) {
    stop(
      "Invalid 'ic50_prediction_tool'. ",
      "Value 'ic50_prediction_tool': '", ic50_prediction_tool, "'. ",
      "Valid values: '", paste(ic50_prediction_tools, collapse = ", "), "'"
    )
  }
}
