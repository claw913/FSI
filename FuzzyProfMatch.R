library(XLConnect)
library(fuzzyjoin)
library(dplyr)

# Load in Workbook
wb <- loadWorkbook("C:\\Users\\Surface\\Dropbox\\Research\\FSHC\\Data\\ProfNeedingFuzzyMatching.xlsx")

# Load in Worksheet from Faculty data set (from Salaries)
faculty_df <- readWorksheet(wb, sheet=1) 

# Load in Worksheet from Scopus with Affiliation
scopus_df <- readWorksheet(wb, sheet=3)
scopus_df$SalID

joined <- faculty_df %>%
  stringdist_inner_join(scopus_df, by = c(AdjLast = "Last"), max_dist = 1)

joined
