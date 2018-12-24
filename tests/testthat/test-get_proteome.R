context("test-get_proteome")

test_that("use", {
  proteome <- get_proteome()
  expect_equal("list", class(proteome))
  expect_true(length(proteome) > 1)
})
