#' Get the MHC-II haplotypes used in this study
#' @export
get_mhc2_haplotypes <- function() {
  paste0(get_mhc1_haplotypes(), "22")
}
