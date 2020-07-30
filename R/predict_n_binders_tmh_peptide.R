#' Predict the number of binders and the number of binders
#' that overlap with at least one amino acid with a TMH
#' for one peptide.
#' @inheritParams default_params_doc
#' @return a tibble with
#' \enumerate{
#'   \item n_binders number of epitopes that bind
#'   \item n_binders_tmh number of epitopes that bind and have one
#'     amino acid overlapping with a TMH
#' }
#' @author Richèl J.C. Bilderbeek
#' @examples
#' library(mhcnuggetsr)
#' library(pureseqtmr)
#'
#' if (is_mhcnuggets_installed() && is_pureseqtm_installed()) {
#'
#'   peptide <- "MYSFVSEETGTLIVNSVLLFLAFVVFLLVTLAILTALRLCAYCCNIVNVSLVKPSFYVYSRV"
#'
#'   predict_n_binders_tmh_peptide(
#'     peptide = peptide,
#'     haplotype = get_mhc1_haplotypes()[1],
#'     n_aas = 9,
#'     percentile = 0.123
#'   )
#' }
#' @export
predict_n_binders_tmh_peptide <- function(
  peptide,
  haplotype,
  n_aas,
  percentile,
  verbose = FALSE
) {
  testthat::expect_true(length(peptide) == 1)
  mhcnuggetsr::check_mhcnuggets_installation()
  pureseqtmr::check_pureseqtm_installation()
  ic50s <- mhcnuggetsr::predict_ic50s(
    peptide = peptide,
    n_aas = n_aas,
    mhcnuggets_options = mhcnuggetsr::create_mhcnuggets_options(
      mhc = mhcnuggetsr::to_mhcnuggets_name(haplotype)
    )
  )
  testthat::expect_equal(nrow(ic50s), nchar(peptide) - n_aas + 1)
  ic50_threshold <- mhcnpreds::get_ic50_threshold(
    n_aas = n_aas,
    mhc_haplotype = mhcnuggetsr::to_mhcnuggets_name(haplotype),
    percentile = percentile
  )
  ic50s$is_binder <- ic50s$ic50 < ic50_threshold

  topology <- pureseqtmr::predict_topology_from_sequence(peptide)
  topologies <- stringr::str_sub(
    topology,
    seq(1, nchar(topology) - n_aas + 1),
    seq(n_aas, nchar(topology))
  )
  testthat::expect_equal(nrow(ic50s), length(topologies))
  has_tmhs_indices <- stringr::str_which(topologies, "1")
  is_binder_indices <- which(ic50s$is_binder == TRUE)
  n_binders <- length(is_binder_indices)
  is_tmh_and_binder_indices <- intersect(has_tmhs_indices, is_binder_indices)
  n_binders_tmh <- length(is_tmh_and_binder_indices)

  result <- tibble::tibble(
    n_binders = n_binders,
    n_binders_tmh = n_binders_tmh
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
          "epitope length: {n_aas}, ",
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
