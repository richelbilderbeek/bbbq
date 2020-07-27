#' Get the filename of the COVID-19 reference proteome
#' @return the filename of the COVID-19 reference proteome
#' @author Richèl J.C. Bilderbeek
#' @export
get_covid_proteome_filename <- function() {
  system.file("extdata", "UP000464024.fasta", package = "bbbq")
}
