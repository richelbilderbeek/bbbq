#' Calculate the fractions of peptide fragmensts that overlap with a TMH
#' for one type of agent.
#' @inheritParams default_params_doc
#' @return a tibble, with columns:
#' \enumerate{
#'   \item n_spots number of spots
#'   \item n_spots_tmh number of spots that have one
#'     amino acid overlapping with a TMH
#' }
#' and one row per peptide
#' @author Richèl J.C. Bilderbeek
#' @export
predict_n_coincidence_tmh <- function(
  target_name,
  peptide_length
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

  this_t <- bbbq::predict_n_coincidence_tmh_peptides(
    peptides = peptides,
    peptide_length = peptide_length
  )
  t <- tibble::tibble(
    n_spots = sum(this_t$n_spots),
    n_spots_tmh = sum(this_t$n_spots_tmh)
  )
  t
}
