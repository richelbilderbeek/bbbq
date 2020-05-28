#' Get the transition rates from the one focal protein sequence
#' to the one or more target protein sequences
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
get_transition_rates <- function(
  protein_sequence,
  protein_sequences
) {
  rates <- rep(NA, length(protein_sequences))
  for (i in seq_along(protein_sequences)) {
    rates[i] <- bbbq::get_transition_rate(
      protein_sequence,
      protein_sequences[i]
    )
  }
  rates
}
