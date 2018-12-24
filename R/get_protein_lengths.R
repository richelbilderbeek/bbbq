#' Get an overview of all proteins and their lengths in number of
#' amino acids.
#' @return a data frame with each protein's name and the number'
#'   of amino acids it consists of
#' @author Richel J.C. Bilderbeek
#' @export
get_protein_lengths <- function(
  fasta_filename = system.file("extdata", "short.fasta", package = "bbbq")
) {
  suppressWarnings(
    x <- seqinr::read.fasta(fasta_filename,
    	forceDNAtolower = FALSE,
      as.string = TRUE
    )
  )
  x <- lapply( x, function(x) x[1] )
  names(x) <- sapply( strsplit( names(x), "\\|" ), function(x) x[2] )
  n_proteins <- length(x)
  data.frame(name = names(x), n_aa = as.vector(nchar(x)))
}
