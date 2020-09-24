#' Convert a (DNA) triplet to the corresponding amino acid
#' @note need to convert T to U for RNA triplets
#' @inheritParams default_params_doc
#' @examples
#'
#' expect_equal(convert_triplet_to_amino_acid("GCT"), "A")
#' expect_equal(convert_triplet_to_amino_acid("GCC"), "A")
#' expect_equal(convert_triplet_to_amino_acid("GCA"), "A")
#' expect_equal(convert_triplet_to_amino_acid("GCG"), "A")
#' @author Richèl J.C. Bilderbeek
#' @export
convert_triplet_to_amino_acid <- function(triplet) {
  df <- bbbq::get_genetic_code()
  df$amino_acid[df$triplet == triplet]
}
