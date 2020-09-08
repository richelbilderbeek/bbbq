test_that("use", {
  expect_silent(check_topology_prediction_tool("pureseqtmr"))
  expect_silent(check_topology_prediction_tool("tmhmm"))
  expect_error(check_topology_prediction_tool("nonsense"))
})
