test_that("use", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  expect_true(is_peptide(create_random_tmh(30)))
  expect_true(pureseqtmr::is_tmh(create_random_tmh(30)))
})

test_that("create random tmh, but fails once in doing so", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  set.seed(3)
  expect_true(is_peptide(create_random_tmh(30)))
})
