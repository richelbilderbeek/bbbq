#' Get a lookup table for IC50 predictions of epitopes
#'
#' Get a lookup table for IC50 predictions of epitopes.
#' This lookup table is read from file.
#' If a needed file is absent, it will be downloaded.
#' For the human reference proteome, each table is approx 300 megabytes.
#'
#' The scripts that created these look-up tables are at
#' by \url{https://github.com/richelbilderbeek/bbbq_article_issue_167}
#' @inheritParams default_params_doc
#' @export
get_ic50s_lut <- function(
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
    "_ic50_", ic50_prediction_tool, ".csv"
  )
  local_filename <- file.path(
    rappdirs::user_data_dir(appname = "bbbq"),
    csv_filename
  )
  if (!file.exists(local_filename)) {
    bbbq::download_ic50s_lut(
      target_name = target_name,
      haplotype = haplotype,
      peptide_length = peptide_length,
      ic50_prediction_tool = ic50_prediction_tool,
      verbose = verbose
    )
  }
  testthat::expect_true(file.exists(local_filename))
  readr::read_csv(
    file = local_filename,
    col_types = readr::cols(
      peptide = readr::col_character(),
      ic50 = readr::col_double()
    ),
    progress = verbose
  )
}
