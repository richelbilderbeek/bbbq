#' Calculate the fractions of MHC epitopes that overlap with a TMH
#' for multiple MHC haplotypes for one type of agent.
#' @inherit default_params_doc
#' @return per haplotype, the fraction of MHC epitopes
#' that overlap with a TMH. The fractions range from 0 ('none')
#' to (and including) 1 ('all')
#' @author Richèl J.C. Bilderbeek
#' @export
calc_overlap <- function(
  target_name,
  haplotype,
  n_aas
) {
  testthat::expect_true(
    target_name %in% c("test", "human", "covid", "myco")
  )
  testthat::expect_true(target_name == "test")

  proteome_filename <- get_test_proteome_filename()
  proteome <- seqinr::read.fasta(proteome_filename, seqtype = "AA")
  testthat::expect_equal(1, length(proteome)) # nolint TODO: support multi-line sequences
  peptide <- paste0(proteome[[1]], collapse = "")
  bbbq::calc_overlap_peptide(
    peptide = peptide,
    target_name = target_name,
    haplotype = haplotype,
    n_aas = n_aas
  )
}

