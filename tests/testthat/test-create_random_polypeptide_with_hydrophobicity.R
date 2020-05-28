test_that("use", {
  expect_silent(
    create_random_peptide_with_hydrophobicity(
      n_aas = 2,
      min_hydrophobicity = 1.0,
      max_hydrophobicity = 1.5
    )
  )
})
