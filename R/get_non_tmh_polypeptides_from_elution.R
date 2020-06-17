#' Get the TMH peptides from elution study
#' @author Richèl J.C. Bilderbeek
#' @export
get_non_tmh_peptides_from_elution <- function() { # nolint indeed a long function name
  readLines(
    system.file("extdata", "non-TMH-Bcell-elution.txt", package = "bbbq")
  )
}
