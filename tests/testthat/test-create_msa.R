test_that("use", {
  protein_sequences <- c(
    "IMPRESSIVELYFLIFAWAYFANSWALKSWEETMARKETTRIVIALLYNAILIDENTIFY",
     "MPRESSIVELYFLIAAWAYFANSWALKSWEETMARKETTRIVIALLYNAILIDENTIFY",
     "IMPRESSIVELYFLMTAWAYFANSWALKSWEETMARKETTRIVIALLYNAILIDENTIF"
  )
  library(msa)
  msa <- create_msa(
    protein_sequences,
    msa_method = "ClustalOmega",
    msa_subst_matrix = "BLOSUM80"
  )
  expect_true(is.character(msa@version))
})
