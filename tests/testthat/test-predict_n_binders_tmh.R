test_that("minimal use, MHC-I", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  t <- predict_n_binders_tmh(
    target_name = "test",
    haplotypes = get_mhc1_haplotypes()[1:2],
    n_aas = 9,
    percentile = 0.123
  )
  expect_true(tibble::is_tibble(t))
  expect_true("haplotype" %in% names(t))
  expect_true("n_binders" %in% names(t))
  expect_true("n_binders_tmh" %in% names(t))
  f <- t$n_binders_tmh / t$n_binders_tmh
  expect_true(all(f >= 0.0))
  expect_true(all(f <= 1.00))
})

test_that("minimal use, MHC-II", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  t <- predict_n_binders_tmh(
    target_name = "test",
    haplotypes = get_mhc2_haplotypes()[1:2],
    n_aas = 9,
    percentile = 0.234
  )
  expect_true(tibble::is_tibble(t))
  expect_true("haplotype" %in% names(t))
  expect_true("n_binders" %in% names(t))
  expect_true("n_binders_tmh" %in% names(t))
  t$f <- t$n_binders_tmh / t$n_binders_tmh
  t$f[is.na(t$f)] <- 0.0
  expect_true(all(t$f >= 0.0))
  expect_true(all(t$f <= 1.00))
  t
})

test_that("COVID, MHC-I", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  t <- predict_n_binders_tmh(
    target_name = "covid",
    haplotypes = get_mhc1_haplotypes()[1:2],
    n_aas = 9,
    percentile = 0.1
  )
  expect_true(tibble::is_tibble(t))
  expect_true("haplotype" %in% names(t))
  expect_true("n_binders" %in% names(t))
  expect_true("n_binders_tmh" %in% names(t))
  t$f <- t$n_binders_tmh / t$n_binders
  expect_true(all(t$f >= 0.0))
  expect_true(all(t$f <= 1.00))
})
