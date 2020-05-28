#' Determine if the AA sequence is a peptide
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
is_peptide <- function(protein_sequence) {
  if (!is.character(protein_sequence)) return(FALSE)
  if (length(protein_sequence) != 1) return(FALSE)
  if (nchar(protein_sequence) == 0) return(FALSE)

  all(strsplit(x = protein_sequence, split = "")[[1]]
    %in% bbbq::get_amino_acids()
  )
}
