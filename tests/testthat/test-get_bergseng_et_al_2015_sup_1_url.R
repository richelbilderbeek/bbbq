test_that("multiplication works", {
  expect_equal(
    get_bergseng_et_al_2015_sup_1_url(),
    "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4297300/bin/251_2014_819_MOESM3_ESM.xlsx" # nolint long URL indeed
  )
})
