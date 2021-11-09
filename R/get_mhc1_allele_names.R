#' Get the MHC-I allele names used in this study.
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
#' @return the MHC-I allele names as a character vector
#' @examples
#' get_mhc1_allele_names()
#' @author Richèl J.C. Bilderbeek
#' @export
get_mhc1_allele_names <- function() {
  c(
    "HLA-A*01:01",
    "HLA-A*02:01",
    "HLA-A*03:01",
    "HLA-A*24:02",
    "HLA-A*26:01",
    "HLA-B*07:02",
    "HLA-B*08:01",
    "HLA-B*18:01",
    "HLA-B*27:05",
    "HLA-B*39:01",
    "HLA-B*40:02",
    "HLA-B*58:01",
    "HLA-B*15:01"
  )
}

#' Deprecated function to the MHC-I allele names used in this study.
#' Use \link{get_mhc1_allele_names} instead.
#' @author Richèl J.C. Bilderbeek
#' @export
get_mhc1_haplotypes <- function() {
  bbbq::get_mhc1_allele_names()
}
