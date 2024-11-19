# analyze_data.R
# This script performs immune repertoire analysis (clonotype analysis, diversity metrics)

# Load required libraries
library(tidyverse)
library(immunarch)

# Load processed data
tcr_clonotypes <- readRDS("../data/processed/tcr_clonotypes.rds")

# Clonotype frequency analysis
clonotype_freq <- freq(tcr_clonotypes)

# Diversity analysis
clonotype_diversity <- diversity(tcr_clonotypes)

# Example: Clonotype diversity summary
diversity_summary <- summary(clonotype_diversity)

# Save results
write.csv(clonotype_freq, "../results/tables/clonotype_frequencies.csv")
write.csv(diversity_summary, "../results/tables/clonotype_diversity_summary.csv")

# Message indicating completion
cat("Analysis complete. Results saved to the results folder.\n")
