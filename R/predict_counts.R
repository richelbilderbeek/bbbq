#' Predict counts of one protein and one haplotype
#'
#' Predict the number of binders and the number of binders
#' that overlap with at least one amino acid with a TMH
#' for one protein.
#'
#' Use \link{predict_counts_per_proteome} to predict these
#' counts for multiple proteins.
#' @inheritParams default_params_doc
#' @return a tibble with
#' \enumerate{
#'   \item n_binders number of epitopes that bind
#'   \item n_binders_tmh number of epitopes that bind and have one
#'     amino acid overlapping with a TMH
#'   \item n_spots number of spots for the n-mer
#'   \item n_spots_tmh number of spots that have one
#'     amino acid overlapping with a TMH
#' }
#' The tibble will have one row (which matches the number of proteins).
#' @author Richèl J.C. Bilderbeek
#' @examples
#' if (mhcnuggetsr::is_mhcnuggets_installed() &&
#'   pureseqtmr::is_pureseqtm_installed()
#' ) {
#'   protein_sequence <- "MYSFVSEETGTLIVNSVLLFLAFV"
#'
#'   predict_counts(
#'     protein_sequence = protein_sequence,
#'     haplotype = get_mhc1_haplotypes()[1],
#'     peptide_length = 9,
#'     percentile = 0.123
#'   )
#' }
#' @export
predict_counts <- function(
  protein_sequence,
  haplotype,
  peptide_length,
  percentile,
  verbose = FALSE,
  ic50_prediction_tool = "mhcnuggetsr"
) {
  testthat::expect_equal(length(protein_sequence), 1)
  bbbq::check_protein_sequences_length(
    protein_sequences = protein_sequence,
    peptide_length = peptide_length
  )

  pureseqtmr::check_pureseqtm_installation()

  # Look up IC50 threshold for a binder
  # Also checks for installation, etc.
  ic50_threshold <- get_ic50_threshold(
    peptide_length = peptide_length,
    haplotype = haplotype,
    percentile = percentile,
    ic50_prediction_tool = ic50_prediction_tool
  )

  # Predict IC50
  ic50s <- bbbq::predict_ic50s(
    protein_sequence = protein_sequence,
    peptide_length = peptide_length,
    haplotype = haplotype,
    ic50_prediction_tool = ic50_prediction_tool
  )

  # Determine the binders
  ic50s$is_binder <- ic50s$ic50 < ic50_threshold

  # Determine topology
  topology <- pureseqtmr::predict_topology_from_sequence(protein_sequence)
  topologies <- stringr::str_sub(
    topology,
    seq(1, nchar(topology) - peptide_length + 1),
    seq(peptide_length, nchar(topology))
  )
  testthat::expect_equal(nrow(ic50s), length(topologies))
  has_tmhs_indices <- stringr::str_which(topologies, "1")
  is_binder_indices <- which(ic50s$is_binder == TRUE)
  n_binders <- length(is_binder_indices)
  is_tmh_and_binder_indices <- intersect(has_tmhs_indices, is_binder_indices)
  n_binders_tmh <- length(is_tmh_and_binder_indices)

  result <- tibble::tibble(
    n_binders = n_binders,
    n_binders_tmh = n_binders_tmh,
    n_spots = length(topologies),
    n_spots_tmh = length(has_tmhs_indices)
  )

  if (isTRUE(verbose)) {
    t <- ic50s
    t$topology <- topologies
    t$has_tmh <- FALSE
    t$has_tmh[has_tmhs_indices] <- TRUE
    t$is_tmh_and_binder <- FALSE
    t$is_tmh_and_binder[is_tmh_and_binder_indices] <- TRUE
    cat(
      knitr::kable(t,
        caption = glue::glue(
          "protein sequence length: {nchar(protein_sequence)}, ",
          "'peptide_length': {peptide_length}, ",
          "n fragments: {nrow(t)}, ",
          "n_binders: {result$n_binders}, ",
          "n with TMHs: {sum(t$has_tmh)}, ",
          "n with TMH and is binder: {result$n_binders_tmh}, ",
          "f: {n_binders_tmh / n_binders}"
        )
      ),
      sep = "\n"
    )
  }
  result
}
