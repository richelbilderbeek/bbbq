#' Check the name of the topology prediction tool
#'
#' Check the name of the topology prediction tool.
#' Will \link{stop} if the name is invalid
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
check_topology_prediction_tool <- function(
  topology_prediction_tool
) {
  topology_prediction_tools <- c("pureseqtmr", "tmhmm")
  if (!topology_prediction_tool %in% topology_prediction_tools) {
    stop(
      "Invalid 'topology_prediction_tool'. ",
      "Value 'topology_prediction_tool': '", topology_prediction_tool, "'. ",
      "Valid values: '", paste(topology_prediction_tools, collapse = ", "), "'"
    )
  }
}
