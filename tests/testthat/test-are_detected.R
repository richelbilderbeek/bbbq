test_that("use", {
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
