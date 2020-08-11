#' Create a lookup table for haplotypes, MHC class and haplotype ID
#'
#'
#' @return a tibble with columns:\cr
#' \itemize{
#'   \item haplotype the haplotype in official naming,
#'     for example \code{HLA-A*01:01}
#'   \item mhc_class the MHC class, for example \code{1}
#'   \item haplotype_id the haplotype ID, as used in file names,
#'     for example \code{h1}
#' }
#' @export
create_haplotypes_lut <- function() {
  t_1 <- tibble::tibble(
    haplotype = bbbq::get_mhc1_haplotypes(),
    mhc_class = 1
  )
  t_2 <- tibble::tibble(
    haplotype = bbbq::get_mhc2_haplotypes(),
    mhc_class = 2
  )
  t <- rbind(t_1, t_2)
  t$haplotype_id <- paste0("h", seq(1, nrow(t)))
  t
}
