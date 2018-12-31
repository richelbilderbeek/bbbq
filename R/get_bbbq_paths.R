#' Get the full paths of files in the 'inst/extdata' folder
#' @param filenames the files' names, without the path
#' @return the filenames' full paths, if and only if
#'   all files are present. Will stop otherwise.
#' @author Richel J.C. Bilderbeek
#' @seealso for one file, use \code{\link{get_bbbq_path}}
#' @examples
#'   testit::assert(
#'     length(
#'       get_bbbq_paths(
#'         c("UP000001584_83332.fasta", "tmhmm_result.txt")
#'       )
#'      ) == 2
#'    )
#' @export
get_bbbq_paths <- function(filenames) {

  for (i in seq_along(filenames)) {
    filenames[i] <- get_bbbq_path(filenames[i]) # nolint internal function
  }

  filenames
}
