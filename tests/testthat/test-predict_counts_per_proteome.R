test_that("MHCnuggetsr, peptide length 9", {
  if (!pureseqtmr::is_on_travis()) return()
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()
  protein_sequences <- c(
    "SWINGTRANSMITWILLINGFASCINATEARISERISKGRATE",
    "FANTASTICALLYFAMILYVW"
  )
  t <- predict_counts_per_proteome(
    protein_sequences = protein_sequences,
    haplotype = get_mhc1_haplotypes()[1],
    peptide_length = 9,
    percentile = 0.05,
   ic50_prediction_tool = "mhcnuggetsr"
  )
  expect_true(tibble::is_tibble(t))
  expect_equal(nrow(t), length(protein_sequences))
  expect_true("n_binders" %in% names(t))
  expect_true("n_binders_tmh" %in% names(t))
  expect_true("n_spots" %in% names(t))
  expect_true("n_spots_tmh" %in% names(t))
})

test_that("MHCnuggetsr, peptide length 10", {
  if (!pureseqtmr::is_on_travis()) return()
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  protein_sequences <- c(
    "SWINGTRANSMITWILLINGFASCINATEARISERISKGRATE",
    "FANTASTICALLYFAMILYVW"
  )
  t <- predict_counts_per_proteome(
    protein_sequences = protein_sequences,
    haplotype = get_mhc1_haplotypes()[1],
    peptide_length = 10,
    percentile = 0.05,
   ic50_prediction_tool = "mhcnuggetsr"
  )
  expect_true(tibble::is_tibble(t))
  expect_equal(nrow(t), length(protein_sequences))
  expect_true("n_binders" %in% names(t))
  expect_true("n_binders_tmh" %in% names(t))
  expect_true("n_spots" %in% names(t))
  expect_true("n_spots_tmh" %in% names(t))
})

test_that("MHCnuggetsr, MHC-II, peptide length 13", {
  if (!pureseqtmr::is_on_travis()) return()
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  protein_sequences <- c(
    "SWINGTRANSMITWILLINGFASCINATEARISERISKGRATE",
    "FANTASTICALLYFAMILYVW"
  )
  t <- predict_counts_per_proteome(
    protein_sequences = protein_sequences,
    haplotype = get_mhc2_haplotypes()[1],
    peptide_length = 13,
    percentile = 0.05,
   ic50_prediction_tool = "mhcnuggetsr"
  )
  expect_true(tibble::is_tibble(t))
  expect_equal(nrow(t), length(protein_sequences))
  expect_true("n_binders" %in% names(t))
  expect_true("n_binders_tmh" %in% names(t))
  expect_true("n_spots" %in% names(t))
  expect_true("n_spots_tmh" %in% names(t))
})

test_that("MHCnuggetsr on short sequence", {
  if (!pureseqtmr::is_on_travis()) return()
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  protein_sequences <- c(
    "FANTASTICALLY",
    "GTGG"
  )
  t <- predict_counts_per_proteome(
    protein_sequences = protein_sequences,
    haplotype = get_mhc2_haplotypes()[1],
    peptide_length = 13,
    percentile = 0.05,
   ic50_prediction_tool = "mhcnuggetsr"
  )
  expect_true(tibble::is_tibble(t))
  expect_equal(nrow(t), length(protein_sequences))
  expect_true(is.na(t$n_binders[2]))
  expect_true(is.na(t$n_binders_tmh[2]))
  expect_true(is.na(t$n_spots[2]))
  expect_true(is.na(t$n_spots_tmh[2]))
  t
})

test_that("use, EpitopePrediction, MHC-I, peptide length 9", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()

  protein_sequences <- c(
    "SWINGTRANSMITWILLINGFASCINATEARISERISKGRATE",
    "FANTASTICALLYFAMILYVW"
  )
  t <- predict_counts_per_proteome(
    protein_sequences = protein_sequences,
    haplotype = get_mhc1_haplotypes()[1],
    peptide_length = 9,
    percentile = 0.05,
    ic50_prediction_tool = "EpitopePrediction"
  )
  expect_true(tibble::is_tibble(t))
  expect_equal(nrow(t), length(protein_sequences))
  expect_true("n_binders" %in% names(t))
  expect_true("n_binders_tmh" %in% names(t))
  expect_true("n_spots" %in% names(t))
  expect_true("n_spots_tmh" %in% names(t))
})

