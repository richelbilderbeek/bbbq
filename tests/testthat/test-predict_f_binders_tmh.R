test_that("minimal use", {
  t <- predict_f_binders_tmh(
    target_name = "test",
    haplotypes = get_mhc1_haplotypes()[1:2],
    n_aas = 9
  )

  expect_true(tibble::is_tibble(t))
  expect_true("haplotype" %in% names(t))
  expect_true("f" %in% names(t))
  expect_true(all(t$f >= 0.0))
  expect_true(all(t$f <= 1.00))
})
