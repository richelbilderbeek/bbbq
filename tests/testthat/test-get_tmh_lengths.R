test_that("use", {

  if (!pureseqtmr::is_pureseqtm_installed()) return()

  topology <- pureseqtmr::predict_topology(
    pureseqtmr::get_example_filename("1bhaA.fasta")
  )
  tmh_lengths <- get_tmh_lengths(topology)
  expect_true(length(tmh_lengths) > 0)
})
