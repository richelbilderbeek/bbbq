#' Check if the name is valid
#' @inheritParams default_params_doc
#' @export
check_ep_haplotype_name <- function(
  mhc_1_haplotype
) {
  df <- NA
  sink("/dev/null")
  df <- EpitopePrediction::supportedMHCs()
  sink()
  if (!bbbq::to_epitope_prediction_name(mhc_1_haplotype) %in%
      df$mhc
  ) {
    stop(
      "'mhc_1_haplotype' not supported. \n",
      "Value: ", mhc_1_haplotype, " \n"
    )
  }
}
