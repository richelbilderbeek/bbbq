test_that("use", {
  # Follow the BioStrings BLOSUM62 matrix
  #utils::data(BLOSUM62);
  #expect_equal(rownames(BLOSUM62), rownames(m))

  m <- get_aa_transition_matrix(transition_matrix_name = "FLU")
  expect_equal(20, nrow(m))
  expect_equal(20, ncol(m))
  expect_equal("A", colnames(m)[1])
  expect_equal("A", rownames(m)[1])
  expect_equal(m["R", "A"], 0.139, tol = 0.001)
  expect_equal(m["V", "A"], 3.532, tol = 0.001)
})

test_that("use", {
  m <- get_aa_transition_matrix(transition_matrix_name = "BLOSUM62")
  expect_equal(nrow(m), ncol(m))
  expect_equal(25, nrow(m))
})

test_that("use", {
  m <- get_aa_transition_matrix(transition_matrix_name = "BLOSUM80")
  expect_equal(nrow(m), ncol(m))
  expect_equal(25, nrow(m))
})
