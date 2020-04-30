test_that("use", {
  expect_equal("XBC", replace_nth_char("ABC", 1, "X"))
  expect_equal("AXC", replace_nth_char("ABC", 2, "X"))
  expect_equal("ABX", replace_nth_char("ABC", 3, "X"))
})
