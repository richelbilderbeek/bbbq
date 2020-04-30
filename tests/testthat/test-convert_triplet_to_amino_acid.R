test_that("use", {
  expect_equal(convert_triplet_to_amino_acid("GCT"), "A")
  expect_equal(convert_triplet_to_amino_acid("GCC"), "A")
  expect_equal(convert_triplet_to_amino_acid("GCA"), "A")
  expect_equal(convert_triplet_to_amino_acid("GCG"), "A")
})
