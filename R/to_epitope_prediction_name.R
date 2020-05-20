#' Convert an academic HMC-I haplotype name to one to be used by
#' the EpitopePrediction package
#' @inheritParams default_params_doc
#' @export
to_epitope_prediction_name <- function(mhc_1_haplotype) {
  stringr::str_replace(
    string = mhc_1_haplotype,
    pattern = "(-)(..)$",
    replacement = ":\\2"
  )
}
