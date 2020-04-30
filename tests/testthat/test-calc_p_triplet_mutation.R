test_that("use", {
  skip("Not needed")
  p_one_mut <- calc_p_triplet_mutation("AAA", "AAC")
  p_two_muts <- calc_p_triplet_mutation("AAA", "ACC")
  p_three_muts <- calc_p_triplet_mutation("AAA", "CCC")
  expect_equal(p_one_mut ^ 2, p_two_mut)
  expect_equal(p_one_mut ^ 3, p_three_mut)
})
