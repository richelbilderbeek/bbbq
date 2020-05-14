context("test-answer_bbbq_1")

test_that("answer_bbbq_1", {

  if (!beastier::is_on_travis()) return()
  if (!pureseqtmr::is_pureseqtmr_installed()) return()
  if (!netmhc2pan::is_netmhc2pan_installed()) return()

  testit::assert(pureseqtmr::is_pureseqtmr_installed())
  testit::assert(netmhc2pan::is_tcsh_installed())
  testit::assert()

  fasta_filename <- system.file("extdata", "short.fasta", package = "bbbq")
  alleles <- "DRB1_0101"
  binding_strength_threshold <- 5.0
  pureseqtmr_filename <- tempfile(".txt")
  netmhc2pan_filename <- tempfile(".csv")
  epitopeome_filename <- tempfile(".fasta")

  testit::assert(all(alleles %in% netmhc2pan::get_netmhc2pan_alleles()))
  df <- answer_bbbq_1(
    fasta_filename = fasta_filename,
    alleles = alleles,
    binding_strength_threshold = binding_strength_threshold,
    pureseqtmr_filename = pureseqtmr_filename,
    netmhc2pan_filename = netmhc2pan_filename,
    epitopeome_filename = epitopeome_filename
  )
  expect_true(is.data.frame(df))
})
