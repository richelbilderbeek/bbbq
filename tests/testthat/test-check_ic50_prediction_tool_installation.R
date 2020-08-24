test_that("use", {
  if (mhcnuggetsr::is_mhcnuggets_installed()) {
    expect_silent(check_ic50_prediction_tool_installation("mhcnuggetsr"))
  } else {
    expect_error(check_ic50_prediction_tool_installation("mhcnuggetsr"))
  }

  if (netmhc2pan::is_netmhc2pan_installed()) {
    expect_silent(check_ic50_prediction_tool_installation("netmhc2pan"))
  } else {
    expect_error(check_ic50_prediction_tool_installation("netmhc2pan"))
  }
  expect_silent(check_ic50_prediction_tool_installation("EpitopePrediction"))
  expect_error(check_ic50_prediction_tool_installation("nonsense"))
})
