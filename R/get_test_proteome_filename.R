#' Get the filename of a testing proteome
#'
#' This testing proteome consists out of on protein with one TMH.
#' The protein is the viral envelope protein of the COVID-19 reference proteome.
#' @return the filename of the COVID-19 reference proteome
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_proteome_filename <- function() {
  system.file("extdata", "test.fasta", package = "bbbq")
}
