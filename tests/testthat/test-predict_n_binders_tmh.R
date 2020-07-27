test_that("minimal use, MHC-I", {
  t <- predict_n_binders_tmh(
    target_name = "test",
    haplotypes = get_mhc1_haplotypes()[1:2],
    n_aas = 9
  )
  expect_true(tibble::is_tibble(t))
  expect_true("haplotype" %in% names(t))
  expect_true("n_binders" %in% names(t))
  expect_true("n_binders_tmh" %in% names(t))
  f <- t$n_binders_tmh / t$n_binders_tmh
  f[is.na(f)] <- 0.0
  expect_true(all(f >= 0.0))
  expect_true(all(f <= 1.00))
  t
})

test_that("minimal use, MHC-II", {
  t <- predict_n_binders_tmh(
    target_name = "test",
    haplotypes = get_mhc2_haplotypes()[1:2],
    n_aas = 9
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
  t <- predict_n_binders_tmh(
    target_name = "covid",
    haplotypes = get_mhc1_haplotypes()[1:2],
    n_aas = 9,
    percentile = 0.05
  )
  expect_true(tibble::is_tibble(t))
  expect_true("haplotype" %in% names(t))
  expect_true("n_binders" %in% names(t))
  expect_true("n_binders_tmh" %in% names(t))
  t$f <- t$n_binders_tmh / t$n_binders
  t$f[is.na(t$f)] <- 0.0
  expect_true(all(t$f >= 0.0))
  expect_true(all(t$f <= 1.00))
  t
})
