test_that("use", {
  m <- get_aa_transition_matrix()
  expect_equal(20, nrow(m))
  expect_equal(20, ncol(m))
  expect_equal("A", colnames(m)[1])
  expect_equal("A", rownames(m)[1])
  expect_equal(m["R","A"], 0.139, tol = 0.001)
  expect_equal(m["V","A"], 3.532, tol = 0.001)
})
