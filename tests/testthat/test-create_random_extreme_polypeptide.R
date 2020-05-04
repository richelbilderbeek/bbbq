test_that("use", {
  expect_true(
    is_polypeptide(
      create_random_extreme_polypeptide(n_aas = 20)
    )
  )
})
