#' Shred a protein
#' @inheritParams default_params_doc
#' @export
shred_protein <- function(
  protein_sequence,
  peptide_length
) {
  n <- nchar(protein_sequence) - peptide_length + 1
  peptides <- rep(NA, n)
  for (i in seq_len(n)) {
    peptides[i] <- substr(protein_sequence, i, i + peptide_length - 1)
  }
  peptides
}
