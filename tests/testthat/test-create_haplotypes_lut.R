test_that("use", {
  t <- create_haplotypes_lut()
  expect_true("haplotype" %in% names(t))
  expect_true("haplotype_id" %in% names(t))
  expect_true("mhc_class" %in% names(t))
  expect_equal(nrow(t), 13 + 21)
})
