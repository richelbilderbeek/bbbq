test_that("use", {
  expect_equal(
    hyPref(mhc = "A02-01"),
    0.8704411,
    tol = 0.0000001
  )
})
