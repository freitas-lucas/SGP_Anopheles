# Positive selection in *Anopheles* salivary glands
Repository with all scripts used by Freitas &amp; Nery (under review at Genome Biology and Evolution).

## To select sequences for divergence time estimation
* [0-VectorBaseOrthologous.R](https://github.com/freitas-lucas/SGP_Anopheles/blob/main/0-VectorBaseOrthologous.R) was used to retrieve 1:1 orthologous gene families to perform the divergence time estimation for 19 *Anopheles* species and *Aedes aegypti*;
* After download transcripts for all species from VectorBase, [1-OrthologousToDNA.py](https://github.com/freitas-lucas/SGP_Anopheles/blob/main/1-OrthologousToDNA.py) was used to filter a single transcript for genes with multiple transcripts;
* [2-LoopPrank.py](https://github.com/freitas-lucas/SGP_Anopheles/blob/main/2-LoopPrank.py) was used to align each gene;
* [3-LoopIQTREE.py](https://github.com/freitas-lucas/SGP_Anopheles/blob/main/3-LoopIQTREE.py) was used to a gene tree for each gene;
* Then [SortaDate](https://github.com/FePhyFoFum/sortadate) was used to select the 50 most clock-like genes to be used by [MCMCtree](http://abacus.gene.ucl.ac.uk/software/paml.html) to perfom the divergence time estimation.

## Adaptive molecular evolution of salivary gland proteins
* [4-RemoveStopCodon.py](https://github.com/freitas-lucas/SGP_Anopheles/blob/main/4-RemoveStopCodon.py) was used to remove possible stop codons in all 824 salivary gland proteins from Arcà *et al*. (2017).
* Add dna to protein;
* Add protein per species (Orthofinder uses ptn alignment)
* Add other scripts
