test_that("use", {
  n_mhc1 <- length(get_mhc1_allele_names())
  n_mhc2 <- length(get_mhc2_allele_names())
  n_total <- length(get_mhc_allele_names())
  expect_equal(n_total, n_mhc1 + n_mhc2)
})
