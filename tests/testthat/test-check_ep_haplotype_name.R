test_that("use", {
  expect_silent(
    check_ep_haplotype_name(
      mhc_1_haplotype = get_mhc1_haplotypes()[1]
    )
  )
  expect_error(check_ep_haplotype_name("nonsense"))
})
