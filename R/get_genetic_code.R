#' Get the genetic code
#' @examples
#' get_genetic_code()
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
