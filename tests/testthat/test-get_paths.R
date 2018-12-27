context("get_bbbq_paths")

test_that("use", {


  expect_equal(
    c(
      get_bbbq_path("UP000001584_83332.fasta"),
      get_bbbq_path("tmhmm_result.txt")
    ),
    get_bbbq_paths(c("UP000001584_83332.fasta", "tmhmm_result.txt"))
  )

})
