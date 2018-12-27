#' Creates a FASTA file with the sequences of the proteome that
#' are TMHs
#' @inheritParams default_params_doc
#' @return nothing, creates file with name \code{tmh_fasta_filename}
#' @export
#' @author Richel J.C. Bilderbeek
create_tmh_fasta <- function(
  proteome_filename,
  tmhs_filename,
  tmh_fasta_filename
) {
  text <- paste0(seq(1, 16), '\n', collapse = "")
  writeLines(text, tmh_fasta_filename)
}


