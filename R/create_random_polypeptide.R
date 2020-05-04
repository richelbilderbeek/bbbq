#' Create a random polypeptide
#' @param n_aas number of amino acids
#' @export
create_random_polypeptide <- function(n_aas)
{
  paste0(
    sample(x = bbbq::get_amino_acids(), size = n_aas, replace = TRUE),
    collapse = ""
  )
}

