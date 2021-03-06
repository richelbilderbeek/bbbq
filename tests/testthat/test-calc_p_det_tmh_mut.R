test_that("use", {
  if (!pureseqtmr::is_on_travis()) return()
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  skip("No transition matrices troubles")

  protein_sequence <- "EKNWSALLTAVVIILTIAGNILV"
  expect_true(pureseqtmr::is_tmh(protein_sequence))
  p <- calc_p_det_tmh_mut(
    protein_sequence = protein_sequence,
    mhc_haplotype = bbbq::get_mhc2_haplotypes()[1],
    peptide_length = 13,
    n_adjancent_sequences = 20,
    ic50_prediction_tool = "netmhc2pan"
  )
  expect_true(p >= 0.0)
  expect_true(p <= 1.0)
})

test_that("use", {
  if (!pureseqtmr::is_on_travis()) return()
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  skip("No transition matrices troubles")

  protein_sequence <- "EKNWSALLTAVVIILTIAGNILV"
  expect_true(pureseqtmr::is_tmh(protein_sequence))
  p <- calc_p_det_tmh_mut(
    protein_sequence,
    bbbq::get_mhc2_haplotypes()[2],
    n_adjancent_sequences = 20
  )
  p
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
