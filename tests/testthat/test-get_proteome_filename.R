test_that("use", {

  expect_equal(
    "UP000005640.fasta",
    get_proteome_filename(
      proteome_type = "full",
      keep_selenoproteins = TRUE
    )
  )
  expect_equal(
    "UP000005640_no_u.fasta",
    get_proteome_filename(
      proteome_type = "full",
      keep_selenoproteins = FALSE
    )
  )
  expect_equal(
    "UP000005640_9606.fasta",
    get_proteome_filename(
      proteome_type = "representative",
      keep_selenoproteins = TRUE
    )
  )
  expect_equal(
    "UP000005640_9606_no_u.fasta",
    get_proteome_filename(
      proteome_type = "representative",
      keep_selenoproteins = FALSE
    )
  )
})

test_that("abuse", {
  expect_error(get_proteome(proteome_type = "nonsense"))
})
