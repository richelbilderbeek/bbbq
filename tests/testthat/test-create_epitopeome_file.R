context("test-create_epitopeome_file")

test_that("use", {

  if (1 == 2) {
    fasta_filename <- get_bbbq_path("short.fasta")
    epitopeome_filename <- tempfile()
    epitopeome:::create_epitopeome_file(
      fasta_filename = fasta_filename,
      epitopeome_filename = epitopeome_filename
    )
    expect_true(file.exists(epitopeome_filename))
  }
})
