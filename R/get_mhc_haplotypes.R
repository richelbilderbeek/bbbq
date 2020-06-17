#' Get the MHC haplotypes used in this study.
#' Use the official format, as specified by
#' \url{https://en.wikipedia.org/wiki/History_and_naming_of_human_leukocyte_antigens#Current_HLA_naming_system}, # nolint indeed a long URL
#' which is \enumerate{
#'   \item \code{HLA} prefix
#'   \item Hyphen
#'   \item Gene
#'   \item Asterisk as separator
#'   \item Allele group
#'   \item Colon field separator
#'   \item Specific HLA protein
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_mhc_haplotypes <- function() {
  c(
    bbbq::get_mhc1_haplotypes(),
    bbbq::get_mhc2_haplotypes()
  )
}

