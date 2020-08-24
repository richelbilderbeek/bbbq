test_that("use", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()

  t <- predict_n_binders_tmh_peptide(
    protein_sequence = "FANTASTICFAMILYVW",
    haplotype = get_mhc1_haplotypes()[1],
    peptide_length = 9,
    percentile = 0.05,
    ic50_prediction_tool = "EpitopePrediction"
  )
  expect_true(tibble::is_tibble(t))
  expect_true("n_binders" %in% names(t))
  expect_true("n_binders_tmh" %in% names(t))
  expect_true(t$n_binders >= t$n_binders_tmh)
})
