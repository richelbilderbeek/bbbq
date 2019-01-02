#' Answer the BBBQ
#' @inheritParams default_params_doc
answer_bbbq <- function(
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
