#' Get the AA transition rate from the FLU transition rate matrix
#' @inheritParams default_params_doc
#' @param seq_lhs amino acid to transition from
#' @param seq_rhs amino acid to transition to
#' @author Richèl J.C. Bilderbeek
#' @export
get_transition_rate <- function(
  seq_lhs,
  seq_rhs,
  transition_matrix_name
) {
  testthat::expect_equal(nchar(seq_lhs), nchar(seq_rhs))

  m <- bbbq::get_aa_transition_matrix(
    transition_matrix_name = transition_matrix_name
  )

  chars_lhs <- strsplit(seq_lhs, split = "")[[1]]
  chars_rhs <- strsplit(seq_rhs, split = "")[[1]]

  rates <- rep(NA, length(chars_lhs))

  for (i in seq_along(rates)) {
    char_lhs <- chars_lhs[i]
    char_rhs <- chars_rhs[i]
    if (char_lhs == char_rhs) next
    rates[i] <- as.numeric(
      stats::na.omit(
        c(
          m[char_lhs, char_rhs],
          m[char_rhs, char_lhs]
        )
      )
    )
  }

  valid_rates <- rates[!is.na(rates)]
  inverse_rates <- 1.0 / valid_rates
  combined_rate <- 1.0 / sum(inverse_rates)
  combined_rate
}
