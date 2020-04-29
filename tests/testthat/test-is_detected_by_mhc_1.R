test_that("use", {
  expect_true(is_detected_by_mhc_1("VVIILTIAGNILVIMAVSLE"))
  expect_false(is_detected_by_mhc_1("VVIIRTIAGRILVIMARSLE"))
})
