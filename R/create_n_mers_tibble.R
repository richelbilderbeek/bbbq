#' Create the n-mers from one or more character strings
#' @param strings a character vector with one or more elements
#' @param n the length of the n-mers
#' @return a \link[tibble]{tibble} with two columns:
#'  * \code{string} the string, as a factor
#'  * \code{n_mers} the n-mers per each string
#' @seealso use \link{create_n_mers} to create
#' the n-mers for one string (as a character vector)
#' @examples
#' create_n_mers_tibble(strings = c("AB", "CDE"), n = 2)
#' @export
create_n_mers_tibble <- function(strings, n) {
  if (length(strings) == 0 || !is.character(strings)) {
    stop(
      "'string' must be a character vector with at least one element \n",
      "length(strings): ", length(strings), " \n"
    )
  }
  if (length(n) != 1 || !is.numeric(n)) {
    stop(
      "'n' must be a numeric vector with one element \n",
      "length(n): ", length(n), " \n",
      "n: {", paste0(n, collapse = ", "), "} \n"
    )
  }

  if (any(n > nchar(strings))) {
    stop(
      "For all strings, 'n' must be equal or less ",
      "to the number of characters in the string. \n",
      "n: ", n, " \n",
      "nchar(strings): ", nchar(strings), " \n",
      "strings: ", strings, " \n"
    )
  }

  tibbles <- list()
  for (i in seq_along(strings)) {
    tibbles[[i]] <- tibble::tibble(
      string = strings[i],
      n_mer = bbbq::create_n_mers(strings[i], n)
    )
  }
  dplyr::bind_rows(tibbles)
}
