test_that("use", {
  skip("Not now")
  expect_true(is_detected("VVIILTIAGNILVIMAVSLE"))
  expect_false(is_detected("AAAARTIAGRILVIMARSAA"))
})
