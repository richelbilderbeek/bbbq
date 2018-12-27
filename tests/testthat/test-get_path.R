context("get_bbbq_path")

test_that("use", {

  expect_equal(
    system.file("extdata", "UP000001584_83332.fasta", package = "bbbq"),
    get_bbbq_path("UP000001584_83332.fasta")
  )

})

test_that("use", {

  expect_equal(
    get_proteome_path(),
    get_bbbq_path("UP000001584_83332.fasta")
  )

})

test_that("abuse", {

  expect_error(
    get_bbbq_path("abs.ent"),
    "'filename' must be the name of a file in 'inst/extdata'"
  )

})
