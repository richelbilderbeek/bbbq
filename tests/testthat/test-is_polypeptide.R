test_that("use", {
  expect_true(is_peptide("A"))
  expect_true(is_peptide("AAAA"))

  expect_false(is_peptide(paste0(LETTERS, collapse = "")))
  expect_false(is_peptide(""))
  expect_false(is_peptide(c("A", "A")))
  expect_false(is_peptide(NULL))
  expect_false(is_peptide(NA))
  expect_false(is_peptide(3.14))
})
