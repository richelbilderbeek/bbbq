#' Determines the lengths of all proteins in the human proteome.
#' @author Richèl J.C. Bilderbeek, adapted from Johannes Textor
get_protein_lengths <- function() {
  x <- seqinr::read.fasta("proteome/UP000005640_9606.fasta.gz",
  				forceDNAtolower = FALSE, as.string = TRUE)

  for (i in seq_along(x)) {
  	xn <- strsplit(attr(x[[i]], 'name'), "\\|")[[1]][2]
  	cat(xn," ", nchar(x[[i]]), "\n" , sep = "")
  }
}
