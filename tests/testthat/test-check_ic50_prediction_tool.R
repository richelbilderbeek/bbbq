test_that("use", {
  expect_silent(check_ic50_prediction_tool("mhcnuggetsr"))
  expect_silent(check_ic50_prediction_tool("EpitopePrediction"))
  expect_silent(check_ic50_prediction_tool("netmhc2pan"))
  expect_error(check_ic50_prediction_tool("nonsense"))
})
