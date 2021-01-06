# Positive selection in Anopheline salivary glands proteins
Repository with all scripts used by Freitas &amp; Nery (under review at Genome Biology and Evolution).

## To select sequences for divergence time estimation
* [0-VectorBaseOrthologous.R](https://github.com/freitas-lucas/SGP_Anopheles/blob/main/0-VectorBaseOrthologous.R) was used to retrieve 1:1 orthologous gene families to perform the divergence time estimation for 19 *Anopheles* species and *Aedes aegypti*;
* After download transcripts for all species from [VectorBase](https://vectorbase.org), [1-OrthologousToDNA.py](https://github.com/freitas-lucas/SGP_Anopheles/blob/main/1-OrthologousToDNA.py) was used to filter a single transcript for genes with multiple transcripts;
* [2-LoopPrank.py](https://github.com/freitas-lucas/SGP_Anopheles/blob/main/2-LoopPrank.py) was used to align each gene;
* [3-LoopIQTREE.py](https://github.com/freitas-lucas/SGP_Anopheles/blob/main/3-LoopIQTREE.py) was used to reconstruct a gene tree for each gene;
* Then [SortaDate](https://github.com/FePhyFoFum/sortadate) was used to select the 50 most clock-like genes to be used by [MCMCtree](http://abacus.gene.ucl.ac.uk/software/paml.html) to perfom the divergence time estimation.

## To run orthology analyses
* [4-RemoveStopCodon.py](https://github.com/freitas-lucas/SGP_Anopheles/blob/main/4-RemoveStopCodon.py) was used to remove possible stop codons in all 824 salivary gland proteins from [Arcà *et al*. (2017)](https://bmcgenomics.biomedcentral.com/articles/10.1186/s12864-017-3579-8);
* [5-DNAtoPTN.py](https://github.com/freitas-lucas/SGP_Anopheles/blob/main/5-DNAtoPTN.py) was used to translate DNA seqs to aminoacid sequences;
* [6-SplitSequencesBySpecies.py](https://github.com/freitas-lucas/SGP_Anopheles/blob/main/6-SplitSequencesBySpecies.py) was used to split all salivary gland protein sequences by species;
* [7-GetDNAfromOrthologous.py](https://github.com/freitas-lucas/SGP_Anopheles/blob/main/7-GetDNAfromOrthologous.py) was used to create orthologous files with DNA sequence from [OrthoFinder](https://github.com/davidemms/OrthoFinder) results.

## To run positive selection analyses
* After align all sequences using [2-LoopPrank.py](https://github.com/freitas-lucas/SGP_Anopheles/blob/main/2-LoopPrank.py), [8-LoopGARD.py](https://github.com/freitas-lucas/SGP_Anopheles/blob/main/8-LoopGard.py) was used to run [GARD](https://academic.oup.com/mbe/article/23/10/1891/1096946);
* [9-LoopMEME.py](https://github.com/freitas-lucas/SGP_Anopheles/blob/main/9-LoopMEME.py) was used to run [MEME](https://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1002764);
* [10-LoopFUBAR.py](https://github.com/freitas-lucas/SGP_Anopheles/blob/main/10-LoopFUBAR.py) was used to run [FUBAR](https://academic.oup.com/mbe/article/30/5/1196/998247);
* [11-HyPhy_results.R](https://github.com/freitas-lucas/SGP_Anopheles/blob/main/11-HyPhy_results.R) was used to retrieve all results from GARD, MEME and FUBAR.
