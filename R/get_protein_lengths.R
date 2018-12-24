#' Get an overview of all proteins and their lengths in number of
#' amino acids.
#' @inheritParams default_params_doc
#' @return a data frame with each protein's name and the number'
#'   of amino acids it consists of
#' @author Richel J.C. Bilderbeek
#' @export
get_protein_lengths <- function(
  fasta_filename = system.file("extdata", "short.fasta", package = "bbbq")
) {
  x <- get_proteome(fasta_filename)
  n_proteins <- length(x)
  data.frame(name = names(x), n_aa = as.vector(nchar(x)))
}
