context("test-answer_bbbq")

test_that("answer_bbbq", {
  testit::assert(tmhmm::is_tmhmm_installed())
  testit::assert(netmhc2pan::is_netmhc2pan_installed())

  fasta_filename <- system.file("extdata", "short.fasta", package = "bbbq")
  alleles <- "DRB1_0101"
  binding_strength_threshold <- 5.0
  tmhmm_filename <- tempfile(".txt")
  netmhc2pan_filename <- tempfile(".csv")
  epitopeome_filename <- tempfile(".fasta")

  testit::assert(all(alleles %in% netmhc2pan::get_netmhc2pan_alleles()))
  df <- answer_bbbq(
    fasta_filename = fasta_filename,
    alleles = alleles,
    binding_strength_threshold = binding_strength_threshold,
    tmhmm_filename = tmhmm_filename,
    netmhc2pan_filename = netmhc2pan_filename,
    epitopeome_filename = epitopeome_filename
  )
  expect_true(is.data.frame(df))
})
