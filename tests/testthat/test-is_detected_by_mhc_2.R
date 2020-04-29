test_that("use", {
  expect_true(is_detected_by_mhc_2("VVIIRTIAGRILVIMARSLE"))
  expect_false(is_detected_by_mhc_2("VRRIRRIAGRIHVIRARSHE"))
})
