test_that("use", {
  expect_equal(20, nrow(get_aa_transition_matrix()))
  expect_equal(20, ncol(get_aa_transition_matrix()))
  expect_equal("A", colnames(get_aa_transition_matrix())[1])
  expect_equal("A", rownames(get_aa_transition_matrix())[1])
})
