test_that("use", {
  expect_silent(get_mhc1_allele_names())
  expect_true(length(get_mhc1_allele_names()) > 0)
})
