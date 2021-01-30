#' Get the table of Supplementary Material 1 from
#' Bergseng et al., 2015.
#' Will download the file if needed.
#' @param xlsx_filename the XLSX filename
#' @return a \link{tibble}[tibble], with columns named
#' \code{cell_line},
#' \code{infected},
#' \code{epitope_sequence},
#' \code{epitope_length},
#' \code{copy_number},
#' \code{source_protein},
#' \code{gene},
#' \code{best_allele},
#' \code{best_allele_rank},
#' \code{best_allele_predscore},
#' \code{normalized_copyno}
#' @export
get_bergseng_et_al_2015_sup_1 <- function(
  url = "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4297300/bin/251_2014_819_MOESM3_ESM.xlsx",
  xlsx_filename = file.path(
    rappdirs::user_data_dir(appname = "bbbq"),
    "251_2014_819_MOESM3_ESM.xlsx"
  ),
  verbose = FALSE
) {
  if (!file.exists(xlsx_filename)) {
    bbbq::download_bergseng_et_al_2015_sup_1(
      url = url,
      xlsx_filename = xlsx_filename,
      verbose = verbose
    )
  }
  testthat::expect_true(file.exists(xlsx_filename))
  readxl::read_excel(
    path = xlsx_filename,
    skip = 1
  )
}
