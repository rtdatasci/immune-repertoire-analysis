# Setup script for installing dependencies

install.packages(c("tidyverse", "ggplot2", "immunarch", "edgeR", "Seurat"))
BiocManager::install(c("GenomicRanges"))
