test_that("use", {
  skip("Not now")
  expect_equal(
    are_detected(
      c(
        "VVIILTIAGNILVIMAVSLE",
        "AAAARTIAGRILVIMARSAA"
      )
    ),
    c(TRUE, FALSE)
  )
})
