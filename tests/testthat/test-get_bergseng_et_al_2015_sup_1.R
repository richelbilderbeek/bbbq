test_that("use", {
  t <- get_bergseng_et_al_2015_sup_1()
  expect_true(tibble::is_tibble(t))
  expected_names <- c(
    "Peptide number",
    "Sequence",
    "Length",
    "Mass",
    "Proteins"
  )
  expect_equal(names(t)[1:5], expected_names)
})
