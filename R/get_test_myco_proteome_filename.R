#' Get the filename of a test Mycobacterium reference proteome
#' @return the filename of the test Mycobacterium reference proteome
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_myco_proteome_filename <- function() {
  system.file("extdata", "myco_test.fasta", package = "bbbq")
}
