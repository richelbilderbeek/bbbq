#' Get the genetic code
#' @examples
#' library(testthat)
#'
#' df <- get_genetic_code()
#' expect_true("triplet" %in% names(df))
#' expect_true("amino_acid" %in% names(df))
#' @author Richèl J.C. Bilderbeek
#' @export
get_genetic_code <- function() {
  tibble::as_tibble(
    utils::read.csv(
      system.file("extdata", "genetic_code.csv", package = "bbbq"),
      stringsAsFactors = FALSE
    )
  )
}
