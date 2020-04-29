test_that("use", {
  expect_true(are_detected_by_mhc_1("VVIILTIAGNILVIMAVSLE"))
  expect_false(are_detected_by_mhc_1("VVIIRTIAGRILVIMARSLE"))
})
