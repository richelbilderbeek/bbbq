test_that("use", {
  n_mhc1 <- length(get_mhc1_haplotypes())
  n_mhc2 <- length(get_mhc2_haplotypes())
  n_total <- length(get_mhc_haplotypes())
  expect_equal(n_total, n_mhc1 + n_mhc2)
})
