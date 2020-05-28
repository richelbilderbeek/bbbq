test_that("use", {
  expect_true(
    is_peptide(
      create_random_extreme_peptide(n_aas = 20)
    )
  )
})
