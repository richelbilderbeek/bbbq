#' Answer the BBBQ
#' @inheritParams default_params_doc
#' @return a data frame with counts of the epitopa
#' @author Richel J.C. Bilderbeek
#' @examples
#'   library(testthat)
#'
#'   fasta_filename <- system.file("extdata", "short.fasta", package = "bbbq")
#'   df <- answer_bbbq_1(fasta_filename)
#'
#'   expect_true("epitopium" %in% names(df))
#'   expect_true("n" %in% names(df))
#'   expect_equal(df$epitopium, c("i", "m", "o", "I", "M", "O"))
#'   expect_equal(df$n, c(295, 31, 830, 50, 15, 92))
#' @export
answer_bbbq_1 <- function(
  fasta_filename,
  alleles = "DRB1_0101",
  binding_strength_threshold = 5.0,
  tmhmm_filename = tempfile(".txt"),
  netmhc2pan_filename = tempfile(".csv"),
  epitopeome_filename = tempfile(".fasta")
) {
  testit::assert(file.exists(fasta_filename))
  epitopeome::create_epitopeome(
    fasta_filename = fasta_filename,
    alleles = alleles,
    binding_strength_threshold = binding_strength_threshold,
    tmhmm_filename = tmhmm_filename,
    netmhc2pan_filename = netmhc2pan_filename,
    epitopeome_filename = epitopeome_filename
  )
  epitopeome <- readLines(epitopeome_filename)
  even_indices <- seq_along(epitopeome)
  even_indices <- even_indices[even_indices %% 2 == 0]
  amino_acids <- epitopeome[even_indices]

  df <- data.frame(
    epitopium = c("i", "m", "o", "I", "M", "O"),
    n = NA,
    stringsAsFactors = FALSE
  )
  for (i in seq(1, nrow(df))) {
    df$n[i] <- sum(stringr::str_count(amino_acids, df$epitopium[i]))
  }
  df
}
