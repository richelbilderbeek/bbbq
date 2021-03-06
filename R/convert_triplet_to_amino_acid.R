#' Convert a (DNA) triplet to the corresponding amino acid
#' @note need to convert T to U for RNA triplets
#' @inheritParams default_params_doc
#' @examples
#' convert_triplet_to_amino_acid("GCT")
#' @author Richèl J.C. Bilderbeek
#' @export
convert_triplet_to_amino_acid <- function(triplet) {
  df <- bbbq::get_genetic_code()
  df$amino_acid[df$triplet == triplet]
}
