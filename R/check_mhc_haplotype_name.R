#' Check an MHC haplotype name
#' @inheritParams default_params_doc
#' @examples
#' library(bbbq)
#'
#' # EpitopePrediction can only do MHC-I
#' check_mhc_haplotype_name(
#'   mhc_haplotype = get_mhc1_haplotypes()[1],
#'   ic50_prediction_tool = "EpitopePrediction"
#' )
#'
#' if (netmhc2pan::is_netmhc2pan_installed()) {
#'   # NetMHCIIpan can only do MHC-II
#'   check_mhc_haplotype_name(
#'     mhc_haplotype = get_mhc2_haplotypes()[1],
#'     ic50_prediction_tool = "netmhc2pan"
#'   )
#' }
#'
#' if (mhcnuggetsr::is_mhcnuggets_installed()) {
#'
#'   #' # MHCnuggets can do both MHC-I and MHC-II
#'   check_mhc_haplotype_name(
#'     mhc_haplotype = get_mhc1_haplotypes()[1],
#'     ic50_prediction_tool = "mhcnuggetsr"
#'   )
#'   check_mhc_haplotype_name(
#'     mhc_haplotype = get_mhc2_haplotypes()[1],
#'     ic50_prediction_tool = "mhcnuggetsr"
#'   )
#' }
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
