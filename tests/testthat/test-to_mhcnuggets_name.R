test_that("all BBBQ names are proper mhcnuggetsr names", {
  for (haplotype_name in bbbq::get_mhc1_haplotypes()) {
    mhcnuggets_name <- mhcnuggetsr::to_mhcnuggets_name(haplotype_name)
    expect_true(mhcnuggets_name %in% mhcnuggetsr::get_mhc_1_haplotypes())
  }
  for (haplotype_name in bbbq::get_mhc2_haplotypes()) {
    mhcnuggets_name <- mhcnuggetsr::to_mhcnuggets_name(haplotype_name)
    expect_true(mhcnuggets_name %in% mhcnuggetsr::get_mhc_2_haplotypes())
  }
})
