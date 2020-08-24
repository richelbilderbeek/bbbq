test_that("use", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()

  # VENV of COVID-19 reference proteome, has one TMH
  protein_sequence <- "MYSFVSEETGTLIVNSVLLFLAFVVFLLVTLAILTALRLCAYCCNIVNVSLVKPSFYVYSRVKNLNSSRVPDLLV" # nolint indeed long
  #          "000000000000001111111111111111111111111111111111000000000000000000000000000" # nolint indeed long
  t <- predict_n_coincidence_tmh_peptide(
    protein_sequence = protein_sequence,
    peptide_length = 9,
    ic50_prediction_tool = "EpitopePrediction"
  )
  expect_true(tibble::is_tibble(t))
  expect_true("n_spots" %in% names(t))
  expect_true("n_spots_tmh" %in% names(t))

  expect_true(t$n_spots >= t$n_spots_tmh)
  expect_equal(67, t$n_spots)
  expect_equal(42, t$n_spots_tmh)
})
