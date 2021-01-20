#' Get a topology as a tibble.
#'
#' Topologyies are downloaded and stored at the user's data folder
#' @inheritParams default_params_doc
#' @export
get_topology <- function(
  proteome_type,
  keep_selenoproteins,
  topology_prediction_tool,
  data_folder = rappdirs::user_data_dir(appname = "bbbq")
) {
  bbbq::check_proteome_type(proteome_type)
  bbbq::check_topology_prediction_tool(topology_prediction_tool)
  if (topology_prediction_tool == "tmhmm" && keep_selenoproteins == TRUE) {
    stop("TMHMM cannot predict selenoproteins")
  }

  topology_filename <- bbbq::get_topology_filename(
    proteome_type = proteome_type,
    keep_selenoproteins = keep_selenoproteins,
    topology_prediction_tool = topology_prediction_tool
  )
  local_filename <- file.path(data_folder, topology_filename)
  if (!file.exists(local_filename)) {
    dir.create(
      path = dirname(local_filename),
      showWarnings = FALSE,
      recursive = TRUE
    )
    url <- paste0("http://richelbilderbeek.nl/", topology_filename)
    download.file(url = url, destfile = local_filename, quiet = FALSE)
  }
  testthat::expect_true(file.exists(local_filename))
  pureseqtmr::load_fasta_file_as_tibble(local_filename)
}
