#' Get the lengths of the TMHs
#' @inheritParams default_params_doc
#' @return a numeric vector of TMH lengths. As a protein can contain
#'   zero or multiple TMHs, this lengths is probably different than
#'   the number of proteins
#' @author Richèl J.C. Bilderbeek
#' @export
get_tmh_lengths <- function(topology) {
  pureseqtmr::check_topology(topology)
  tmhs <- stringr::str_match_all(string = topology$topology, pattern = "[1]+")
  stringr::str_length(unlist(tmhs))
}
