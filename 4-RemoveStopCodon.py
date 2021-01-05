import os

gene_dic = {}
arquivo = open("12864_2017_3579_MOESM18_ESM.fasta", "r")
for line in arquivo:
	line = line.rstrip()
	if line.startswith(">"):
		key_name = line[1:]
		gene_dic[key_name] = ""
	else:
		gene_dic[key_name] = gene_dic[key_name] + line
    arquivo.close()

arquivo = open("12864_2017_3579_MOESM18_ESM_NoStopCodon.fasta", "w")
for key, value in gene_dic.items():
	if value.endswith("TGA") or value.endswith("TAA") or value.endswith("TAG"):
		arquivo.write(">" + str(key) + "\n" + str(value[:-3]) + "\n")
	else:
		arquivo.write(">" + str(key) + "\n" + str(value) + "\n")
arquivo.close()
