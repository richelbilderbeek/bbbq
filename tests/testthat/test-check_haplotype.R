test_that("mhcnuggetsr", {
  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()
  for (haplotype in get_mhc_haplotypes()) {
    expect_silent(
      check_haplotype(
        haplotype,
        ic50_prediction_tool = "mhcnuggetsr"
      )
    )
  }
})

test_that("EpitopePrediction", {
  for (haplotype in get_mhc1_haplotypes()) {
    expect_silent(
      check_haplotype(
        haplotype,
        ic50_prediction_tool = "EpitopePrediction"
      )
    )
  }

  check_ep_haplotype_name(bbbq::to_epitope_prediction_name(haplotype))
  for (haplotype in get_mhc2_haplotypes()) {
    expect_error(
      check_haplotype(
        haplotype,
        ic50_prediction_tool = "EpitopePrediction"
      )
    )
  }
})

test_that("netmhc2pan", {

  if (!netmhc2pan::is_netmhc2pan_installed()) return()

  for (haplotype in get_mhc2_haplotypes()) {
    expect_silent(
      check_haplotype(
        haplotype,
        ic50_prediction_tool = "netmhc2pan"
      )
    )
  }

  for (haplotype in get_mhc1_haplotypes()) {
    expect_error(
      check_haplotype(
        haplotype,
        ic50_prediction_tool = "netmhc2pan"
      )
    )
  }

})
