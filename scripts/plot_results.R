# plot_results.R
# This script generates visualizations from immune repertoire analysis

# Load required libraries
library(ggplot2)
library(immunarch)

# Load processed data
clonotype_freq <- read.csv("../results/tables/clonotype_frequencies.csv")
clonotype_diversity <- read.csv("../results/tables/clonotype_diversity_summary.csv")

# Clonotype frequency plot
ggplot(clonotype_freq, aes(x = clonotype, y = frequency)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Clonotype Frequency", x = "Clonotype", y = "Frequency") +
  ggsave("../results/figures/clonotype_frequency_plot.png")

# Clonotype diversity histogram
ggplot(clonotype_diversity, aes(x = diversity_index)) +
  geom_histogram(binwidth = 0.1, fill = "blue", color = "black") +
  theme_minimal() +
  labs(title = "Clonotype Diversity", x = "Diversity Index", y = "Frequency") +
  ggsave("../results/figures/clonotype_diversity_histogram.png")

# Message indicating completion
cat("Plots generated and saved to the results folder.\n")
