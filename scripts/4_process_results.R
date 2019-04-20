# Create figure 2
setwd("~/GitHubs/bbbq/scripts")

library(ggplot2)

filenames <- list.files(pattern = ".*\\.fasta$")

if (1 == 2) {
  # Testing
  filenames <- filenames[1:2]

  filenames <- c(
    system.file("extdata", "DRB1_0101_epitopeome_1.fasta", package = "bbbq"),
    system.file("extdata", "DRB1_0301_epitopeome_1.fasta", package = "bbbq")
  )
}

df_all <- data.frame(
  allele = NULL,
  distance = NULL,
  f = NULL
)

for (filename in filenames) {
  print("Filename")
  allele <- gsub("\\.fasta$","", basename(filename))
  save_filename <- paste0(allele, ".png")
  epitopeome <- readLines(con = filename)
  dist_bind_map <- epitopeome::calc_binding_freqs(epitopeome)

  df <- data.frame(
    distance = as.numeric(names(dist_bind_map)),
    f = 100.0 * as.numeric(dist_bind_map)
  )
  df <- df[df$distance > -30 & df$distance < 30, ]

  df$allele <- allele

  df_all <- rbind(df_all, df)
}


# TMH is 23 residues, distances are thus -11.5, 11.5
ggplot2::ggplot(df_all, aes(x = distance, y = f)) +
  geom_rect(
    xmin = -11.5,
    xmax = 11.5,
    ymin = 0.0,
    ymax = 100.0,
    alpha = 0.2,
    fill = "yellow",
    color = "yellow"
  ) + geom_area(fill = "grey") +
  ylab("% epitopes") +
  xlab("Distance to transmembrane helix (amino acids)") +
  ggplot2::theme(
    panel.background = element_rect(fill = "white", colour = "white")
  ) +
  theme(plot.title = element_text(hjust = 0.5)) + facet_wrap(allele ~ ., nrow = 16) +
  ggsave("figure_3.png", width = 21.0, height = 29.7, units = "cm")
