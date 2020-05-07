#' Does something
#' @param mhc simplified MHC name, for example, `A02-01`
#'   to use `HLA-A02:01`
#' @author Richèl J.C. Bilderbeek, adapted from Johannes Textor
#' @export
hyPref <- function(mhc) {

  full_mhc_name <- paste0("HLA-",gsub("-",":",mhc))

  M <- 10^(-EpitopePrediction::smmMatrix(full_mhc_name)$M)

  M <- scale(M, center = FALSE, scale = colSums(M))

  colEntropies <- apply(
    M,
    2,
    function(x) {
    	x <- x * log(x)
    	x[is.nan(x)] <- 0
  		log(20) + sum(x)
  	}
  )

  M <- scale(M, center = FALSE, scale = 1.0 / colEntropies)

  #sum(sweep( M, 1, kyte.doolittle.scale[rownames(M)], "*" )) / 9
  sum(sweep( M, 1, Peptides::hydrophobicity(rownames(M)), "*" )) / 9
}
