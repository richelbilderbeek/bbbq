# Create figure 2
setwd("~/GitHubs/bbbq/scripts")

filenames <- list.files(pattern = ".*\\.fasta$")
filenames <- filenames[1]

for (filename in filenames) {
  allele <- gsub("\\.fasta$","", filename)
  epitopeome <- readLines(con = filename)
  epitopeome <- epitopeome[20:30]
  dist_bind_map <- epitopeome::calc_binding_freqs(epitopeome)
  dist_bind_map
}
HIERO
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
  theme(axis.text.x = element_text(size = 4, angle = 45, hjust = 1)) +
  theme(plot.caption = element_text(hjust = 0)) +
  theme(plot.title = element_text(hjust = 0.5)) + ggsave("figure_1.png")

