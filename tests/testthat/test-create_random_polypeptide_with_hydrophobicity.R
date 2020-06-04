test_that("use", {
  expect_silent(
    create_random_peptide_with_hydrophobicity(
      n_aas = 2,
      min_hydrophobicity = 1.0,
      max_hydrophobicity = 1.5
    )
  )
})

test_that("abuse", {

  expect_error(
    create_random_peptide_with_hydrophobicity(
      n_aas = 1,
      min_hydrophobicity = 4.0,
      max_hydrophobicity = -4.0
    ),
    "'min_hydrophobicity' must be less than 'max_hydrophobicity'"
  )

  aas <- bbbq::get_amino_acids()
  hs <- Peptides::hydrophobicity(aas)

  expect_error(
    create_random_peptide_with_hydrophobicity(
      n_aas = 1,
      min_hydrophobicity = min(hs) - 0.1,
      max_hydrophobicity = 0.0
    ),
    "Cannot simulate peptide below the lowest hydrophobicity"
  )
  expect_error(
    create_random_peptide_with_hydrophobicity(
      n_aas = 1,
      min_hydrophobicity = 0.0,
      max_hydrophobicity = max(hs) + 0.1
    ),
    "Cannot simulate peptide above the heighest hydrophobicity"
  )

})