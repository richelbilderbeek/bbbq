test_that("use", {
  skip("WIP")
  tmh_overlapping_binders_as_data_filename <- "/home/richel/GitHubs/bianchi_et_al_2017/work/tmh-overlapping-binders.Rdata" # nolint indeed a long filename
  figure_1_d_filename <- tempfile()

  expect_silent(
    correlate_to_hydrophobicity(
      tmh_overlapping_binders_as_data_filename = tmh_overlapping_binders_as_data_filename,
      figure_1_d_filename = figure_1_d_filename
    )
  )
  expect_true(file.exists(figure_1_d_filename))
})
