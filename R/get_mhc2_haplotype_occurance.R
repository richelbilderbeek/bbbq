#' Get the MHC-II haplotype occurance
#'
#' Get the MHC-II haplotype occurance in
#' both haplotype percentage and phenotype frequency.
#'
#' Data is from: Greenbaum, Jason, et al. "Functional classification of
#' class II human leukocyte antigen (HLA) molecules reveals seven different
#' supertypes and a surprising degree of repertoire sharing across
#' supertypes." Immunogenetics 63.6 (2011): 325-335.
#' @return a \link{data.frame}
#' @examples
#' library(testthat)
#'
#' df <- get_mhc2_haplotype_occurance()
#'
#' expect_true("haplotype" %in% names(df))
#' expect_true("haplotype_perc" %in% names(df))
#' expect_true("phenotype_freq" %in% names(df))
#' @author Richèl J.C. Bilderbeek
#' @export
get_mhc2_haplotype_occurance <- function() {
  # Raw text, copied from PDF
  m <- matrix(
    data = c(
      "HLA-DRB1*0101", "2.8", "5.4",
      "HLA-DRB1*0301", "7.1", "13.7",
      "HLA-DRB1*0401", "2.3", "4.6",
      "HLA-DRB1*0405", "3.1", "6.2",
      "HLA-DRB1*0701", "7", "13.5",
      "HLA-DRB1*0802", "2.5", "4.9",
      "HLA-DRB1*0901", "3.1", "6.2",
      "HLA-DRB1*1101", "6.1", "11.8",
      "HLA-DRB1*1201", "2", "3.9",
      "HLA-DRB1*1302", "3.9", "7.7",
      "HLA-DRB1*1501", "6.3", "12.2",
      "HLA-DRB3*0101", "14", "26.1",
      "HLA-DRB3*0202", "18.9", "34.3",
      "HLA-DRB4*0101", "23.7", "41.8",
      "HLA-DRB5*0101", "8.3", "16",
      "HLA-DQA1*0501/DQB1*0201", "5.8", "11.3",
      "HLA-DQA1*0501/DQB1*0301", "19.5", "35.1",
      "HLA-DQA1*0301/DQB1*0302", "10", "19",
      "HLA-DQA1*0401/DQB1*0402", "6.6", "12.8",
      "HLA-DQA1*0101/DQB1*0501", "7.6", "14.6",
      "HLA-DQA1*0102/DQB1*0602", "7.6", "14.6",
      "HLA-DPB1*0101", "8.4", "16",
      "HLA-DPB1*0201", "9.2", "17.5",
      "HLA-DPB1*0401", "20.1", "36.2",
      "HLA-DPB1*0402", "23.6", "41.6",
      "HLA-DPB1*0501", "11.5", "21.7",
      "HLA-DPB1*1401", "3.8", "7.4"
    ),
    ncol = 3,
    byrow = TRUE
  )
  tibble::tibble(
    haplotype = m[, 1],
    haplotype_perc = as.numeric(m[, 2]),
    phenotype_freq = as.numeric(m[, 3])
  )
}
