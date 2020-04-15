test_that("use", {
  expect_silent(get_mhc1_haplotypes())
  expect_true(length(get_mhc1_haplotypes()) > 0)
})
