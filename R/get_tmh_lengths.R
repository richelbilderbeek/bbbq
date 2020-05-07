#' Get the lengths of the TMHs
#' @param epitopeome an epitopeome
#' @return a numeric vector of TMH lengths. As a protein can contain
#'   zero or multiple TMHs, this lengths is probably different than
#'   the number of proteins
#' @author Richèl J.C. Bilderbeek
#' @export
get_tmh_lengths <- function(epitopeome)
{
  even_indices <- 1 + seq(1, length(epitopeome), by = 2)
  tmhs <- stringr::str_match_all(string = epitopeome[even_indices], pattern = "[Mm]+")
  stringr::str_length(unlist(tmhs))
}
