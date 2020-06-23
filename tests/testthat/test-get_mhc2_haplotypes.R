test_that("use", {
  expect_silent(get_mhc2_haplotypes())
  expect_true(length(get_mhc2_haplotypes()) > 0)
})

test_that("matches BBBQ article", {
  expect_equal(
    length(get_mhc1_haplotypes()),
    length(get_mhc2_haplotypes())
  )
})
