test_that("use", {
  expect_equal(get_target_english_name("covid"), "SARS-CoV-2")
  expect_equal(get_target_english_name("flua"), "Influenza A")
  expect_equal(get_target_english_name("hepa"), "Hepatitus A")
  expect_equal(get_target_english_name("hiv"), "HIV")
  expect_equal(get_target_english_name("human"), "Human")
  expect_equal(get_target_english_name("myco"), "MTb")
  expect_equal(get_target_english_name("polio"), "Polio")
  expect_equal(get_target_english_name("rhino"), "Rhinovirus")
  expect_error(
    get_target_english_name("nonsense"),
    "Unknown 'target_name': nonsense"
  )
})
