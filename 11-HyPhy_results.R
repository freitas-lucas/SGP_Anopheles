library(jsonlite)
library(tidyverse)
library(stringr)

### GARD results ###
json_gard_files <- list.files(path = "../7-HyPhy/GARD/", pattern = "\\.GARD.json$")

gard_table <- tibble(Gene = character(), Breakpoints = double(), Set = character())
for (arquivo in json_gard_files) {
  json_file <- fromJSON(paste0("../7-HyPhy/GARD/", arquivo), flatten = TRUE)
  breakpoints <- length(json_file$trees) - 1
  if (startsWith(arquivo, "OG00000") == TRUE) {
    gene_name <- arquivo %>% str_replace(".aln.best.fas.GARD.json", "")
    set <- "OrthoFinder"
  } else {
    gene_name <- arquivo %>% str_replace(".fa.aln.best.fas.GARD.json", "")
    set <- "ArcaRibeiro2017"
  }
  lista <- c(gene_name, breakpoints, set)
  gard_table <- gard_table %>% add_row(Gene = gene_name, Breakpoints = breakpoints, Set = set)
}

### MEME results ###
json_meme_files <- list.files(path = "../7-HyPhy/MEME/", pattern = "\\.MEME.json$")

meme_table <- tibble(`alpha;` = double(), `&beta;<sup>-</sup>` = double(), 
                     `p<sup>-</sup>` = double(), `&beta;<sup>+</sup>` = double(), 
                     `p<sup>+</sup>` = double(), `LRT` = double(), 
                     `p-value` = double(), `# branches under selection` = double(), 
                     `Total branch length` = double(), `MEME LogL` = double(), 
                     `FEL LogL` = double(), `Partition` = double(), 
                     `Gene` = character(), `Set`= character())

meme_column_name <- c("alpha;", "&beta;<sup>-</sup>", 
                      "p<sup>-</sup>", "&beta;<sup>+</sup>", 
                      "p<sup>+</sup>", "LRT", 
                      "p-value", "# branches under selection", 
                      "Total branch length", "MEME LogL", 
                      "FEL LogL", "Partition", 
                      "Gene", "Set")

for (arquivo in json_meme_files) {
  json_file <- fromJSON(paste0("../7-HyPhy/MEME/", arquivo), flatten = TRUE)
  OG_table <- tibble(`alpha;` = double(), `&beta;<sup>-</sup>` = double(), 
                     `p<sup>-</sup>` = double(), `&beta;<sup>+</sup>` = double(), 
                     `p<sup>+</sup>` = double(), `LRT` = double(), 
                     `p-value` = double(), `# branches under selection` = double(), 
                     `Total branch length` = double(), `MEME LogL` = double(), 
                     `FEL LogL` = double(), `Partition` = double(), 
                     `Gene` = character(), `Set`= character())
  for (i in 1:length(json_file$MLE$content)) {
    if (startsWith(arquivo, "OG00000") == TRUE) {
      OG_table_partition <- as_tibble(json_file$MLE$content[[i]]) %>% 
        mutate(Partition = i, Gene = arquivo %>% str_replace(".aln.best.fas.GARD.json", ""), Set = "OrthoFinder")
    } else {
      OG_table_partition <- as_tibble(json_file$MLE$content[[i]]) %>% 
        mutate(Partition = i, Gene = arquivo %>% str_replace(".fa.aln.best.fas.GARD.json", ""), Set = "ArcaRibeiro2017")
    }
    colnames(OG_table_partition) <- meme_column_name
    OG_table <- bind_rows(OG_table, OG_table_partition)
  }
  OG_table$Site <- 1:nrow(OG_table)
  meme_table <- bind_rows(meme_table, OG_table)
}

meme_ps <- meme_table %>% filter(`p-value` < 0.05)
meme_ps_curated <- meme_ps %>% 
  filter(Gene == "Ag5.fa.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(170, 220, 232, 322, 328, 336, 337, 407) |
           Gene == "Apy_5nuc.fa.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(196, 466) |
           Gene == "Apy_5nuc.fa.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(196, 466) |
           Gene == "Epoxy_hydrolase.fa.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(13, 110, 133, 201, 305) |
           Gene == "Five5_3kDa.fa.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(69, 73, 227, 282, 303, 427, 477, 497) |
           Gene == "Hyp10Hyp12.fa.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(41, 62, 99) |
           Gene == "Hyp37_7.fa.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(409, 502) |
           Gene == "Hyp42Hyp13.fa.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(19) |
           Gene == "OG0000000.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(170, 220, 232, 322, 328, 336, 337, 407) |
           Gene == "OG0000001.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(116, 185, 250, 253) |
           Gene == "OG0000002.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(274, 316, 382, 419, 422, 757, 580, 612, 624, 671) |
           Gene == "OG0000003.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(498, 502) |
           Gene == "OG0000004.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(93, 125, 126, 128, 205, 250, 265, 298, 302, 341, 377, 380) |
           Gene == "OG0000005.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(36, 80) |
           Gene == "OG0000006.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(196, 466) |
           Gene == "OG0000007.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(41, 62, 99) |
           Gene == "OG0000008.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(2, 7) |
           Gene == "OG0000009.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(151, 205, 218, 222, 232, 252) |
           Gene == "OG0000014.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(40, 43, 117, 145, 177, 354) |
           Gene == "OG0000015.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(323) |
           Gene == "OG0000016.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(226, 275, 433, 439, 460) |
           Gene == "OG0000018.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(13, 110, 133, 201, 305) |
           Gene == "OG0000020.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(177, 265, 452, 489) |
           Gene == "OG0000021.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(240, 251, 262, 319, 353) |
           Gene == "OG0000022.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(185, 301, 366, 412, 474) |
           Gene == "OG0000023_D7L3_OG34.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(114, 198, 239) |
           Gene == "OG0000023.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(198, 239) |
           Gene == "OG0000024.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(63, 531, 825, 893, 969, 1061, 1097) |
           Gene == "OG0000025.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(140, 307, 338, 463, 470, 571, 576, 647) |
           Gene == "OG0000026.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(154, 248, 259, 375, 395) |
           Gene == "OG0000027.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(113) |
           Gene == "OG0000028.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(69, 73, 227, 282, 303, 427, 477, 497) |
           Gene == "OG0000030.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(121, 124, 255) |
           Gene == "Salivary_amylase.fa.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(43, 63, 537, 827, 895, 971, 1063) |
           Gene == "Salivary_maltase.fa.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(140, 307, 338, 463, 470, 571, 576, 647) |
           Gene == "Salivary_trypXII.fa.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(122, 125, 258, 340) |
           Gene == "SalivarySerPro.fa.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(93, 125, 126, 128, 205, 250, 265, 298, 302, 341, 377, 380) |
           Gene == "SG1.fa.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(962) |
           Gene == "SG2.fa.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(2, 7) |
           Gene == "SG5.fa.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(40, 43, 117, 145, 177, 354) |
           Gene == "SG6.fa.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(113) |
           Gene == "SG7.fa.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(36, 80) |
           Gene == "SG8.fa.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(323) |
           Gene == "SG9.fa.aln.best.fas.best-gard.MEME.json" &
           Site %in% c(226, 275, 433, 439, 460))

