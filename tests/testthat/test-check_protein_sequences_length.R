test_that("use", {
  expect_silent(
    check_protein_sequences_length(
      protein_sequences = "FANTASTICALLYFAMILYVW",
      peptide_length = 13
    )
  )
  expect_error(
    check_protein_sequences_length(
      protein_sequences = "ILL",
      peptide_length = 13
    )
  )

})
