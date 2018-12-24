#' Get the proteome as a list
#' @inheritParams default_params_doc
#' @export
#' @author Johannes Textor, adapted by Richel J.C. Bilderbeek
get_proteome <- function(
  fasta_filename = system.file("extdata", "short.fasta", package = "bbbq")
) {
  # Also creates a few other files that are helpful for the analysis.
  suppressWarnings(
    x <- seqinr::read.fasta(fasta_filename,
    	forceDNAtolower = FALSE, as.string = TRUE
    )
  )
  x <- lapply( x, function(x) x[1] )
  names( x ) <- sapply( strsplit( names(x), "\\|" ), function(x) x[2] )
  x
}
