#' Does something
#' @param mhc simplified MHC name, for example, `A02-01`
#'   to use `HLA-A02:01`
#' @author Richèl J.C. Bilderbeek, adapted from Johannes Textor
#' @export
hyPref <- function(mhc) {

  full_mhc_name <- paste0("HLA-",gsub("-",":",mhc))

  m <- 10^(-EpitopePrediction::smmMatrix(full_mhc_name)$M)

  m <- scale(m, center = FALSE, scale = colSums(m))

  colEntropies <- apply(
    m,
    2,
    function(x) {
    	x <- x * log(x)
    	x[is.nan(x)] <- 0
  		log(20) + sum(x)
  	}
  )

  m <- scale(m, center = FALSE, scale = 1.0 / colEntropies)

  sum(sweep(m, 1, Peptides::hydrophobicity(rownames(m)), "*")) / 9
}
