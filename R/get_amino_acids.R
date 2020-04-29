#' Get the twenty standard amino acids, in their one uppercase letter form.
#' @examples
#' library(testthat)
#'
#' # There are 20 standard amino acids
#' expect_equal(20, length(get_amino_acids()))
#'
#' # First one is alanine
#' expect_equal("A", get_amino_acids()[1])
#' @export
get_amino_acids <- function(
) {
  c("A", "C", "D", "E", "F", "G", "H", "I", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "Y")
}

