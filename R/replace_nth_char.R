#' Replace the nth char of a string
#' @param s the string
#' @param n the index of the character
#' @param c the character to be placed at that index
#' @author Richèl J.C. Bilderbeek
#' @export
replace_nth_char <- function(s, n, c) {
  letter <- c
  # 1: The first n-1 chars,
  # 2: The character to be replaces
  # 3: The rest
  lhs <- paste0('^([A-Z]{', n - 1, '})(.)([A-Z]+)?$')
  rhs <- paste0('\\1', letter, '\\3')
  gsub(lhs, rhs, s)
}
