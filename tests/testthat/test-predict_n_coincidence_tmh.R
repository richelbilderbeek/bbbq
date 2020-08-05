test_that("minimal use", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  t <- predict_n_coincidence_tmh(
    target_name = "test",
    peptide_length = 9
  )
  expect_true(tibble::is_tibble(t))
  expect_true("n_spots" %in% names(t))
  expect_true("n_spots_tmh" %in% names(t))
  f <- t$n_spots_tmh / t$n_spots_tmh
  expect_true(all(f >= 0.0))
  expect_true(all(f <= 1.00))
  t
})
