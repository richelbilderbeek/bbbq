test_that("use, human", {

  skip("Local only")

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

test_that("only humans have a representative proteome", {
  expect_error(
    get_proteome(
      target_name = "covid",
      proteome_type = "representative"
    ),
    "Only for target_name 'human' the proteome_type can be 'representative'"
  )
})

test_that("use, other targets", {
  skip("Local only")
  expect_silent(get_proteome(target_name = "covid"))
  expect_silent(get_proteome(target_name = "flua"))
  expect_silent(get_proteome(target_name = "hepa"))
  expect_silent(get_proteome(target_name = "hiv"))
  expect_silent(get_proteome(target_name = "myco"))
  expect_silent(get_proteome(target_name = "polio"))
  expect_silent(get_proteome(target_name = "rhino"))
})

test_that("use, all targets", {
  skip("Local only")
  # Just to check I missed a target
  for (target_name in get_target_names()) {
    expect_silent(get_proteome(target_name = target_name))
  }
})

test_that("all targets have no selenoproteins", {
  skip("Local only")
  for (target_name in get_target_names()) {
    t <- get_proteome(target_name = target_name, keep_selenoproteins = FALSE)
    indices <- stringr::str_which(t$sequence, pattern = "U")
    expect_equal(indices, integer(0))
  }
})

test_that("sizes, human", {

  skip("Local only")

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

test_that("show URL when verbose", {

  skip("Local only")

  expect_message(
    get_proteome(verbose = TRUE),
    "Proteome already downloaded at|Downloading proteome from URL"
  )
})

test_that("abuse", {

  expect_error(
    get_proteome(proteome_type = "nonsense")
  )
})
