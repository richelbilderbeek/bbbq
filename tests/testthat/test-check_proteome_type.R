test_that("use", {
  expect_silent(check_proteome_type(proteome_type = "full"))
  expect_silent(check_proteome_type(proteome_type = "representative"))
  expect_error(
    check_proteome_type(proteome_type = "nonsense"),
    "Invalid 'proteome_type': nonsense"
  )
})
