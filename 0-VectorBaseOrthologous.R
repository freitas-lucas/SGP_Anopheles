library(tidyverse)

# Read tables, remove NA and duplicates
table1 <- read_tsv("martquery_0514205550_647.txt") %>%
  drop_na() %>% group_by(`Gene stable ID`) %>% filter(n() == 1) %>% ungroup() %>% 
  group_by(`Anopheles albimanus gene stable ID`) %>% filter(n() == 1) %>% ungroup() %>% 
  group_by(`Anopheles arabiensis gene stable ID`) %>% filter(n() == 1) %>% ungroup() %>% 
  group_by(`Anopheles atroparvus gene stable ID`) %>% filter(n() == 1) %>% ungroup() %>% 
  group_by(`Anopheles christyi gene stable ID`) %>% filter(n() == 1) %>% ungroup() %>% 
  group_by(`Anopheles coluzzii gene stable ID`) %>% filter(n() == 1) %>% ungroup() %>% 
  group_by(`Anopheles culicifacies gene stable ID`) %>% filter(n() == 1) %>% ungroup()
  
table2 <- read_tsv("martquery_0514205624_203.txt") %>%
  drop_na() %>% group_by(`Gene stable ID`) %>% filter(n() == 1) %>% ungroup() %>% 
  group_by(`Anopheles darlingi gene stable ID`) %>% filter(n() == 1) %>% ungroup() %>% 
  group_by(`Anopheles dirus gene stable ID`) %>% filter(n() == 1) %>% ungroup() %>% 
  group_by(`Anopheles epiroticus gene stable ID`) %>% filter(n() == 1) %>% ungroup() %>% 
  group_by(`Anopheles farauti gene stable ID`) %>% filter(n() == 1) %>% ungroup() %>% 
  group_by(`Anopheles funestus gene stable ID`) %>% filter(n() == 1) %>% ungroup() %>% 
  group_by(`Anopheles maculatus gene stable ID`) %>% filter(n() == 1) %>% ungroup()

table3 <- read_tsv("martquery_0514205704_649.txt") %>%
  drop_na() %>% group_by(`Gene stable ID`) %>% filter(n() == 1) %>% ungroup() %>% 
  group_by(`Anopheles melas gene stable ID`) %>% filter(n() == 1) %>% ungroup() %>% 
  group_by(`Anopheles merus gene stable ID`) %>% filter(n() == 1) %>% ungroup() %>% 
  group_by(`Anopheles minimus gene stable ID`) %>% filter(n() == 1) %>% ungroup() %>% 
  group_by(`Anopheles quadriannulatus gene stable ID`) %>% filter(n() == 1) %>% ungroup() %>% 
  group_by(`Anopheles sinensis gene stable ID`) %>% filter(n() == 1) %>% ungroup() %>% 
  group_by(`Anopheles stephensi gene stable ID`) %>% filter(n() == 1) %>% ungroup()

table4 <- read_tsv("martquery_0515223629_220.txt") %>%
  select(-c(`Drosophila melanogaster gene stable ID`)) %>%
  drop_na() %>% group_by(`Gene stable ID`) %>% filter(n() == 1) %>% ungroup() %>% 
  group_by(`Aedes aegypti (LVP_AGWG) gene stable ID`) %>% filter(n() == 1) %>% ungroup()

# Join all tables
main_table <- table1 %>% inner_join(table2, by = "Gene stable ID") %>% 
  inner_join(table3, by = "Gene stable ID") %>% inner_join(table4, by = "Gene stable ID")

# Check duplicates
for (i in colnames(main_table)) {
  print(i)
  print(length(main_table[[i]]))
  print(length(unique(main_table[[i]])))
}

# Write orthology table
write_tsv(main_table, path = "MainOrthoTable.tab")
