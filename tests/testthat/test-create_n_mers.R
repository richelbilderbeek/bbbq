test_that("use", {
  expect_silent(create_n_mers("ABC", n = 2))
})

test_that("detailed, simple protein", {
  n_mers <- create_n_mers("ABC", n = 2)
  expect_equal(length(n_mers), 2)
  expect_equal(n_mers, c("AB", "BC"))
})

test_that("detailed, SMIM11A", {
  n_mers <- create_n_mers(
    "MNWKVLEHVPLLLYILAAKTLILCLTFAGVKMYQRKRLEAKQQKLEAERKKQSEKKDN",
    n = 9
  )
  expect_equal(length(n_mers), 50)
  expect_true(all(nchar(n_mers) == 9))
})

test_that("detailed, SMIM11A topology", {
  n_mers <- create_n_mers(
    "0000000000111111111111111111111000000000000000000000000000",
    n = 9
  )
  expect_equal(length(n_mers), 50)
  expect_true(all(nchar(n_mers) == 9))
  expect_equal(29, sum(stringr::str_detect(n_mers, "1")))
})

test_that("abuse", {
  expect_error(
    create_n_mers(c("1", "2"), n = "irrelevant"),
    "'string' must be a character vector with one element"
  )
  expect_error(
    create_n_mers(c(1, 2), n = "irrelevant"),
    "'string' must be a character vector with one element"
  )
  expect_error(
    create_n_mers("ABC", n = "nonsense"),
    "'n' must be a numeric vector with one element"
  )
  expect_error(
    create_n_mers("ABC", n = c(1, 2)),
    "'n' must be a numeric vector with one element"
  )
  expect_error(
    create_n_mers("ABC", n = 123),
    "'n' must be equal or less to the number of characters in the string"
  )
})
