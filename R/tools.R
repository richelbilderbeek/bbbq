#' Explodes a string into a character vector
#' @author Johannes Textor, Richel J.C. Bilderbeek
#' @export
explode <- function(s) {
  strsplit(s,"")[[1]]
}

#' Version of lapply that also passes along the
#' name of each list element. f must be a function
#' with arguments n and x.
#' @author Johannes Textor, Richel J.C. Bilderbeek
#' @export
nlapply <- function(l, f) {
  mapply(f, n = names(l), x = l)
}
