context("test-get_tmh_lengths")

test_that("use", {

  testit::assert(tmhmm::is_tmhmm_installed())
  testit::assert(netmhc2pan::is_netmhc2pan_installed())

  fasta_filename <- system.file(
    "extdata", "UP000001584_83332_6.fasta", package = "bbbq"
  )
  tmhmm_filename <- tempfile(fileext = "txt")
  netmhc2pan_filename <- tempfile(fileext = ".csv")
  epitopeome_filename <- tempfile(fileext = ".fasta")
  binding_strength_threshold <- 5.0
  alleles <- "DRB1_0101"

  epitopeome <- epitopeome::create_epitopeome(
    fasta_filename = fasta_filename,
    alleles = alleles,
    binding_strength_threshold = binding_strength_threshold,
    tmhmm_filename = tmhmm_filename,
    netmhc2pan_filename = netmhc2pan_filename,
    epitopeome_filename = epitopeome_filename
  )

  tmh_lengths <- get_tmh_lengths(epitopeome)

})