test_that("EpitopePrediction does not support U", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()

  protein_sequences <- c(
    "FANTASTICALLY",
    "FANTASTICALLU"
  )
  t <- predict_counts_per_proteome(
    protein_sequences = protein_sequences,
    haplotype = get_mhc1_haplotypes()[1],
    peptide_length = 9,
    percentile = 0.05,
    ic50_prediction_tool = "EpitopePrediction"
  )
  expect_true(tibble::is_tibble(t))
  expect_equal(nrow(t), length(protein_sequences))
  expect_true(is.na(t$n_binders[2]))
  expect_true(is.na(t$n_binders_tmh[2]))
  expect_true(is.na(t$n_spots[2]))
  expect_true(is.na(t$n_spots_tmh[2]))
  t
})

test_that("EpitopePrediction on short peptide", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()

  # https://github.com/richelbilderbeek/bbbq_article/issues/58
  protein_sequences <- c(
    "FANTASTICALLY",
    "GTGG"
  )
  t <- predict_counts_per_proteome(
    protein_sequences = protein_sequences,
    haplotype = get_mhc1_haplotypes()[1],
    peptide_length = 9,
    percentile = 0.05,
    ic50_prediction_tool = "EpitopePrediction"
  )
  expect_true(tibble::is_tibble(t))
  expect_equal(nrow(t), length(protein_sequences))
  expect_true(is.na(t$n_binders[2]))
  expect_true(is.na(t$n_binders_tmh[2]))
  expect_true(is.na(t$n_spots[2]))
  expect_true(is.na(t$n_spots_tmh[2]))
  t
})

test_that("use, NetMHC2pan, MHC-II, peptide length 13", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  if (!netmhc2pan::is_netmhc2pan_installed()) return()

  protein_sequences <- c(
    "SWINGTRANSMITWILLINGFASCINATEARISERISKGRATE",
    "FANTASTICALLYFAMILYVW"
  )
  t <- predict_counts_per_proteome(
    protein_sequences = protein_sequences,
    haplotype = get_mhc2_haplotypes()[1],
    peptide_length = 13,
    percentile = 0.05,
    ic50_prediction_tool = "netmhc2pan"
  )
  expect_true(tibble::is_tibble(t))
  expect_equal(nrow(t), length(protein_sequences))
  expect_true("n_binders" %in% names(t))
  expect_true("n_binders_tmh" %in% names(t))
  expect_true("n_spots" %in% names(t))
  expect_true("n_spots_tmh" %in% names(t))
})

test_that("NetMHC2pan does handle U", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  if (!netmhc2pan::is_netmhc2pan_installed()) return()

  protein_sequences <- c(
    "FANTASTICALLY",
    "FANTASTICALLU"
  )
  t <- predict_counts_per_proteome(
    protein_sequences = protein_sequences,
    haplotype = get_mhc2_haplotypes()[1],
    peptide_length = 13,
    percentile = 0.05,
    ic50_prediction_tool = "netmhc2pan"
  )
  t
  expect_true(tibble::is_tibble(t))
  expect_equal(nrow(t), length(protein_sequences))
  expect_true("n_binders" %in% names(t))
  expect_true("n_binders_tmh" %in% names(t))
  expect_true("n_spots" %in% names(t))
  expect_true("n_spots_tmh" %in% names(t))
})

test_that("NetMHC2pan on short peptide", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  if (!netmhc2pan::is_netmhc2pan_installed()) return()

  protein_sequences <- c(
    "FANTASTICALLY",
    "GTGG"
  )
  t <- predict_counts_per_proteome(
    protein_sequences = protein_sequences,
    haplotype = get_mhc2_haplotypes()[1],
    peptide_length = 13,
    percentile = 0.05,
    ic50_prediction_tool = "netmhc2pan"
  )
  t
  expect_true(tibble::is_tibble(t))
  expect_equal(nrow(t), length(protein_sequences))
  expect_true(is.na(t$n_binders[2]))
  expect_true(is.na(t$n_binders_tmh[2]))
  expect_true(is.na(t$n_spots[2]))
  expect_true(is.na(t$n_spots_tmh[2]))
})
