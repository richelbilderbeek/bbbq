#' Simplify haplotype names to numbers
#' @export
simplify_haplotype_names <- function(haplotype_names) {
  simple_haplotype_names <- rep(NA, length = length(haplotype_names))
  for (i in seq_along(haplotype_names)) {
    haplotype_name <- haplotype_names[i]
    simple_haplotype_name <- NA
    if (haplotype_name %in% bbbq::get_mhc1_haplotypes()) {
      simple_haplotype_name <- which(haplotype_name == bbbq::get_mhc1_haplotypes())
    }
    if (haplotype_name %in% bbbq::get_mhc2_haplotypes()) {
      simple_haplotype_name <- which(haplotype_name == bbbq::get_mhc2_haplotypes())
    }
    testthat::expect_false(is.na(simple_haplotype_name))
    simple_haplotype_names[i] <- simple_haplotype_name
  }
  simple_haplotype_names
}
