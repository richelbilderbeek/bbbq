# Create figure 1
setwd("~/GitHubs/bbbq/scripts_3")
library(bbbq)

# The minimum length of the elute
cut_off <- 13

# Collect
df <- read.csv("epitope_table_export_1557741137.csv", skip = 1)
all_elutes <- as.character(df$Description)
n_all_elutes <- length(all_elutes); n_all_elutes
elutes <- all_elutes[ stringr::str_length(all_elutes) >= cut_off ]

if (1 == 2) {
  # Testing
  elutes <- elutes[1:5]
}

n_elutes <- length(elutes); n_elutes

fasta_filename <- system.file("extdata", "UP000001584_83332.fasta", package = "bbbq")

if (1 == 2) {
  # Testing
  fasta_filename <- system.file("extdata", "UP000001584_83332_1.fasta", package = "bbbq")
}

proteome <- epitopeome::create_locatome_cpp(fasta_filename)
df <- data.frame(name = attributes(proteome), sequence = as.character(proteome))

head(df)

sum_n_matches <- 0
sum(!is.na(stringr::str_match(string = df$sequence[1], pattern = elutes)))

for (i in seq_along(df$sequence)) {
  n_matches <- sum(
    !is.na(
      stringr::str_match(string = df$sequence[i], pattern = elutes)
    )
  )
  n_matches
  sum_n_matches <- sum_n_matches + n_matches
  print(sum_n_matches)
}
print(sum_n_matches)

dna_sequence <- ape::read.FASTA(fasta_filename, type = "AA")
dna_sequence[[1]]
image(dna_sequence)
class(dna_sequence)
dna_matrix <- ape::as.character.DNAbin(dna_sequence)
as.character(dna_matrix[1])
dna_matrix[[1]]
ape::read.FASTA()
head(df)
# Find the

filenames <- list.files(pattern = "_result\\.csv$")
alleles <- gsub("_result\\.csv$","", filenames)
alleles <- gsub("_","*", alleles)

# Check sum of amino acids
n_amino_acids_1 <- sum(utils::read.csv(filenames[1])$n)
n_amino_acids_2 <- sum(utils::read.csv(filenames[2])$n)
n_amino_acids_3 <- sum(utils::read.csv(filenames[3])$n)
testit::assert(n_amino_acids_1 == n_amino_acids_2)
testit::assert(n_amino_acids_2 == n_amino_acids_3)


# Create table for in article
df <- data.frame(
  allele = alleles,
  i = NA, m = NA, o = NA, I = NA, M = NA, O = NA
)

for (i in seq_along(filenames)) {
  df[i, 2:7] <- utils::read.csv(filenames[i])$n
}
df$allele <- as.factor(df$allele)

write.csv(df, file = "table_1.csv", row.names = FALSE)

sink("table_imoimo.latex")
print(
  xtable::xtable(
    df,
    caption = paste0(
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

# Number of amino acids
n_aas <- sum(as.numeric(df[1, ]))
n_tmh_aas <- df$m[1] + df$M[1]
f_tmh <- n_tmh_aas / n_aas

n_bound <- df$I + df$M + df$O
f_bound_tmh <- df$M / n_bound



df$perc_bound_tmh <- 100.0 * f_bound_tmh

library(ggplot2)
library(latex2exp)

# Subdivide in facets
n_facets <- 3
df$facet <- as.factor(rep(1:n_facets, each = 1 + nrow(df) / n_facets)[1:nrow(df)])

ggplot(df, aes(x = allele, y = perc_bound_tmh)) +
  geom_col(color = "black", fill = "white") +
  labs(
    title = "The location of the peptides binding to MHC2 alleles",
    caption = TeX(
      paste0(
        "Dashed horizontal line: ",
        "$\\frac{m + M}{i + m + o + I + M + O} = ",
        round(1000.0 * f_tmh) / 10.0, "%$"
      )
    )
  ) +
  ylab(TeX("$\\frac{M}{I + M + O}$ (%)")) +
  xlab("MHC-II allele") +
  geom_hline(yintercept = 100.0 * f_tmh, linetype = "dashed") +
  theme(axis.text.x = element_text(size = 8, angle = 45, hjust = 1)) +
  theme(plot.caption = element_text(hjust = 0)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  facet_wrap(. ~ facet, scales = "free_x", drop = TRUE, nrow = n_facets) +
  ggsave("figure_1.png", width = 29.7, height = 21.0, units = "cm")

