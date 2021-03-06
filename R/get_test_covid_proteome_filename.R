#' Get the filename of a test SARS-CoV-2 reference proteome
#' @return the filename of the test SARS-CoV-2 reference proteome
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_covid_proteome_filename <- function() { # nolint indeed a long function name
  system.file("extdata", "covid_test.fasta", package = "bbbq")
}
