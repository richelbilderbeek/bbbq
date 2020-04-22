#' Convert a Greenbaum et al. name to a NetMHC2pan name
#' @param name an allele name as used by Greenbaum et al.
#' @export
to_netmhc2pan_name <- function(name) {

  testthat::expect_true(
    name %in% as.character(bbbq::get_mhc2_haplotype_occurance()$haplotype)
  )

  result <- stringr::str_replace(name, pattern = "\\*", replacement = "_")

  testthat::expect_true(
    result %in% netmhc2pan::get_netmhc2pan_alleles()
  )

  result
}
