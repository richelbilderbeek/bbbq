test_that("use", {
  # Copied from 'calculate_overlap'
  hlas <-  c(
    "A01-01", "A02-01",
    "A03-01", "A24-02", "A26-01",
    "B07-02", "B08-01", "B15-01", "B18-01",
    "B27-05", "B39-01", "B40-02", "B58-01"
  )
  expect_equal(
    get_hlas(),
    hlas
  )
})
