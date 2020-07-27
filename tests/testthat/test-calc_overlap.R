test_that("minimal use", {
  f_overlap <- calc_overlap(
    target_name = "test",
    haplotype = get_mhc1_haplotypes()[1],
    n_aas = 9
  )
  expect_true(f_overlap > 0.1)
  expect_true(f_overlap < 0.9)
})

