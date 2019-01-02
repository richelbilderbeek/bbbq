context("test-answer_bbbq")

test_that("answer_bbbq", {
  testit::assert(tmhmm::is_tmhmm_installed())
  testit::assert(netmhc2pan::is_netmhc2pan_installed())

  fasta_filename <- system.file("extdata", "short.fasta", package = "bbbq")
  skip("WIP")
  df <- answer_bbbq()
  expect_true(is.data.frame(df))
})
