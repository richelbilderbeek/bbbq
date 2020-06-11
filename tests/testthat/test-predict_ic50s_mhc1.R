test_that("use", {

  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  n_aas <- 9
  df <- predict_ic50s_mhc1(
    protein_sequence = "VVIILTIAGNILVIMAVSLE",
    mhc_1_haplotype = get_mhc1_haplotypes()[1],
    n_aas = n_aas,
    tool = "ep"
  )
  expect_true("peptide" %in% names(df))
  expect_true("ic50" %in% names(df))
  expect_true(all(nchar(df$peptide) == n_aas))

})

test_that("use", {

  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  n_aas <- 9
  df <- predict_ic50s_mhc1(
    protein_sequence = "VVIILTIAGNILVIM",
    mhc_1_haplotype = get_mhc1_haplotypes()[1],
    n_aas = n_aas,
    tool = "mhcn"
  )
  df
  expect_true("peptide" %in% names(df))
  expect_true("ic50" %in% names(df))
  expect_true(all(nchar(df$peptide) == n_aas))

})
