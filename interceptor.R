# 1. Load required packages
library(dplyr)
library(readr)
library(openxlsx)

# 2. Read the three CSV files
df1 <- read_csv("Homoeolog.A.csv")
df2 <- read_csv("Homoeolog.B.csv")
df3 <- read_csv("Homoeolog.C.csv")

# 3. Ensure the 'sequence' column exists and is treated as a character string
df1$sequence <- as.character(df1$sequence)
df2$sequence <- as.character(df2$sequence)
df3$sequence <- as.character(df3$sequence)

# 4. Identify sequences that are present in all three files
common_seq <- Reduce(intersect, list(df1$sequence, df2$sequence, df3$sequence))

# 5. Filter each dataset to retain only rows with shared sequences
df1_common <- df1 %>% filter(sequence %in% common_seq)
df2_common <- df2 %>% filter(sequence %in% common_seq)
df3_common <- df3 %>% filter(sequence %in% common_seq)

# 6. (Optional) Merge the three datasets for comparative analysis
merged_common <- df1_common %>%
  rename_with(~ paste0(., "_f1"), -sequence) %>%
  inner_join(df2_common %>% rename_with(~ paste0(., "_f2"), -sequence), by = "sequence") %>%
  inner_join(df3_common %>% rename_with(~ paste0(., "_f3"), -sequence), by = "sequence")

# 7. Create a new Excel workbook
wb <- createWorkbook()

# 8. Add worksheets for each output
addWorksheet(wb, "Common_Sequences")
writeData(wb, "Common_Sequences", merged_common)

addWorksheet(wb, "File1_common")
writeData(wb, "File1_common", df1_common)

addWorksheet(wb, "File2_common")
writeData(wb, "File2_common", df2_common)

addWorksheet(wb, "File3_common")
writeData(wb, "File3_common", df3_common)

# 9. Save the results to an Excel file
saveWorkbook(wb, "sgRNA.xlsx", overwrite = TRUE)

# 10. Print summary information to the console
cat("✅ Excel file successfully saved as 'sgRNA.xlsx'\n")
cat("Number of sequences shared across all three files:", length(common_seq), "\n")
