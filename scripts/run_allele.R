library(bbbq)
library(netmhc2pan)

args <- commandArgs(trailingOnly = TRUE)

testit::assert(length(args) == 1)
fasta_filename <- system.file("extdata", "UP000001584_83332.fasta", package = "bbbq")

# Setup
allele <- args[1]
binding_strength_threshold <- 5.0
root_folder <- path.expand("~/GitHubs/bbbq/scripts")

tmhmm_filename <- file.path(root_folder, paste0(allele, ".txt"))
netmhc2pan_filename <- file.path(root_folder, paste0(allele, ".csv"))
epitopeome_filename <- file.path(root_folder, paste0(allele, ".fasta"))
result_filename <- file.path(root_folder, paste0(allele, "_result.csv"))

# Output
print(paste("allele:", allele))
print(paste("fasta_filename:", fasta_filename))
print(paste("binding_strength_threshold:", binding_strength_threshold))
print(paste("tmhmm_filename:", tmhmm_filename))
print(paste("netmhc2pan_filename:", netmhc2pan_filename))
print(paste("epitopeome_filename:", epitopeome_filename))
print(paste("result_filename:", result_filename))

# Run
df <- bbbq::answer_bbbq(
    fasta_filename = fasta_filename,
    alleles = allele,
    binding_strength_threshold = binding_strength_threshold,
    tmhmm_filename = tmhmm_filename,
    netmhc2pan_filename = netmhc2pan_filename,
    epitopeome_filename = epitopeome_filename
)
write.csv(x = df, file = result_filename)
