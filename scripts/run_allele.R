library(bbbq)

args <- commandArgs(trailingOnly = TRUE)
testit::assert(length(args) == 2)
testit::assert(args[1] >= 1)
testit::assert(args[1] <= 3)
fasta_filename <- system.file("extdata", args[2], package = "bbbq")
testit::assert(nchar(fasta_filename) > 0)

# Setup
allele_no <- args[1]
#fasta_filename <- system.file("extdata", "UP000001584_83332.fasta", package = "bbbq")
#fasta_filename <- system.file("extdata", "UP000001584_83332_tr_I6WYT7_I6WYT7_MYCTU.fasta", package = "bbbq")
binding_strength_threshold <- 5.0
root_folder <- path.expand("~/GitHubs/bbbq/scripts")

all_alleles <- netmhc2pan::get_netmhc2pan_alleles()
alleles <- c("DRB4_0101", "HLA-DPA10103-DPB10402", "HLA-DQA10501-DQB10301")
testit::assert(all(alleles %in% all_alleles))
allele <- alleles[allele_no]

tmhmm_filename <- file.path(root_folder, paste0("allele_", allele_no, ".txt"))
netmhc2pan_filename <- file.path(root_folder, paste0("allele_", allele_no, ".csv"))
epitopeome_filename <- file.path(root_folder, paste0("allele_", allele_no, ".fasta"))
result_filename <- file.path(root_folder, paste0("allele_", allele_no, "_result.csv"))

# Output
print(paste("allele_no:", allele_no))
print(paste("allele:", allele))
print(paste("binding_strength_threshold:", binding_strength_threshold))
print(paste("tmhmm_filename:", tmhmm_filename))
print(paste("netmhc2pan_filename:", netmhc2pan_filename))
print(paste("epitopeome_filename:", epitopeome_filename))
print(paste("result_filename:", result_filename))

# Run
df <- bbbq::answer_bbbq(
    fasta_filename = fasta_filename,
    alleles = alleles[allele_no],
    binding_strength_threshold = binding_strength_threshold,
    tmhmm_filename = tmhmm_filename,
    netmhc2pan_filename = netmhc2pan_filename,
    epitopeome_filename = epitopeome_filename
)
write.csv(x = df, file = result_filename)
