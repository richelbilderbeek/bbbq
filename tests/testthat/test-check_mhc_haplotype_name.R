test_that("use,  EpitopePrediction", {
  expect_silent(
    check_mhc_haplotype_name(
      mhc_haplotype = get_mhc1_haplotypes()[1],
      ic50_prediction_tool = "EpitopePrediction"
    )
  )
  expect_error(
    check_mhc_haplotype_name(
      mhc_haplotype = get_mhc2_haplotypes()[1],
      ic50_prediction_tool = "EpitopePrediction"
    ),
    "not a valid EpitopePrediction haplotype name"
  )
})

test_that("use,  netmhc2pan", {

  if (!netmhc2pan::is_netmhc2pan_installed()) return()

  expect_silent(
    check_mhc_haplotype_name(
      mhc_haplotype = get_mhc2_haplotypes()[1],
      ic50_prediction_tool = "netmhc2pan"
    )
  )
  expect_error(
    check_mhc_haplotype_name(
      mhc_haplotype = get_mhc1_haplotypes()[1],
      ic50_prediction_tool = "netmhc2pan"
    ),
    "Invalid haplotype name"
  )
})

test_that("use,  mhcnuggetsr", {

  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()
  expect_silent(
    check_mhc_haplotype_name(
      mhc_haplotype = get_mhc1_haplotypes()[1],
      ic50_prediction_tool = "mhcnuggetsr"
    )
  )
  expect_silent(
    check_mhc_haplotype_name(
      mhc_haplotype = get_mhc2_haplotypes()[1],
      ic50_prediction_tool = "mhcnuggetsr"
    )
  )
})
