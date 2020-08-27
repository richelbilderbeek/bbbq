#' If if the protein sequences are long enough
#'
#' If if the protein sequences are longer than the
#' desired epitope peptide length: to estimate epitope binding
#' strength using, for example, 13-mers, the protein sequences
#' must have a least 13 amino acids
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
check_protein_sequences_length <- function(
  protein_sequences,
  peptide_length
) {
  first_too_short_index <- utils::head(
    which(stringr::str_length(protein_sequences) < peptide_length),
    n = 1
  )
  if (length(first_too_short_index)) {
    stop(
      "Protein sequence shorter than epitope peptide length .\n",
      "'peptide_length': ", peptide_length, " \n",
      "sequence index: ", first_too_short_index, " \n",
      "sequence length: ",
        stringr::str_length(protein_sequences[first_too_short_index]),
        " \n",
      "sequence: ", protein_sequences[first_too_short_index]
    )
  }
}
