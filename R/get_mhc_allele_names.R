#' Get the MHC allele names used in this study.
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
#' @return the MHC allele names as a character vector
#' @examples
#' get_mhc_allele_names()
#' @author Richèl J.C. Bilderbeek
#' @export
get_mhc_allele_names <- function() {
  c(
    bbbq::get_mhc1_allele_names(),
    bbbq::get_mhc2_allele_names()
  )
}

#' Deprecated function to het the MHC allele names used in this study.
#' Use \link{get_mhc_allele_names} instead
#' @return the MHC allele names as a character vector
#' @author Richèl J.C. Bilderbeek
#' @export
get_mhc_haplotypes <- function() {
  bbbq::get_mhc_allele_names()
}
