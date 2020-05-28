test_that("use", {
  set.seed(42)
  n_peptides <- 2
  peptides <- create_random_peptides(
    n_peptides = n_peptides,
    n_aas = 3
  )
  expect_equal(
    n_peptides,
    length(peptides)
  )
  expect_true(peptides[1] != peptides[2]) # Hence the seed
})
