test_that("use", {
  figure_3_a_filename <- tempfile()
  figure_3_b_filename <- tempfile()

  hydrophobicity_distribution_elution_data(
    figure_3_a_filename = figure_3_a_filename,
    figure_3_b_filename = figure_3_b_filename
  )
  expect_true(file.exists(figure_3_a_filename))
  expect_true(file.exists(figure_3_b_filename))
})
