#' Get a topology as a tibble.
#'
#' Topologyies are downloaded and stored at the user's data folder
#' @inheritParams default_params_doc
#' @export
get_topology <- function(
  target_name = "human",
  proteome_type = "full",
  keep_selenoproteins = TRUE,
  topology_prediction_tool,
  data_folder = rappdirs::user_data_dir(appname = "bbbq"),
  verbose = FALSE
) {
  bbbq::check_target_name(target_name)
  bbbq::check_proteome_type(proteome_type)
  bbbq::check_topology_prediction_tool(topology_prediction_tool)
  if (topology_prediction_tool == "tmhmm" && keep_selenoproteins == TRUE) {
    stop("TMHMM cannot predict selenoproteins")
  }
  if (topology_prediction_tool == "pureseqtmr" && keep_selenoproteins == TRUE) {
    stop("PureseqTM cannot predict selenoproteins")
  }

  topology_filename <- bbbq::get_topology_filename(
    target_name = target_name,
    proteome_type = proteome_type,
    keep_selenoproteins = keep_selenoproteins,
    topology_prediction_tool = topology_prediction_tool
  )
  local_filename <- file.path(data_folder, topology_filename)
  if (!file.exists(local_filename)) {
    url <- paste0("http://richelbilderbeek.nl/", topology_filename)
    if (verbose) {
      message(
        "Topology not yet downloaded to ", local_filename, " \n",
        "Downloading topology from URL: ", url
      )
    }
    dir.create(
      path = dirname(local_filename),
      showWarnings = FALSE,
      recursive = TRUE
    )
    utils::download.file(url = url, destfile = local_filename, quiet = TRUE)
  } else {
    if (verbose) {
      message("Topology already downloaded at: ", local_filename)
    }
  }
  testthat::expect_true(file.exists(local_filename))
  pureseqtmr::load_fasta_file_as_tibble(local_filename)
}
