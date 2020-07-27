test_that("use", {
  proteome_filename <- get_covid_proteome_filename()
  expect_true(file.exists(proteome_filename))
})
