#' Determine if the  protein sequence has one MHC-II binder
#' @inheritParams default_params_doc
#' @export
is_detected_by_mhc_2 <- function(protein_sequence = "VVIIRTIAGRILVIMARSLE") {
  fasta_text <- c(">protein_name", protein_sequence)
  fasta_filename <- tempfile()
  writeLines(text = fasta_text, con = fasta_filename)
  results <- netmhc2pan::run_netmhc2pan(fasta_filename = fasta_filename)
  sum(results$Rank < 5.0) > 0
}

