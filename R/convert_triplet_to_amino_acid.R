#' Convert a (DNA) triplet to the corresponding amino acid
#' @note need to convert T to U for RNA triplets
#' @export
convert_triplet_to_amino_acid <- function(triplet) {
  df <- get_genetic_code()
  df$amino_acid[df$triplet == triplet]
}
