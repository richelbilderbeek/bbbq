test_that("use", {

  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  expect_true(
    is_detected(
      "VVIILTIAGN",
      mhc_haplotype = "Eqca-101:01" # mhcnuggetsr::get_mhc_1_haplotypes()[4]
    )
  )
  expect_false(
    is_detected(
      "AAAARTIAGR",
      mhc_haplotype = "HLA-A02:16" # mhcnuggetsr::get_mhc_1_haplotypes()[20]
    )
  )
})
