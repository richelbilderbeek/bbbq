#' Get the MHC-II haplotypes used in this study
#' @examples
#' library(testthat)
#'
#' mhc2_haplotypes <- get_mhc2_haplotypes()
#' expect_true("HLA-DRB3*0101" %in% mhc2_haplotypes)
#' expect_true("HLA-DQA1*0501/DQB1*0301" %in% mhc2_haplotypes)
#' @author Richèl J.C. Bilderbeek
#' @export
get_mhc2_haplotypes <- function() {
  if (1 == 2) {
    phenotype_freq <- NULL; rm(phenotype_freq) # nolint, fixes warning: no visible binding for global variable
    haplotype <- NULL; rm(haplotype) # nolint, fixes warning: no visible binding for global variable
    t <- get_mhc2_haplotype_occurance() %>%
      dplyr::filter(phenotype_freq > 14.0) %>%
      dplyr::select(haplotype)
    return(t$haplotype)
  }
  c(
    "HLA-DRB1*0101",
    "HLA-DRB1*0301",
    "HLA-DRB1*0401",
    "HLA-DRB1*0405",
    "HLA-DRB1*0701",
    "HLA-DRB1*0802",
    "HLA-DRB1*0901",
    "HLA-DRB1*1101",
    "HLA-DRB1*1201",
    "HLA-DRB1*1302",
    "HLA-DRB1*1501",
    "HLA-DRB3*0101",
    "HLA-DRB3*0202",
    "HLA-DRB4*0101",
    "HLA-DRB5*0101",
    "HLA-DQA1*0501/DQB1*0201",
    "HLA-DQA1*0501/DQB1*0301",
    "HLA-DQA1*0301/DQB1*0302",
    "HLA-DQA1*0401/DQB1*0402",
    "HLA-DQA1*0101/DQB1*0501",
    "HLA-DQA1*0102/DQB1*0602"
  )
}
