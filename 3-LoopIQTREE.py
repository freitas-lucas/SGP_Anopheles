import os
import multiprocessing as mp

file_list = os.listdir("2-GeneFamiliesDivTimeAligned/")

def to_run(fasta_file):
	os.chdir("2-GeneFamiliesDivTimeAligned/")
	os.system("iqtree2 -s " + str(fasta_file) + " -nt 1")

pool = mp.Pool(15)
pool.map(to_run, file_list)
