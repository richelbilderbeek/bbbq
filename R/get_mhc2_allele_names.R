#' Get the MHC-II allele names used in this study
#' @examples
#' get_mhc2_allele_names()
#' @author Richèl J.C. Bilderbeek
#' @export
get_mhc2_allele_names <- function() {
  if (1 == 2) {
    phenotype_freq <- NULL; rm(phenotype_freq) # nolint, fixes warning: no visible binding for global variable
    haplotype <- NULL; rm(haplotype) # nolint, fixes warning: no visible binding for global variable
    t <- get_mhc2_haplotype_occurance() %>%
      dplyr::filter(phenotype_freq > 14.0) %>%
      dplyr::select(haplotype)
    return(t$haplotype)
  }
  c(
    "HLA-DRB1*01:01",
    "HLA-DRB1*03:01",
    "HLA-DRB1*04:01",
    "HLA-DRB1*04:05",
    "HLA-DRB1*07:01",
    "HLA-DRB1*08:02",
    "HLA-DRB1*09:01",
    "HLA-DRB1*11:01",
    "HLA-DRB1*12:01",
    "HLA-DRB1*13:02",
    "HLA-DRB1*15:01",
    "HLA-DRB3*01:01",
    "HLA-DRB3*02:02",
    "HLA-DRB4*01:01",
    "HLA-DRB5*01:01",
    "HLA-DQA1*05:01/DQB1*02:01",
    "HLA-DQA1*05:01/DQB1*03:01",
    "HLA-DQA1*03:01/DQB1*03:02",
    "HLA-DQA1*04:01/DQB1*04:02",
    "HLA-DQA1*01:01/DQB1*05:01",
    "HLA-DQA1*01:02/DQB1*06:02"
  )
}

#' Deprecated function to get the MHC-II allele names used in this study.
#'
#' Deprecated function to get the MHC-II allele names used in this study.
#' Use \link{get_mhc2_allele_names} instead.
#' @examples
#' get_mhc2_allele_names()
#' @author Richèl J.C. Bilderbeek
#' @export
get_mhc2_haplotypes <- function() {
  bbbq::get_mhc2_allele_names()
}
