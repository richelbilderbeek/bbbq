#' Check an MHC haplotype name
#' @inheritParams default_params_doc
#' @export
check_mhc_haplotype_name <- function(
  mhc_haplotype,
  ic50_prediction_tool
) {
  bbbq::check_haplotype(
    haplotype = mhc_haplotype,
    ic50_prediction_tool = ic50_prediction_tool
  )
}
