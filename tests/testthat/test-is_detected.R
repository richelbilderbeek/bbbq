test_that("use", {

  expect_true(
    is_detected(
      "VVIILTIAGN",
      mhc_haplotype = bbbq::get_mhc1_haplotypes()[1],
      peptide_length = 9,
      percentile = 0.5,
      ic50_prediction_tool = "EpitopePrediction"
    )
  )
  expect_false(
    is_detected(
      "AAAARTIAGR",
      mhc_haplotype = bbbq::get_mhc1_haplotypes()[1],
      peptide_length = 9,
      percentile = 0.01,
      ic50_prediction_tool = "EpitopePrediction"
    )
  )
})
