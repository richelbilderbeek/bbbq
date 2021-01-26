#' Get the name of a topology file
#' @inheritParams default_params_doc
#' @export
get_topology_filename <- function(
  target_name = "human",
  proteome_type = "full",
  keep_selenoproteins = TRUE,
  topology_prediction_tool
) {
  bbbq::check_proteome_type(proteome_type)
  bbbq::check_topology_prediction_tool(topology_prediction_tool)

  replacement <- NA
  if (topology_prediction_tool == "pureseqtmr") replacement <- "pureseqtm"
  if (topology_prediction_tool == "tmhmm") replacement <- "tmhmm"
  testthat::expect_true(!is.na(replacement))

  proteome_filename <- get_proteome_filename(
    target_name = target_name,
    proteome_type = proteome_type,
    keep_selenoproteins = keep_selenoproteins
  )
  stringr::str_replace(
    string = proteome_filename,
    pattern = "fasta$",
    replacement = replacement
  )
}