### FUBAR results ###
json_fubar_files <- list.files(path = "../7-HyPhy/FUBAR/", pattern = "\\.FUBAR.json$")

fubar_table <- tibble(`alpha` = double(), `beta` = double(), 
                      `beta-alpha` = double(), `Prob[alpha>beta]` = double(), 
                      `Prob[alpha<beta]` = double(), `BayesFactor[alpha<beta]` = double(), 
                      `Partition` = double(), `Gene` = character(), `Set`= character())

fubar_column_name <- c("alpha", "beta", 
                       "beta-alpha", "Prob[alpha>beta]", 
                       "Prob[alpha<beta]", "BayesFactor[alpha<beta]", 
                       "Partition", "Gene", "Set")

for (arquivo in json_fubar_files) {
  json_file <- fromJSON(paste0("../7-HyPhy/FUBAR/", arquivo), flatten = TRUE)
  OG_table <- tibble(`alpha` = double(), `beta` = double(), 
                     `beta-alpha` = double(), `Prob[alpha>beta]` = double(), 
                     `Prob[alpha<beta]` = double(), `BayesFactor[alpha<beta]` = double(), 
                     `Partition` = double(), `Gene` = character(), `Set`= character())
  
  for (i in 1:length(json_file$MLE$content)) {
    if (startsWith(arquivo, "OG00000") == TRUE) {
      OG_table_partition <- as_tibble(json_file$MLE$content[[i]]) %>% select(1:6) %>%
        mutate(Partition = i, Gene = arquivo %>% str_replace(".aln.best.fas.GARD.json", ""), Set = "OrthoFinder")
    } else {
      OG_table_partition <- as_tibble(json_file$MLE$content[[i]]) %>% select(1:6) %>%
        mutate(Partition = i, Gene = arquivo %>% str_replace(".fa.aln.best.fas.GARD.json", ""), Set = "ArcaRibeiro2017")
    }
    colnames(OG_table_partition) <- fubar_column_name
    OG_table <- bind_rows(OG_table, OG_table_partition)
  }
  OG_table$Site <- 1:nrow(OG_table)
  fubar_table <- bind_rows(fubar_table, OG_table)
}

fubar_ps <- fubar_table %>% filter(`Prob[alpha<beta]` >= 0.90)
fubar_ps_curated <- fubar_ps %>%
  filter(Gene == "30kDa_Aegpytin.fa.aln.best.fas.best-gard.FUBAR.json" &
           Site %in% c(393) |
           Gene == "Apy_5nuc.fa.aln.best.fas.best-gard.FUBAR.json" &
           Site %in% c(196) |
           Gene == "cE5_anophelin.fa.aln.best.fas.best-gard.FUBAR.json" &
           Site %in% c(28) |
           Gene == "Five5_3kDa.fa.aln.best.fas.best-gard.FUBAR.json" &
           Site %in% c(73) |
           Gene == "OG0000006.aln.best.fas.best-gard.FUBAR.json" &
           Site %in% c(196) |
           Gene == "OG0000010.aln.best.fas.best-gard.FUBAR.json" &
           Site %in% c(26) |
           Gene == "OG0000011.aln.best.fas.best-gard.FUBAR.json" &
           Site %in% c(440) |
           Gene == "OG0000017.aln.best.fas.best-gard.FUBAR.json" &
           Site %in% c(28) |
           Gene == "OG0000023_D7L3_OG34.aln.best.fas.best-gard.FUBAR.json" &
           Site %in% c(154) |
           Gene == "OG0000023.aln.best.fas.best-gard.FUBAR.json" &
           Site %in% c(154) |
           Gene == "OG0000028.aln.best.fas.best-gard.FUBAR.json" &
           Site %in% c(73) |
           Gene == "OG0000031.aln.best.fas.best-gard.FUBAR.json" &
           Site %in% c(19))
