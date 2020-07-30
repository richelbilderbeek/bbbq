#' Predict the number of n-mers and the number of n-mers
#' that overlap with at least one amino acid with a TMH
#' for one peptide.
#' @inheritParams default_params_doc
#' @return a tibble with
#' \enumerate{
#'   \item n_spots number of spots for the n-mer
#'   \item n_spots_tmh number of spots that have one
#'     amino acid overlapping with a TMH
#' }
#' @author Richèl J.C. Bilderbeek
#' @examples
#' library(pureseqtmr)
#'
#' if (is_pureseqtm_installed()) {
#'
#'   peptide <- "MYSFVSEETGTLIVNSVLLFLAFVVFLLVTLAILTALRLCAYCCNIVNVSLVKPSFYVYSRV"
#'
#'   predict_n_coincidence_tmh_peptide(
#'     peptide = peptide,
#'     n_aas = 9
#'   )
#' }
#' @export
predict_n_coincidence_tmh_peptide <- function(# nolint indeed a long function name
  peptide,
  n_aas,
  verbose = FALSE
) {
  testthat::expect_true(length(peptide) == 1)
  pureseqtmr::check_pureseqtm_installation()
  topology <- pureseqtmr::predict_topology_from_sequence(peptide)
  topologies <- stringr::str_sub(
    topology,
    seq(1, nchar(topology) - n_aas + 1),
    seq(n_aas, nchar(topology))
  )
  n_spots <- length(topologies)
  which_tmh <- stringr::str_which(topologies, "1")
  n_spots_tmh <- length(which_tmh)

  result <- tibble::tibble(
    n_spots = n_spots,
    n_spots_tmh = n_spots_tmh
  )

  if (isTRUE(verbose)) {
    t <- tibble::tibble(topology = topologies)
    t$has_tmh <- FALSE
    t$has_tmh[which_tmh] <- TRUE
    cat(
      knitr::kable(t,
        caption = glue::glue(
          "protein length: {nchar(peptide)}, ",
          "epitope length: {n_aas}, ",
          "n spots: {n_spots}, ",
          "n spots TMHs: {n_spots_tmh}, ",
          "f: {n_spots_tmh / n_spots}"
        )
      ),
      sep = "\n"
    )
  }
  result
}
