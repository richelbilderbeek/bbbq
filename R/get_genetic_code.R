#' Get the genetic code
#' @examples
#' library(testthat)
#'
#' expect_true("triplet" %in% names(df))
#' expect_true("amino_acid" %in% names(df))
#' @export
get_genetic_code <- function() {

  # To re-create
  if (1 == 2) {
    library(Biostrings)
    m <- matrix(data = "", nrow = 64, ncol = 2)
    for (i in seq(1, 64)) {
      m[i,1] <- names(GENETIC_CODE)[i]
      m[i,2] <- as.character(GENETIC_CODE)[i]
    }
    df <- tibble::tibble(
      triplet = m[,1],
      amino_acid = m[,2]
    )
    write.csv(df, "~/gc.cvs", row.names = FALSE)
  }

  tibble::as_tibble(
    read.csv(
      system.file("extdata", "genetic_code.csv", package = "bbbq"),
      stringsAsFactors = FALSE
    )
  )
}
