test_that("use", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()
  expect_true(is_polypeptide(create_random_tmh(30)))
  expect_true(pureseqtmr::is_tmh(create_random_tmh(30)))
})
