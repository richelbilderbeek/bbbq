test_that("use", {
  # There are 20
  expect_equal(20, length(get_amino_acids()))
  # All are unique
  expect_equal(length(get_amino_acids()), length(unique(get_amino_acids())))
  # These are sorted
  expect_equal(get_amino_acids(), sort(get_amino_acids()))
  # First and last one
  expect_equal("A", get_amino_acids()[1])
  expect_equal("Y", get_amino_acids()[20])

})
