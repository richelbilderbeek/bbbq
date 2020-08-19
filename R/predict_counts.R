#' Predict the number of binders and the number of binders
#' that overlap with at least one amino acid with a TMH
#' for one peptide.
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
#' @author Richèl J.C. Bilderbeek
#' @examples
#' library(mhcnuggetsr)
#' library(pureseqtmr)
#'
#' if (is_mhcnuggets_installed() && is_pureseqtm_installed()) {
#'
#'   peptide <- "MYSFVSEETGTLIVNSVLLFLAFV"
#'
#'   predict_counts(
#'     peptide = peptide,
#'     haplotype = get_mhc1_haplotypes()[1],
#'     peptide_length = 9,
#'     percentile = 0.123
#'   )
#' }
#' @export
predict_counts <- function(
  peptide,
  haplotype,
  peptide_length,
  percentile,
  verbose = FALSE,
  ic50_prediction_tool = "mhcnuggetsr"
) {
  testthat::expect_true(length(peptide) == 1)

  # Check installations
  if (ic50_prediction_tool == "mhcnuggetsr") {
    mhcnuggetsr::check_mhcnuggets_installation()
  } else if (ic50_prediction_tool == "netmhc2pan") {
    netmhc2pan::check_netmhc2pan_installation()
  } else if (ic50_prediction_tool == "EpitopePrediction") {
    # No need to check installation of this R package
  } else {
    stop("Unknown 'ic50_prediction_tool': ", ic50_prediction_tool)
  }
  pureseqtmr::check_pureseqtm_installation()

  # Predict IC50
  ic50s <- NA
  if (ic50_prediction_tool == "mhcnuggetsr") {
    ic50s <- mhcnuggetsr::predict_ic50s(
      peptide = peptide,
      n_aas = peptide_length,
      mhcnuggets_options = mhcnuggetsr::create_mhcnuggets_options(
        mhc = mhcnuggetsr::to_mhcnuggets_name(haplotype)
      )
    )
  } else if (ic50_prediction_tool == "netmhc2pan") {
    ic50s <- netmhc2pan::predict_ic50s(
      protein_sequence = peptide,
      peptide_length = peptide_length,
      mhc_haplotype = netmhc2pan::to_netmhc2pan_name(haplotype),
    )
  } else if (ic50_prediction_tool == "EpitopePrediction") {
    peptides <- bbbq::shred_protein(
      protein_sequence = peptide,
      peptide_length = peptide_length,
    )
    ic50s <- EpitopePrediction::smm(
      x = peptides,
      mhc = epiprepreds::to_epipred_name(haplotype)
    )
  } else {
    stop("Unknown 'ic50_prediction_tool': ", ic50_prediction_tool)
  }
  testthat::expect_equal(nrow(ic50s), nchar(peptide) - peptide_length + 1)

  # Look up IC50 threshold for a binder
  ic50_threshold <- NA
  if (ic50_prediction_tool == "mhcnuggetsr") {
    ic50_threshold <- mhcnpreds::get_ic50_threshold(
      peptide_length = peptide_length,
      mhc_haplotype = mhcnuggetsr::to_mhcnuggets_name(haplotype),
      percentile = percentile
    )
  } else if (ic50_prediction_tool == "netmhc2pan") {
    ic50_threshold <- nmhc2ppreds::get_ic50_threshold(
      peptide_length = peptide_length,
      mhc_haplotype = netmhc2pan::to_netmhc2pan_name(haplotype),
      percentile = percentile
    )
  } else if (ic50_prediction_tool == "EpitopePrediction") {
    ic50_threshold <- epiprepreds::get_ic50_threshold(
      peptide_length = peptide_length,
      mhc_haplotype = epiprepreds::to_epipred_name(haplotype),
      percentile = percentile
    )
  } else {
    stop("Unknown 'ic50_prediction_tool': ", ic50_prediction_tool)
  }

  # Determine the binders
  ic50s$is_binder <- ic50s$ic50 < ic50_threshold

  # Determine topology
  topology <- pureseqtmr::predict_topology_from_sequence(peptide)
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
          "peptide length: {nchar(peptide)}, ",
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
