test_that("use", {
  expect_equal(
    are_detected(
      protein_sequences = c(
        "VVIILTIAGNILVIMAVSLE",
        "AAAARTIAGRILVIMARSAA"
      ),
      mhc_haplotype = bbbq::get_mhc1_haplotypes()[1],
      peptide_length = 9,
      percentile = 0.02,
      ic50_prediction_tool = "EpitopePrediction"
    ),
    c(TRUE, FALSE)
  )
})
