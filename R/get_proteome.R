#' Get a proteome as a tibble.
#'
#' Proteomes are downloaded and stored at the user's data folder.
#'
#' The option \code{keep_selenoproteins} only has an effect for the
#' human proteome, as it is the only proteome that contains
#' selenocysteines.
#' @inheritParams default_params_doc
#' @export
get_proteome <- function(
  target_name = "human",
  proteome_type = "full",
  keep_selenoproteins = TRUE,
  data_folder = rappdirs::user_data_dir(appname = "bbbq"),
  verbose = FALSE
) {
  bbbq::check_target_name(target_name)
  bbbq::check_proteome_type(proteome_type)
  if (proteome_type == "representative" && target_name != "human") {
    stop(
      "Only for target_name 'human' ",
        "the proteome_type can be 'representative' \n",
      "Actual target_name: ", target_name
    )
  }
  proteome_filename <- bbbq::get_proteome_filename(
    target_name = target_name,
    proteome_type = proteome_type,
    keep_selenoproteins = keep_selenoproteins
  )
  local_filename <- file.path(data_folder, proteome_filename)
  if (!file.exists(local_filename)) {
    dir.create(
      path = dirname(local_filename),
      showWarnings = FALSE,
      recursive = TRUE
    )
    url <- paste0("http://richelbilderbeek.nl/", proteome_filename)
    if (verbose) {
      message("Downloading proteome from URL: ", url)
    }
    utils::download.file(url = url, destfile = local_filename, quiet = TRUE)
  } else {
    if (verbose) {
      message("Proteome already downloaded at: ", local_filename)
    }
  }
  testthat::expect_true(file.exists(local_filename))
  pureseqtmr::load_fasta_file_as_tibble(local_filename)
}
