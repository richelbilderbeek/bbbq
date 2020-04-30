test_that("use", {
  protein_sequence <- "ITIVCFIVLGVIFCIGVIFI"
  expect_true(tmhmm::is_tmh(protein_sequence))
  p <- calc_p_det_tmh_mut(protein_sequence)
  expect_true(p >= 0.0)
  expect_true(p <= 1.0)
})


test_that("use", {
  p <- 1
  while (p == 1) {
    protein_sequence <- create_random_tmh()
    expect_true(tmhmm::is_tmh(protein_sequence))

    p <- calc_p_det_tmh_mut(protein_sequence)
  }
  p
  protein_sequence
  expect_true(p >= 0.0)
  expect_true(p <= 1.0)
})
