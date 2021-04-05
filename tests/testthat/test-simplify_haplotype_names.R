test_that("use", {
  expect_silent(simplify_haplotype_names(get_mhc_haplotypes()))

  mhc1_haplotypes <- get_mhc1_haplotypes()
  for (i in seq_along(mhc1_haplotypes)) {
    mhc1_haplotype <- mhc1_haplotypes[i]
    expect_equal(i, simplify_haplotype_names(mhc1_haplotype))
  }
  mhc2_haplotypes <- get_mhc2_haplotypes()
  for (i in seq_along(mhc2_haplotypes)) {
    mhc2_haplotype <- mhc2_haplotypes[i]
    expect_equal(i, simplify_haplotype_names(mhc2_haplotype))
  }
})

test_that("create table", {
  t <- tibble::tibble(
    index = simplify_haplotype_names(get_mhc_haplotypes()),
    haplotype_name = get_mhc_haplotypes()
  )
  print(
    xtable::xtable(
      t,
      caption = paste(
        "Abbreviations of the haplotype names"
      ),
      label = "tab:haplotype_abbreviations",
      type = "latex"
    ),
    include.rownames = FALSE,
    file = "~/haplotype_abbreviations.tex"
  )
})
