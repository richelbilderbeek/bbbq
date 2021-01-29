test_that("use", {
  t <- create_n_mers_tibble(strings = c("AB", "CDE"), n = 2)
  expect_equal(nrow(t), 3)
  expect_equal(t$string, c("AB", "CDE","CDE"))
  expect_equal(t$n_mer, c("AB", "CD","DE"))
})
