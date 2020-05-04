test_that("use", {
  expect_true(is_polypeptide(create_random_tmh(20)))
  expect_true(is_tmh(create_random_tmh(20)))
})
