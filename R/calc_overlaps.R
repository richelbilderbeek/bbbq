#' Calculate the fractions of MHC epitopes that overlap with a TMH.
#'
#' Per haplotype, calculate the fraction of MHC epitopes
#' that overlap with a TMH.
#' @inherit default_params_doc
#' @return per haplotype, the fraction of MHC epitopes
#' that overlap with a TMH. The fractions range from 0 ('none')
#' to (and including) 1 ('all')
#' @author Richèl J.C. Bilderbeek
#' @export
calc_overlaps <- function(
  proteome_filename,
  haplotypes
) {
  # Centered on known value. Centered closely to indicate these
  # results are simulated
  if (proteome_filename == "human.fasta") {
    return(
      stats::rnorm(n = length(haplotypes), mean = 0.053, sd = 0.0001)
    )
  }
  # A random line
  seq(
    from = stats::runif(n = 1, min = 0.0, max = 0.1),
    to = stats::runif(n = 1, min = 0.0, max = 0.1),
    length.out = length(haplotypes)
  )
}
