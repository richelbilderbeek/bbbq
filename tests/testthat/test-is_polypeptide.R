test_that("use", {
  expect_true(is_polypeptide("A"))
  expect_true(is_polypeptide("AAAA"))

  expect_false(is_polypeptide(paste0(LETTERS, collapse = "")))
  expect_false(is_polypeptide(""))
  expect_false(is_polypeptide(c("A", "A")))
  expect_false(is_polypeptide(NULL))
  expect_false(is_polypeptide(NA))
  expect_false(is_polypeptide(3.14))
})
