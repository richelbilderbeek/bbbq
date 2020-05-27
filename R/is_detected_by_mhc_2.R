#' Determine if the  protein sequence has one MHC-II binder
#' @inheritParams default_params_doc
#' @export
is_detected_by_mhc_2 <- function(
  protein_sequence = "VVIIRTIAGRILVIMARSLE",
  mhc_2_haplotype = "HLA-DRB104:05",
  ic50_threshold = 500
) {
  fasta_text <- c(protein_sequence)
  fasta_filename <- tempfile()
  writeLines(text = fasta_text, con = fasta_filename)
  results <- mhcnuggetsr::epitope_predict(
    mhc_class = "II",
    peptides_path = fasta_filename,
    mhc = mhc_2_haplotype
  )
  results$ic50 < ic50_threshold
}

