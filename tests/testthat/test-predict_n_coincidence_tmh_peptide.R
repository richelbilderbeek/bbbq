test_that("use", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()

  # VENV of COVID-19 reference proteome, has one TMH
  peptide <- "MYSFVSEETGTLIVNSVLLFLAFVVFLLVTLAILTALRLCAYCCNIVNVSLVKPSFYVYSRVKNLNSSRVPDLLV" # nolint indeed long
  #          "000000000000001111111111111111111111111111111111000000000000000000000000000" # nolint indeed long
  sink("/dev/null") # Remove the cat output, due to verbose is TRUE
  t <- predict_n_coincidence_tmh_peptide(
    peptide = peptide,
    peptide_length = 9,
    verbose = TRUE
  )
  # Results from verbose output:
  # Table: protein length: 75, epitope length: 9, n spots: 67, n spots TMHs: 42,
  # f: 0.626865671641791
  sink()
  expect_true(tibble::is_tibble(t))
  expect_true("n_spots" %in% names(t))
  expect_true("n_spots_tmh" %in% names(t))

  expect_true(t$n_spots >= t$n_spots_tmh)
  expect_equal(67, t$n_spots)
  expect_equal(42, t$n_spots_tmh)
})
