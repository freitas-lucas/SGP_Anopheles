import os
import multiprocessing as mp

lista_arquivos = []
for item in os.listdir("GeneFamilies/"):
	if item.endswith(".fas"):
		lista_arquivos.append(item)
	else:
		pass

def to_run(arquivo):
	os.chdir("GeneFamilies/")
	os.system("hyphy CPU=10 gard --alignment " + str(arquivo))

pool = mp.Pool(3)
pool.map(to_run, lista_arquivos)
