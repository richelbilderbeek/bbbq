filenames <- paste0("allele_", seq(1, 3), "_result.csv")

filename <- filenames[1]

# Check sum of amino acids
n_amino_acids_1 <- sum(utils::read.csv(filenames[1])$n)
n_amino_acids_2 <- sum(utils::read.csv(filenames[2])$n)
n_amino_acids_3 <- sum(utils::read.csv(filenames[3])$n)
testit::assert(n_amino_acids_1 == n_amino_acids_2)
testit::assert(n_amino_acids_2 == n_amino_acids_3)


# Create table for in article
df <- data.frame(
  allele = c("DRB4*0101", "HLA-DPA10103-DPB10402", "DQA1*0501/DQB1*0301"),
  i = NA, m = NA, o = NA, I = NA, M = NA, O = NA
)

for (i in seq_along(filenames)) {
  df[i, 2:7] <- utils::read.csv(filenames[i])$n
}

sink("table_imoimo.latex")
print(
  xtable::xtable(
    df,
    caption = paste0(
      "\\richel{These are preliminary, 6 percent of proteome} ",
      "Location and binding of amino acids for the alleles. ",
      "i: non-binding and inside, ",
      "m: non-binding and transmembrane, ",
      "o: non-binding and outside, ",
      "I: binding and inside, ",
      "M: binding and transmembrane, ",
      "O: binding and outside"
    ),
    label = "tab:results"
  ),
  include.rownames=FALSE
)
sink()




