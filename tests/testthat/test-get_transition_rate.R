test_that("use", {
  expect_equal(get_transition_rate("A", "W"), 0.01828929, tol = 0.01)
  expect_equal(get_transition_rate("A", "C"), 0.1386588, tol = 0.01)
})

test_that("use", {
  expect_equal(get_transition_rate("AA", "WW"), 0.01828929, tol = 0.01)
  expect_equal(get_transition_rate("AA", "CC"), 0.1386588, tol = 0.01)
  expect_true(get_transition_rate("AA", "WC") > 0.0)
})

test_that("use", {
  f <- "MVVITAMLSFLIAFAYMFSI"
  n <- "MVVITAMLSFLIAFAYGFSI"
  expect_true(get_transition_rate(f, n) > 0.0)
}}
