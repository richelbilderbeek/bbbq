test_that("use", {
  expect_equal(get_transition_rate("A", "W"), 0.01828929, tol = 0.01)
  expect_equal(get_transition_rate("A", "C"), 0.1386588, tol = 0.01)
})
