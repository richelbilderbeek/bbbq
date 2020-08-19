test_that("multiplication works", {
  peptide <- "FANTASTICALLY"
  peptide_length <- 9
  peptides <- shred_protein(
    protein_sequence = peptide,
    peptide_length = peptide_length
  )
  expected <- c(
    "FANTASTIC",
    "ANTASTICA",
    "NTASTICAL",
    "TASTICALL",
    "ASTICALLY"
  )
  expect_equal(peptides, expected)
})
