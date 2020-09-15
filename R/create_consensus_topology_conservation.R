#' Create a consensus-topology-conservation table
#'
#' @return a \link{tibble} with columns:\cr
#' \itemize{
#'   \item aa the amino acid at that position in consensus sequence
#'   \item score the conservation score
#'   \item is_tmh if that amino acid at that location is part of a
#'     transmembrane helix
#' }
#' @inheritParams default_params_doc
#' @export
create_consensus_topology_conservation <- function( # nolint indeed a long function name
  protein_sequences,
  topology_prediction_tool,
  msa_method,
  msa_subst_matrix
) {
  bbbq::check_topology_prediction_tool(topology_prediction_tool)
  protein_alignment <- bbbq::create_msa(
    protein_sequences,
    msa_method = msa_method,
    msa_subst_matrix = msa_subst_matrix
  )

  # Use BLOSUM80, as the proteins are closely related
  BLOSUM80 <- NULL; rm(BLOSUM80) # nolint, fixes warning: no visible binding for global variable
  utils::data("BLOSUM80", package = "Biostrings")
  testthat::expect_equal("BLOSUM80", msa_subst_matrix)
  conservation_scores <- msa::msaConservationScore(
    protein_alignment,
    substitutionMatrix = BLOSUM80
  )
  t <- tibble::tibble(
    aa = names(conservation_scores),
    score = as.numeric(conservation_scores),
    is_tmh = NA
  )
  consensus <- paste0(names(conservation_scores), collapse = "")

  topology <- NA
  if (topology_prediction_tool == "pureseqtmr") {
    topology <- pureseqtmr::predict_topology_from_sequence(consensus)
  } else {
    testthat::expect_equal(topology_prediction_tool, "tmhmm")
    tmhmm::check_tmhmm_installation()
    topology <- tmhmm::run_tmhmm_on_sequence(consensus)
  }

  topology_index <- 1
  for (row_index in seq(1, nrow(t))) {
    if (t$aa[row_index] != "-") {
      t$is_tmh[row_index] <- stringr::str_sub(
        topology, topology_index, topology_index
      )
      topology_index <- topology_index + 1
    }
  }
  t
}
