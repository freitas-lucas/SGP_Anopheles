import os
import multiprocessing as mp

file_list = os.listdir("1-GeneFamiliesDivTime/")

def to_run(fasta_file):
	os.chdir("1-GeneFamiliesDivTime/")
	os.system("prank -d=" + str(fasta_file) + " -o=" + str(fasta_file[:-3]) + ".aln -codon -F")

pool = mp.Pool(15)
pool.map(to_run, file_list)
