#' Get a proteome as a tibble.
#'
#' Proteomes are downloaded and stored at the user's data folder
#' @inheritParams default_params_doc
#' @export
get_proteome <- function(
  proteome_type = "full",
  keep_selenoproteins = TRUE,
  data_folder = rappdirs::user_data_dir(appname = "bbbq")
) {
  bbbq::check_proteome_type(proteome_type)
  proteome_filename <- bbbq::get_proteome_filename(
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
    utils::download.file(url = url, destfile = local_filename, quiet = TRUE)
  }
  testthat::expect_true(file.exists(local_filename))
  pureseqtmr::load_fasta_file_as_tibble(local_filename)
}
