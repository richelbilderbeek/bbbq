#' Get the TMH polypeptides from elution study
#' @export
get_non_tmh_polypeptides_from_elution <- function() {
  readLines(
    system.file("extdata", "non-TMH-Bcell-elution.txt", package = "bbbq")
  )
}
