# Create figure 1.5
setwd("~/GitHubs/bbbq/scripts_1")

df <- read.csv(file = "table_1.csv", stringsAsFactors = FALSE)
head(df)
df$allele_full <- df$allele

df$allele <- gsub(pattern = "HLA-DPA[0-9]{5}-", replacement = "HLA-DPAx-", x = df$allele_full)
df$allele <- as.factor(df$allele)

# Number of amino acids
n_aas <- df$i[1] + df$m[1] + df$o[1] + df$I[1] + df$M[1] + df$O[1]
n_tmh_aas <- df$m[1] + df$M[1]
f_tmh <- n_tmh_aas / n_aas

n_bound <- df$I + df$M + df$O
f_bound_tmh <- df$M / n_bound



df$perc_bound_tmh <- 100.0 * f_bound_tmh

library(ggplot2)
library(latex2exp)

# Subdivide in facets
ggplot(df, aes(x = allele, y = perc_bound_tmh)) +
  geom_bar(color = "black", fill = "white", position = "dodge", stat = "summary", fun.y = "mean") +
  #geom_point(color = "black", fill = "white") +
  #geom_errorbar(stat = 'summary', width = .2) +
  #geom_errorbar() +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2) +
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
  ggsave("figure_1_5.png", width = 29.7, height = 21.0, units = "cm")

