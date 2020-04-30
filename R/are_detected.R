#' Are the protein sequences detected by either MHC-I or MHC-II?
#' @inheritParams default_params_doc
#' @export
are_detected <- function(protein_sequences) {
  results <- rep(NA, length(protein_sequences))
  for (i in seq_along(protein_sequences)) {
    results[i] <- bbbq::is_detected(protein_sequences[i])
  }
  results
}
