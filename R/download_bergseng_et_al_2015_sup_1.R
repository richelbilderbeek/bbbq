#' Downloads the XLSX file by Bergseng et al., 2015
#' @param url the download URL.
#' @param xlsx_filename the XLSX filename
#' @param verbose set to TRUE for more output
#' @return the XLSX filename of the downloaded file
#' @seealso use \link{get_bergseng_et_al_2015_sup_1} to
#'   read the table as a \link{tibble}[tibble]
#' @export
download_bergseng_et_al_2015_sup_1 <- function(
  url = "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4297300/bin/251_2014_819_MOESM3_ESM.xlsx",
  xlsx_filename = file.path(
    rappdirs::user_data_dir(appname = "bbbq"),
    "251_2014_819_MOESM3_ESM.xlsx"
  ),
  verbose = FALSE
) {
  dir.create(
    path = dirname(xlsx_filename),
    showWarnings = verbose,
    recursive = TRUE
  )
  utils::download.file(
    url = url,
    destfile = xlsx_filename,
    quiet = !verbose
  )
  xlsx_filename
}
