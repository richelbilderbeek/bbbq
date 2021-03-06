test_that("MHCNuggets, MHC-I, peptide length 9", {
  if (!pureseqtmr::is_on_travis()) return()
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  # VENV of COVID-19 reference proteome, has one TMH
  protein_sequence <- "MYSFVSEETGTLIVNSVLLFLAFVVFLLVTLAILTALRLCAYCCNIVNVSLVKPSFYVYSRVKNLNSSRVPDLLV" # nolint indeed long
  #          "000000000000001111111111111111111111111111111111000000000000000000000000000" # nolint indeed long
  t <- predict_counts(
    protein_sequence = protein_sequence,
    haplotype = get_mhc1_haplotypes()[1],
    peptide_length = 9,
    percentile = 0.05,
    ic50_prediction_tool = "mhcnuggetsr"
  )
  # Results from verbose output:
  # Table: peptide length: 75, epitope length: 9, n fragments: 67,
  # n is binder: 4, n with TMHs: 42, n with TMH and is binder: 1,
  # f_overlap: 0.25
  expect_true(tibble::is_tibble(t))
  expect_true("n_binders" %in% names(t))
  expect_true("n_binders_tmh" %in% names(t))
  expect_true("n_spots" %in% names(t))
  expect_true("n_spots_tmh" %in% names(t))

  expect_true(t$n_binders >= t$n_binders_tmh)
  expect_equal(2, t$n_binders)
  expect_equal(1, t$n_binders_tmh)
  expect_equal(67, t$n_spots)
  expect_equal(42, t$n_spots_tmh)
})

test_that("MHCNuggets, MHC-I, peptide length 10", {
  if (!pureseqtmr::is_on_travis()) return()
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  # VENV of COVID-19 reference proteome, has one TMH
  protein_sequence <- "MYSFVSEETGTLIVNSVLLFLAFVVFLLVTLAILTALRLCAYCCNIVNVSLVKPSFYVYSRVKNLNSSRVPDLLV" # nolint indeed long
  #          "000000000000001111111111111111111111111111111111000000000000000000000000000" # nolint indeed long
  t <- predict_counts(
    protein_sequence = protein_sequence,
    haplotype = get_mhc1_haplotypes()[1],
    peptide_length = 10,
    percentile = 0.05,
    ic50_prediction_tool = "mhcnuggetsr"
  )
  # Results from verbose output:
  # Table: peptide length: 75, epitope length: 9, n fragments: 67,
  # n is binder: 4, n with TMHs: 42, n with TMH and is binder: 1,
  # f_overlap: 0.25
  expect_true(tibble::is_tibble(t))
  expect_true("n_binders" %in% names(t))
  expect_true("n_binders_tmh" %in% names(t))
  expect_true("n_spots" %in% names(t))
  expect_true("n_spots_tmh" %in% names(t))

  expect_true(t$n_binders >= t$n_binders_tmh)
  expect_equal(4, t$n_binders)
  expect_equal(0, t$n_binders_tmh)
  expect_equal(66, t$n_spots)
  expect_equal(43, t$n_spots_tmh)
})

test_that("MHCNuggets, MHC-II, peptide length 13", {
  if (!pureseqtmr::is_on_travis()) return()
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  # VENV of COVID-19 reference proteome, has one TMH
  protein_sequence <- "MYSFVSEETGTLIVNSVLLFLAFVVFLLVTLAILTALRLCAYCCNIVNVSLVKPSFYVYSRVKNLNSSRVPDLLV" # nolint indeed long
  #          "000000000000001111111111111111111111111111111111000000000000000000000000000" # nolint indeed long
  t <- predict_counts(
    protein_sequence = protein_sequence,
    haplotype = get_mhc2_haplotypes()[1],
    peptide_length = 13,
    percentile = 0.05,
    ic50_prediction_tool = "mhcnuggetsr"
  )
  # Results from verbose output:
  # Table: peptide length: 75, epitope length: 9, n fragments: 67,
  # n is binder: 4, n with TMHs: 42, n with TMH and is binder: 1,
  # f_overlap: 0.25
  expect_true(tibble::is_tibble(t))
  expect_true("n_binders" %in% names(t))
  expect_true("n_binders_tmh" %in% names(t))
  expect_true("n_spots" %in% names(t))
  expect_true("n_spots_tmh" %in% names(t))

  expect_true(t$n_binders >= t$n_binders_tmh)
  expect_equal(6, t$n_binders)
  expect_equal(3, t$n_binders_tmh)
  expect_equal(63, t$n_spots)
  expect_equal(46, t$n_spots_tmh)
})

test_that("use, EpitopePrediction, MHC-I, peptide length 9", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()

  # VENV of COVID-19 reference proteome, has one TMH
  protein_sequence <- "MYSFVSEETGTLIVNSVLLFLAFVVFLLVTLAILTALRLCAYCCNIVNVSLVKPSFYVYSRVKNLNSSRVPDLLV" # nolint indeed long
  #          "000000000000001111111111111111111111111111111111000000000000000000000000000" # nolint indeed long
  t <- predict_counts(
    protein_sequence = protein_sequence,
    haplotype = get_mhc1_haplotypes()[1],
    peptide_length = 9,
    percentile = 0.05,
    ic50_prediction_tool = "EpitopePrediction"
  )
  # Results from verbose output:
  # Table: peptide length: 75, epitope length: 9, n fragments: 67,
  # n is binder: 4, n with TMHs: 42, n with TMH and is binder: 1,
  # f_overlap: 0.25
  expect_true(tibble::is_tibble(t))
  expect_true("n_binders" %in% names(t))
  expect_true("n_binders_tmh" %in% names(t))
  expect_true("n_spots" %in% names(t))
  expect_true("n_spots_tmh" %in% names(t))

  expect_true(t$n_binders >= t$n_binders_tmh)
  expect_equal(9, t$n_binders)
  expect_equal(5, t$n_binders_tmh)
  expect_equal(67, t$n_spots)
  expect_equal(42, t$n_spots_tmh)
})

test_that("use, NetMHC2pan, MHC-II, peptide length 13", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  if (!netmhc2pan::is_netmhc2pan_installed()) return()

  # VENV of COVID-19 reference proteome, has one TMH
  protein_sequence <- "MYSFVSEETGTLIVNSVLLFLAFVVFLLVTLAILTALRLCAYCCNIVNVSLVKPSFYVYSRVKNLNSSRVPDLLV" # nolint indeed long
  #          "000000000000001111111111111111111111111111111111000000000000000000000000000" # nolint indeed long
  t <- predict_counts(
    protein_sequence = protein_sequence,
    haplotype = get_mhc2_haplotypes()[1],
    peptide_length = 13,
    percentile = 0.05,
    ic50_prediction_tool = "netmhc2pan"
  )
  # Results from verbose output:
  # Table: peptide length: 75, epitope length: 9, n fragments: 67,
  # n is binder: 4, n with TMHs: 42, n with TMH and is binder: 1,
  # f_overlap: 0.25
  expect_true(tibble::is_tibble(t))
  expect_true("n_binders" %in% names(t))
  expect_true("n_binders_tmh" %in% names(t))
  expect_true("n_spots" %in% names(t))
  expect_true("n_spots_tmh" %in% names(t))

  expect_true(t$n_binders >= t$n_binders_tmh)
  expect_true(t$n_binders > 0)
  expect_true(t$n_binders_tmh > 0)
  expect_equal(63, t$n_spots)
  expect_equal(46, t$n_spots_tmh)
})
