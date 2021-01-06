import os
import multiprocessing as mp

lista_arquivos = []
for item in os.listdir("GeneFamilies/"):
	if item.endswith(".best-gard"):
		lista_arquivos.append(item)
	else:
		pass

def to_run(arquivo):
	os.chdir("GeneFamilies/")
	os.system("hyphy CPU=1 meme --alignment " + str(arquivo) + " --pvalue 0.05")

pool = mp.Pool(30)
pool.map(to_run, lista_arquivos)
