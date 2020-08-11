#' Create a protein lookup table from a proteome
#' @return a tibble with columns:\cr
#' \itemize{
#'   \item protein_id the protein ID,
#'     for example \code{p1}
#'   \item protein the protein name,
#'     for example \code{sp|P0DTD8|NS7B}
#'   \item sequence the protein sequence,
#'     for example \code{MIELSLIDFYLCFL}
#' }
#' @export
create_proteins_lut <- function(proteome_filename) {

  testthat::expect_true(file.exists(proteome_filename))

  proteome <- seqinr::read.fasta(
    proteome_filename,
    seqtype = "AA",
    as.string = TRUE
  )

  t <- tibble::tibble(
    protein = names(proteome),
    sequence = as.character(proteome),
    protein_id = NA
  )
  t$protein_id <- paste0("p", seq(1, nrow(t)))

  dplyr::relocate(t, protein_id)
}
