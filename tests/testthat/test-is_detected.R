test_that("use", {

  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  expect_true(
    is_detected(
      "VVIILTIAGN",
      mhc_haplotype = mhcnuggetsr::get_mhc_1_haplotypes()[4]
    )
  )
  mhc_haplotype <-
  expect_false(
    is_detected(
      "AAAARTIAGR",
      mhc_haplotype = mhcnuggetsr::get_mhc_1_haplotypes()[20]
    )
  )
})
