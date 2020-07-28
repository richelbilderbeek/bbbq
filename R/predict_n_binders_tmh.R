#' Calculate the fractions of MHC epitopes that overlap with a TMH
#' for multiple MHC haplotypes for one type of agent.
#' @inheritParams default_params_doc
#' @return a tibble, with columns:
#' \enumerate{
#'   \item haplotype haplotype name
#'   \item n_binders number of epitopes that bind
#'   \item n_binders_tmh number of epitopes that bind and have one
#'     amino acid overlapping with a TMH
#' }
#' and one row per peptide
#' @author Richèl J.C. Bilderbeek
#' @export
predict_n_binders_tmh <- function(
  target_name,
  haplotypes,
  n_aas,
  percentile
) {
  testthat::expect_true(
    target_name %in% c("test", "human", "covid", "myco")
  )
  proteome_filename <- NA
  if (target_name == "test") {
    proteome_filename <- bbbq::get_test_proteome_filename()
  } else if (target_name == "covid") {
     proteome_filename <- bbbq::get_covid_proteome_filename()
  } else {
    stop("Target type '", target_name, "' not implemented yet")
  }
  testthat::expect_true(!is.na(proteome_filename))
  proteome <- seqinr::read.fasta(
    proteome_filename,
    seqtype = "AA",
    as.string = TRUE
  )
  peptides <- as.character(proteome)

  t <- tibble::tibble(
    haplotype = haplotypes,
    n_binders = NA,
    n_binders_tmh = NA
  )

  for (i in seq_along(haplotypes)) {
    this_t <- bbbq::predict_n_binders_tmh_peptides(
      haplotype = haplotypes[i],
      peptides = peptides,
      n_aas = n_aas,
      percentile = percentile
    )
    t$n_binders[i] <- sum(this_t$n_binders)
    t$n_binders_tmh[i] <- sum(this_t$n_binders_tmh)
  }
  t
}
