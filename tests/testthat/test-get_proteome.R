test_that("use", {

  expect_silent(
    get_proteome(
      proteome_type = "full",
      keep_selenoproteins = TRUE
    )
  )
  expect_silent(
    get_proteome(
      proteome_type = "full",
      keep_selenoproteins = FALSE
    )
  )
  expect_silent(
    get_proteome(
      proteome_type = "representative",
      keep_selenoproteins = TRUE
    )
  )
  expect_silent(
    get_proteome(
      proteome_type = "representative",
      keep_selenoproteins = FALSE
    )
  )
})

test_that("sizes", {

  expect_equal(
    nrow(
      get_proteome(
        proteome_type = "full",
        keep_selenoproteins = TRUE
      )
    ),
    75004
  )
  expect_equal(
    nrow(
      get_proteome(
        proteome_type = "full",
        keep_selenoproteins = FALSE
      )
    ),
    74979
  )
  expect_equal(
    nrow(
      get_proteome(
        proteome_type = "representative",
        keep_selenoproteins = TRUE
      )
    ),
    20600
  )
  expect_equal(
    nrow(
      get_proteome(
        proteome_type = "representative",
        keep_selenoproteins = FALSE
      )
    ),
    20575
  )
})

test_that("abuse", {

  expect_error(
    get_proteome(proteome_type = "nonsense")
  )
})
