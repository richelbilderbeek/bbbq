test_that("use", {
  t <- create_proteins_lut(get_test_covid_proteome_filename())
  expect_true("protein" %in% names(t))
  expect_true("sequence" %in% names(t))
  expect_true("protein_id" %in% names(t))
})
