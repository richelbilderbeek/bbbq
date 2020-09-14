#' Creata a multiple-sequence alignment
#' @inheritParams default_params_doc
#' @return a \code{MsaAAMultipleAlignment}
#' @export
create_msa <- function(protein_sequences) {
  protein_sequences_aass <- Biostrings::AAStringSet(protein_sequences)
  sink("/dev/null")
  protein_alignment <- msa::msa(
    protein_sequences_aass,
    method = "ClustalOmega",
    substitutionMatrix = "BLOSUM80"
  )
  sink()
  protein_alignment
}
