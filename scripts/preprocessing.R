# preprocess_data.R
# This script processes raw immune repertoire data for analysis

# Load required libraries
library(tidyverse)
library(immunarch)

# Set paths for raw and processed data
raw_data_path <- "../data/raw/immune_repertoire_data.csv"
processed_data_path <- "../data/processed/cleaned_repertoire_data.csv"

# Load the raw data
raw_data <- read.csv(raw_data_path)

# Clean the data (example: filter out low-quality sequences)
clean_data <- raw_data %>%
  filter(quality > 30)  # Assuming 'quality' column exists

# Convert the cleaned data into a suitable format for immunarch (example)
tcr_data <- read.fasta("../data/raw/tcr_sequences.fasta")

# Process TCR data with immunarch
tcr_clonotypes <- repClonotype(tcr_data)

# Save cleaned data
write.csv(clean_data, processed_data_path)

# Optionally save processed TCR data
saveRDS(tcr_clonotypes, "../data/processed/tcr_clonotypes.rds")

# Message indicating completion
cat("Preprocessing complete. Cleaned data saved to:", processed_data_path, "\n")
