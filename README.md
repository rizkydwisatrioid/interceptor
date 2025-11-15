# interceptor
A lightweight R workflow for identifying shared nucleotide sequences across multiple genomic tables. It reads, filters, compares, and merges datasets, generating structured Excel outputs for downstream genomic or CRISPR analyses.

interceptor is a lightweight and streamlined R-based workflow designed to identify, extract, compare, and summarize shared nucleotide sequences across multiple genomic annotation tables. This repository provides a simple but highly practical approach for researchers working with multi-homoeolog genomic data, gene family comparisons, or CRISPR guide selection in polyploid species such as wheat. The workflow focuses on reproducibility, clarity, and ease of adaptation for different datasets, making it useful for genomics, bioinformatics, and molecular breeding applications.

The core functionality of interceptor is centered around detecting common sequences from multiple input tables—typically derived from independent gene copies or homoeologous loci. The script reads each dataset, harmonizes data types, computes sequence intersections, filters each table to retain only shared entries, and optionally merges all filtered tables into a single comparative matrix. This process is crucial for identifying conserved target sites, shared motifs, or sequence-level homology across subgenomes.

The repository also includes automated export tools using the openxlsx package, enabling users to generate a structured Excel workbook that contains: (i) a merged comparison table of shared sequences, and (ii) individual filtered tables for each original dataset. These outputs provide immediate usability for downstream CRISPR design, motif validation, or comparative genomics.

Although originally developed for analyzing candidate CRISPR guide sequences related to the wheat gene family, the workflow is fully generalizable. Users can adapt the script to any number of tables and any genomic context by simply adjusting file paths.

interceptor aims to bridge convenience and reproducibility by offering a minimal yet functional pipeline for cross-dataset sequence interception. It is particularly beneficial for researchers working in environments without full-featured bioinformatics suites or for those who prefer transparent, script-based workflows. The codebase is intentionally compact, making it easy to extend for additional analyses such as scoring, annotation enrichment, or visualization.

This repository is intended as a practical tool for geneticists, plant breeders, molecular biologists, and early-career researchers who need a dependable and customizable solution for multi-file sequence comparison.
