#' Creata a multiple-sequence alignment
#' @inheritParams default_params_doc
#' @return a \code{MsaAAMultipleAlignment}
#' @export
create_msa <- function(
  protein_sequences,
  msa_method,
  msa_subst_matrix
) {
  stop("No msa please")
  # protein_sequences_aass <- Biostrings::AAStringSet(protein_sequences)
  # sink("/dev/null")
  # protein_alignment <- msa::msa(
  #   protein_sequences_aass,
  #   method = msa_method,
  #   substitutionMatrix = msa_subst_matrix
  # )
  # sink()
  # protein_alignment
}
