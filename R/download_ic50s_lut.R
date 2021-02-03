#' Download a lookup table for IC50 predictions of epitopes
#'
#' Download a lookup table for IC50 predictions of epitopes.
#' For the human reference proteome, each table is approx 300 megabytes.
#'
#' The scripts that created these look-up tables are at
#' by \url{https://github.com/richelbilderbeek/bbbq_article_issue_167}
#' @inheritParams default_params_doc
#' @return the local filename
#' @export
download_ic50s_lut <- function(
  target_name,
  haplotype,
  peptide_length,
  ic50_prediction_tool,
  verbose = TRUE
) {
  bbbq::check_target_name(target_name)
  bbbq::check_ic50_prediction_tool(ic50_prediction_tool)
  bbbq::check_haplotype(
    haplotype = haplotype,
    ic50_prediction_tool = ic50_prediction_tool
  )
  csv_filename <- paste0(
    target_name, "_",
    peptide_length, "_",
    stringr::str_replace_all(haplotype, "[:|\\*]", "_"),
    "_ic50_ep.csv"
  )
  local_filename <- file.path(
    rappdirs::user_data_dir(appname = "bbbq"),
    csv_filename
  )
  url <- paste0("http://richelbilderbeek.nl/", csv_filename)
  if (verbose) {
    message("Starting big 300 Mb download.")
    message("csv_filename: ", csv_filename)
    message("local_filename: ", local_filename)
    message("URL: ", url)
  }
  dir.create(
    path = dirname(local_filename),
    showWarnings = verbose,
    recursive = TRUE
  )
  utils::download.file(
    url = url,
    destfile = local_filename,
    quiet = !verbose
  )
  local_filename
}
