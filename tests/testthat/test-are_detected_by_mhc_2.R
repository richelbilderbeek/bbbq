test_that("use", {
  expect_true(are_detected_by_mhc_2("VVIIRTIAGRILVIMARSLE"))
  expect_false(are_detected_by_mhc_2("VRRIRRIAGRIHVIRARSHE"))
})
