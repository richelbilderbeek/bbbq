#' Get the filename of a test Homo Sapiens reference proteome
#' @return the filename of the test Homo Sapiens reference proteome
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_human_proteome_filename <- function() {
  system.file("extdata", "human_test.fasta", package = "bbbq")
}
