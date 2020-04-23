test_that("use", {
  skip("Proven")
  tmh_eluted_filename <- "~/GitHubs/bianchi_et_al_2017/data/TMH-Bcell-elution.txt" # nolint indeed long
  tmh_polypeptides <- utils::read.table(tmh_eluted_filename, as.is = TRUE)$V1
  expect_equal(
    get_tmh_polypeptides_from_elution(),
    tmh_polypeptides
  )
})
