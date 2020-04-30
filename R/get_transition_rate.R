#' Get the AA transition rate from the FLU transition rate matrix
#' @param a amino acid to transition from
#' @param b amino acid to transition to
#' @export
get_transition_rate <- function(a, b) {
  m <- bbbq::get_aa_transition_matrix()
  as.numeric(stats::na.omit(c(m[a,b], m[b,a])))
}
