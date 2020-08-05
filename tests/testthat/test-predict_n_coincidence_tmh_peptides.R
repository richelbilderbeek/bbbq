test_that("use", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  peptides <- c(
    "MYSFVSEETGTLIVNSVLLFLAFVVFLLVTLAILTALRLCAYCCNIVNVSLVKPSFYVYSRVKNLNSSRVPDL",
    "MYSFVSEETGTLIVNSVLLFLAFVVFLLVTLAILTALRLCAYCCNIVNVSLVKPSFYVYSRV"
  )
  sink("/dev/null") # Remove the cat output, due to verbose is TRUE
  t <- predict_n_coincidence_tmh_peptides(
    peptides = peptides,
    peptide_length = 9,
    verbose = TRUE
  )
  t
  sink()
  expect_true(tibble::is_tibble(t))
  expect_true("n_spots" %in% names(t))
  expect_true("n_spots_tmh" %in% names(t))

  expect_true(sum(t$n_spots) >= sum(t$n_spots_tmh))
  expect_equal(c(65, 54), t$n_spots)
  expect_equal(c(42, 40), t$n_spots_tmh)
})
