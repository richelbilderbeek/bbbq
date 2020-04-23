test_that("use", {
  skip("Only locally for now")

  #kyte_doolittle_scale_as_data_filename <- "~/GitHubs/bianchi_et_al_2017/data/kyte.doolittle.scale.Rdata" # nolint indeed long
  tmh_eluted_filename <- "~/GitHubs/bianchi_et_al_2017/data/TMH-Bcell-elution.txt" # nolint indeed long
  non_tmh_eluted_filename <- "~/GitHubs/bianchi_et_al_2017/data/non-TMH-Bcell-elution.txt" # nolint indeed long
  figure_3_a_filename <- tempfile()
  figure_3_b_filename <- tempfile()

  hydrophobicity_distribution_elution_data(
    tmh_eluted_filename = tmh_eluted_filename,
    non_tmh_eluted_filename = non_tmh_eluted_filename,
    figure_3_a_filename = figure_3_a_filename,
    figure_3_b_filename = figure_3_b_filename
  )
  expect_true(file.exists(figure_3_a_filename))
  expect_true(file.exists(figure_3_b_filename))

})
