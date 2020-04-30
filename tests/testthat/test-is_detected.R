test_that("use", {
  expect_true(is_detected("VVIILTIAGNILVIMAVSLE"))
  expect_false(is_detected("AAAARTIAGRILVIMARSAA"))
})
