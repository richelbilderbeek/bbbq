test_that("use", {
  protein_sequence <- "AA"
  protein_sequences <- c("VW", "CW")
  tr_1 <- get_transition_rate(protein_sequence, protein_sequences[1])
  tr_2 <- get_transition_rate(protein_sequence, protein_sequences[2])
  expect_equal(
    get_transition_rates(
      protein_sequence,
      protein_sequences
    ),
    c(tr_1, tr_2)
  )
})
