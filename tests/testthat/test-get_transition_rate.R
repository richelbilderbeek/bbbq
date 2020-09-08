test_that("use", {
  expect_equal(
    get_transition_rate("A", "V", transition_matrix_name = "FLU"),
    3.532,
    tol = 0.01
  )
  expect_equal(
    get_transition_rate("A", "R", transition_matrix_name = "FLU"),
    0.139,
    tol = 0.01
  )
})

test_that("use, double transitions", {
  single_transition_rate <- get_transition_rate("A", "W", transition_matrix_name = "FLU")
  double_transition_rate <- single_transition_rate / 2.0
  expect_equal(
    get_transition_rate("AA", "WW", transition_matrix_name = "FLU"),
    double_transition_rate,
    tol = 0.01
  )
})

test_that("use, double transitions", {
  tr2 <- get_transition_rate("A", "C", transition_matrix_name = "FLU")
  tr1 <- get_transition_rate("A", "W", transition_matrix_name = "FLU")
  combined_transition_rate <- 1.0 / ((1.0 / tr1) + (1.0 / tr2))
  expect_equal(
    get_transition_rate("AA", "CW", transition_matrix_name = "FLU"),
    combined_transition_rate,
    tol = 0.01
  )
})

test_that("use", {
  f <- "MVVITAMLSFLIAFAYMFSI"
  n <- "MVVITAMLSFLIAFAYGFSI"
  expect_true(get_transition_rate(f, n, transition_matrix_name = "FLU") > 0.0)
})
