#' Convert the current HMC-I haplotype name to one to be used by
#' the EpitopePrediction package
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' haplotype <- get_mhc1_haplotypes()[1]
#' expect_equal("HLA-A*01:01", haplotype)
#' expect_equal("HLA-A-01:01", to_epitope_prediction_name(haplotype))
#' @author Richèl J.C. Bilderbeek
#' @export
to_epitope_prediction_name <- function(mhc_1_haplotype) {
  stringr::str_replace(
    string = mhc_1_haplotype,
    pattern = "\\*",
    replacement = "-"
  )
}
