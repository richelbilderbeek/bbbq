#' Get the full path of a file in the \code{inst/extdata} folder
#' @param filename the file's name, without the path
#' @return the full path of the filename, if and only if
#'   the file is present. Will stop otherwise.
#' @author Richel J.C. Bilderbeek
#' @seealso for more files, use \code{\link{get_bbbq_paths}}
#' @examples
#'   testit::assert(is.character(get_bbbq_path("UP000001584_83332.fasta")))
#'   testit::assert(is.character(get_bbbq_path("tmhmm_result.txt")))
#' @export
get_bbbq_path <- function(filename) {

  full <- system.file("extdata", filename, package = "bbbq")
  if (!file.exists(full)) {
    stop("'filename' must be the name of a file in 'inst/extdata'")
  }
  full
}

#' Get the path to the proteome
#' @return path to the proteome file in \code{inst/extdata}
#' @author Richel J.C. Bilderbeek
get_proteome_path <- function() {
  get_bbbq_path("UP000001584_83332.fasta") # nolint bbbq function
}
