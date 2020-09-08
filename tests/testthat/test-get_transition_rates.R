test_that("use", {
  protein_sequence <- "AA"
  protein_sequences <- c("VW", "CW")
  transition_matrix_name <- "FLU"
  tr_1 <- get_transition_rate(
    protein_sequence,
    protein_sequences[1],
    transition_matrix_name = transition_matrix_name
  )
  tr_2 <- get_transition_rate(
    protein_sequence,
    protein_sequences[2],
    transition_matrix_name = transition_matrix_name
  )
  expect_equal(
    get_transition_rates(
      protein_sequence,
      protein_sequences,
      transition_matrix_name = transition_matrix_name
    ),
    c(tr_1, tr_2)
  )
})
