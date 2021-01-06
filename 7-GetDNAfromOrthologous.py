import os

dic_824_seqs_AR2017 = {}
arquivo = open("12864_2017_3579_MOESM18_ESM_NoStopCodon.fasta", "r")
for line in arquivo:
	line = line.rstrip()
	if line.startswith(">"):
		key_name = line[1:]
		dic_824_seqs_AR2017[key_name] = ""
	else:
		dic_824_seqs_AR2017[key_name] = dic_824_seqs_AR2017[key_name] + line
arquivo.close()

for item in os.listdir("OrthoFinder_results/"):
	arquivo = open("OrthoFinder_results/" + str(item), "r")
	new_arquivo = open("DNA_orthologous/" + str(item), "w")
	for line in arquivo:
		line = line.rstrip()
		if line.startswith(">"):
			seq_ID = line[1:]
			new_arquivo.write(">" + str(seq_ID) + "\n" + str(dic_824_seqs_AR2017[seq_ID]) + "\n")
		else:
			pass
	new_arquivo.close()
	arquivo.close()
