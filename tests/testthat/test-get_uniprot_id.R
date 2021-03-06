test_that("use", {
  expect_equal(get_uniprot_id("covid"), "UP000464024")
  expect_equal(get_uniprot_id("flua"), "UP000009255")
  expect_equal(get_uniprot_id("hepa"), "UP000006724")
  expect_equal(get_uniprot_id("hiv"), "UP000002241")
  expect_equal(get_uniprot_id("human"), "UP000005640")
  expect_equal(get_uniprot_id("polio"), "UP000000356")
  expect_equal(get_uniprot_id("myco"), "UP000001584")
  expect_equal(get_uniprot_id("rhino"), "UP000007070")
  expect_error(
    get_uniprot_id("nonsense"),
    "'target_name' must be a valid target"
  )
})
