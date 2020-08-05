test_that("use", {
  expect_silent(
    create_random_peptide_with_hydrophobicity(
      peptide_length = 2,
      min_hydrophobicity = 1.0,
      max_hydrophobicity = 1.5
    )
  )
})

test_that("stop after too many attempts", {
  set.seed(42)
  expect_error(
    create_random_peptide_with_hydrophobicity(
      peptide_length = 10,
      min_hydrophobicity = 4.4,
      max_hydrophobicity = 4.5,
      n_attempts = 1
    ),
    "Too many attempts to generate peptide of hydrophobicity between"
  )
})

test_that("abuse", {

  expect_error(
    create_random_peptide_with_hydrophobicity(
      peptide_length = 1,
      min_hydrophobicity = 4.0,
      max_hydrophobicity = -4.0
    ),
    "'min_hydrophobicity' must be less than 'max_hydrophobicity'"
  )

  aas <- Peptides::aaList()
  hs <- Peptides::hydrophobicity(aas)

  expect_error(
    create_random_peptide_with_hydrophobicity(
      peptide_length = 1,
      min_hydrophobicity = min(hs) - 0.1,
      max_hydrophobicity = 0.0
    ),
    "Cannot simulate peptide below the lowest hydrophobicity"
  )
  expect_error(
    create_random_peptide_with_hydrophobicity(
      peptide_length = 1,
      min_hydrophobicity = 0.0,
      max_hydrophobicity = max(hs) + 0.1
    ),
    "Cannot simulate peptide above the heighest hydrophobicity"
  )

})
