#' Explodes a string into a character vector
#' @param s one string
#' @author Johannes Textor, Richèl J.C. Bilderbeek
#' @examples
#' # c("A", "B", "C")
#' explode("ABC")
#' @export
explode <- function(s) {
  strsplit(s, "")[[1]]
}

#' Version of lapply that also passes along the
#' name of each list element. f must be a function
#' with arguments n and x.
#' @param l list
#' @param f function
#' @author Johannes Textor, Richèl J.C. Bilderbeek
#' @export
nlapply <- function(l, f) {
  mapply(f, n = names(l), x = l)
}
