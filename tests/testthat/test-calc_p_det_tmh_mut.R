test_that("use", {
  if (!pureseqtmr::is_on_travis()) return()
  if (!pureseqtmr::is_pureseqtm_installed()) return()

  protein_sequence <- "EKNWSALLTAVVIILTIAGNILV"
  expect_true(pureseqtmr::is_tmh(protein_sequence))
  p <- calc_p_det_tmh_mut(
    protein_sequence,
    bbbq::get_mhc2_haplotypes()[1]
  )
  expect_true(p >= 0.0)
  expect_true(p <= 1.0)
})

test_that("use", {
  if (!pureseqtmr::is_on_travis()) return()
  if (!pureseqtmr::is_pureseqtm_installed()) return()

  protein_sequence <- "EKNWSALLTAVVIILTIAGNILV"
  expect_true(pureseqtmr::is_tmh(protein_sequence))
  p <- calc_p_det_tmh_mut(
    protein_sequence,
    bbbq::get_mhc2_haplotypes()[2]
  )
  expect_true(p >= 0.0)
  expect_true(p <= 1.0)
})


test_that("use", {
  skip("Not now")
  p <- 1
  while (p == 1) {
    protein_sequence <- create_random_tmh()
    expect_true(pureseqtmr::is_tmh(protein_sequence))

    p <- calc_p_det_tmh_mut(protein_sequence)
  }
  p
  protein_sequence
  expect_true(p >= 0.0)
  expect_true(p <= 1.0)
})
