test_that("minimal use", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  t <- predict_f_binders_tmh(
    target_name = "test",
    haplotypes = get_mhc1_haplotypes()[1:2],
    peptide_length = 9,
    percentile = 0.05
  )

  expect_true(tibble::is_tibble(t))
  expect_true("haplotype" %in% names(t))
  expect_true("f" %in% names(t))
  expect_true(all(t$f >= 0.0))
  expect_true(all(t$f <= 1.00))
  t
})
