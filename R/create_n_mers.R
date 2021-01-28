#' Create the n-mers from a character string
#' @param string a character vector with one element
#' @param n the length of the n-mers
#' @return a character vector with all n-mers
#' @examples
#' # Creates ABCD, BCDE, CDEF
#' create_n_mers(string = "ABCDEF", n = 4)
#' @export
create_n_mers <- function(string, n) {
  if (length(string) != 1 || !is.character(string)) {
    stop(
      "'string' must be a character vector with one element \n",
      "length(string): ", length(string), " \n",
      "string: {", paste0(string, collapse = ", "), "} \n"
    )
  }
  if (length(n) != 1 || !is.numeric(n)) {
    stop(
      "'n' must be a numeric vector with one element \n",
      "length(n): ", length(n), " \n",
      "n: {", paste0(n, collapse = ", "), "} \n"
    )
  }

  if (n > nchar(string)) {
    stop(
      "'n' must be equal or less to the number of characters in the string. \n",
      "n: ", n, " \n",
      "nchar(string): ", nchar(string), " \n",
      "string: ", string, " \n"
    )
  }

  n_n_mers <- nchar(string) - n + 1
  n_mers <- rep(NA, n_n_mers)
  for (i in seq_len(n_n_mers)) {
    n_mers[i] <- substr(string, i, i + n - 1)
  }
  n_mers
}
