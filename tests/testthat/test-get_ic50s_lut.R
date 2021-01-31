test_that("use", {
  skip("Local only")
  t <- get_ic50s_lut(
    haplotype = "HLA-A*01:01",
    peptide_length = 9,
    ic50_prediction_tool = "EpitopePrediction"
  )
  expect_true(tibble::is_tibble(t))
  expect_true("peptide" %in% names(t))
  expect_true("ic50" %in% names(t))
})

test_that("use", {
  skip("Local only")
  for (haplotype in get_mhc1_haplotypes()) {
    message(haplotype)
    expect_silent(
      get_ic50s_lut(
        haplotype = haplotype,
        peptide_length = 9,
        ic50_prediction_tool = "EpitopePrediction"
      )
    )
  }
})
