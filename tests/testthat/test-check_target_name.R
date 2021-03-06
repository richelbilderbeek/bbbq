test_that("use", {
  expect_silent(check_target_name("covid"))
  expect_silent(check_target_name("flua"))
  expect_silent(check_target_name("hepa"))
  expect_silent(check_target_name("hiv"))
  expect_silent(check_target_name("human"))
  expect_silent(check_target_name("myco"))
  expect_silent(check_target_name("polio"))
  expect_silent(check_target_name("rhino"))
  expect_error(check_target_name("nonsense"))
  expect_error(check_target_name(NA))
  expect_error(check_target_name(NULL))
})
