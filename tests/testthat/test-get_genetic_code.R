test_that("use", {
  df <- get_genetic_code()
  expect_true("triplet" %in% names(df))
  expect_true("amino_acid" %in% names(df))
})
