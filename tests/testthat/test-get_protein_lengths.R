context("test-get_protein_lengths")

test_that("use", {
  df <- get_protein_lengths()
  expect_true(nrow(df) > 1)
  expect_true("name" %in% colnames(df))
  expect_true("n_aa" %in% colnames(df))

})
