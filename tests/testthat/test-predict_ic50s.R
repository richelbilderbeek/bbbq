test_that("mhcnuggets", {

  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  expect_silent(
    predict_ic50s(
      protein_sequence = "FANTASTICFAMILYVW",
      peptide_length = 9,
      haplotype = get_mhc1_haplotypes()[1],
      ic50_prediction_tool = "mhcnuggetsr"
    )
  )

  expect_silent(
    predict_ic50s(
      protein_sequence = "FANTASTICFAMILYVW",
      peptide_length = 13,
      haplotype = get_mhc2_haplotypes()[1],
      ic50_prediction_tool = "mhcnuggetsr"
    )
  )
})

test_that("EpitopePrediction", {

  expect_silent(
    predict_ic50s(
      protein_sequence = "FANTASTICFAMILYVW",
      peptide_length = 9,
      haplotype = get_mhc1_haplotypes()[1],
      ic50_prediction_tool = "EpitopePrediction"
    )
  )

  expect_error(
    predict_ic50s(
      protein_sequence = "FANTASTICFAMILYVW",
      peptide_length = 9,
      haplotype = get_mhc2_haplotypes()[1],
      ic50_prediction_tool = "EpitopePrediction"
    )
  )
})

test_that("netmhc2pan", {

  if (!netmhc2pan::is_netmhc2pan_installed()) return()

  expect_silent(
    predict_ic50s(
      protein_sequence = "FANTASTICFAMILYVW",
      peptide_length = 13,
      haplotype = get_mhc2_haplotypes()[1],
      ic50_prediction_tool = "netmhc2pan"
    )
  )

  expect_error(
    predict_ic50s(
      protein_sequence = "FANTASTICFAMILYVW",
      peptide_length = 13,
      haplotype = get_mhc1_haplotypes()[1],
      ic50_prediction_tool = "netmhc2pan"
    )
  )
})

test_that("EpitopePrediction does not support U", {

  # Error at private GitHub repo:
  # https://github.com/richelbilderbeek/bbbq_article/issues/56
  #
  # This is caused by the 'U' at the end of the sequence:
  # this amino acid is unsupported by EpitopePrediction
  expect_error(
    predict_ic50s(
      protein_sequence = "MAAMAVALRGLGGRFRWRTQAVAGGVRGAARGAAAGQRDYDLLVVGGGSGGLACAKEAAQLGRKVAVVDYVEPSPQGTRWGLGGTCVNVGCIPKKLMHQAALLGGLIQDAPNYGWEVAQPVPHDWRKMAEAVQNHVKSLNWGHRVQLQDRKVKYFNIKASFVDEHTVCGVAKGGKEILLSADHIIIATGGRPRYPTHIEGALEYGITSDDIFWLKESPGKTLVVGASYVALECAGFLTGIGLDTTIMMRSIPLRGFDQQMSSMVIEHMASHGTRFLRGCAPSRVRRLPDGQLQVTWEDSTTGKEDTGTFDTVLWAIGRVPDTRSLNLEKAGVDTSPDTQKILVDSREATSVPHIYAIGDVVEGRPELTPIAIMAGRLLVQRLFGGSSDLMDYDNVPTTVFTPLEYGCVGLSEEEAVARHGQEHVEVYHAHYKPLEFTVAGRDASQCYVKMVCLREPPQLVLGLHFLGPNAGEVTQGFALGIKCGASYAQVMRTVGIHPTCSEEVVKLRISKRSGLDPTVTGCUG", # nolint indeed long
      peptide_length = 9,
      haplotype = "HLA-A*02:01",
      ic50_prediction_tool = "EpitopePrediction"
    ),
    "'protein_sequence' contains invalid amino acids "
  )

})
