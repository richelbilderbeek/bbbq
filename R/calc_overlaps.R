#' Calculate the fractions of MHC epitopes that overlap with a TMH
#' for multiple MHC haplotypes for one type of agent.
#' @inherit default_params_doc
#' @return per haplotype, the fraction of MHC epitopes
#' that overlap with a TMH. The fractions range from 0 ('none')
#' to (and including) 1 ('all')
#' @author Richèl J.C. Bilderbeek
#' @export
calc_overlaps <- function(
  target_name,
  haplotypes
) {
  testthat::expect_true(
    target_name %in% c("test", "human", "covid", "myco")
  )
  t <- tibble::tibble(haplotype = haplotypes, f_overlap = NA)
  for (i in seq_along(haplotypes)) {
    t$f_overlap <- bbbq::calc_overlap(
      target_name = target_name,
      haplotype = haplotype
    )
  }
  t
}
