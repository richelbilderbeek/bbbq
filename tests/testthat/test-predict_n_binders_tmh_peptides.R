test_that("use", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  peptides <- c(
    "MYSFVSEETGTLIVNSVLLFLAFVVFLLVTLAILTALRLCAYCCNIVNVSLVKPSFYVYSRVKNLNSSRVPDL",
    "MYSFVSEETGTLIVNSVLLFLAFVVFLLVTLAILTALRLCAYCCNIVNVSLVKPSFYVYSRV"
  )
  sink("/dev/null") # Remove the cat output, due to verbose is TRUE
  t <- predict_n_binders_tmh_peptides(
    peptides = peptides,
    haplotype = get_mhc1_haplotypes()[1],
    n_aas = 9,
    percentile = 0.1
  )
  t
  sink()
  expect_true(tibble::is_tibble(t))
  expect_true("n_binders" %in% names(t))
  expect_true("n_binders_tmh" %in% names(t))

  expect_true(sum(t$n_binders) >= sum(t$n_binders_tmh))
  expect_equal(c(3, 2), t$n_binders)
  expect_equal(c(1, 1), t$n_binders_tmh)
})
