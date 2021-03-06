test_that("minimal use", {
  t <- predict_n_binders_tmh(
    target_name = "test",
    haplotype = get_mhc1_haplotypes()[1],
    peptide_length = 9
  )
  expect_true(f_overlap > 0.1)
  expect_true(f_overlap < 0.9)
})
