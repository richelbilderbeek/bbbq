test_that("use", {
  expect_silent(
    check_mhc_1_haplotype_name(
      mhc_1_haplotype = get_mhc1_haplotypes()[1]
    )
  )
  expect_error(check_mhc_1_haplotype_name("nonsense"))
})
