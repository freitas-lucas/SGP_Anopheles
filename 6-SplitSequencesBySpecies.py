# Main dic (824) seqs
main_dic = {}

arquivo = open("12864_2017_3579_MOESM18_ESM_PTN.fasta", "r")
for line in arquivo:
	line = line.rstrip()
	if line.startswith(">"):
		key_name = line[1:]
		main_dic[key_name] = ""
	else:
		main_dic[key_name] = main_dic[key_name] + line
arquivo.close()

for key, value in main_dic.items():
	if "anoga" in key:
		gene = open("anoga.fasta", "a")
		gene.write(">" + str(key) + "\n" + str(value) + "\n")
		gene.close()
	elif "anocol" in key:
		gene = open("anocol.fasta", "a")
		gene.write(">" + str(key) + "\n" + str(value) + "\n")
		gene.close()
	elif "anoara" in key:
		gene = open("anoara.fasta", "a")
		gene.write(">" + str(key) + "\n" + str(value) + "\n")
		gene.close()
	elif "anoqua" in key:
		gene = open("anoqua.fasta", "a")
		gene.write(">" + str(key) + "\n" + str(value) + "\n")
		gene.close()
	elif "anomer" in key:
		gene = open("anomer.fasta", "a")
		gene.write(">" + str(key) + "\n" + str(value) + "\n")
		gene.close()
	elif "anomel" in key:
		gene = open("anomel.fasta", "a")
		gene.write(">" + str(key) + "\n" + str(value) + "\n")
		gene.close()
	elif "anochris" in key:
		gene = open("anochris.fasta", "a")
		gene.write(">" + str(key) + "\n" + str(value) + "\n")
		gene.close()
	elif "anoepi" in key:
		gene = open("anoepi.fasta", "a")
		gene.write(">" + str(key) + "\n" + str(value) + "\n")
		gene.close()
	elif "anofun" in key:
		gene = open("anofun.fasta", "a")
		gene.write(">" + str(key) + "\n" + str(value) + "\n")
		gene.close()
	elif "anomin" in key:
		gene = open("anomin.fasta", "a")
		gene.write(">" + str(key) + "\n" + str(value) + "\n")
		gene.close()
	elif "anocul" in key:
		gene = open("anocul.fasta", "a")
		gene.write(">" + str(key) + "\n" + str(value) + "\n")
		gene.close()
	elif "anoste" in key:
		gene = open("anoste.fasta", "a")
		gene.write(">" + str(key) + "\n" + str(value) + "\n")
		gene.close()
	elif "anomac" in key:
		gene = open("anomac.fasta", "a")
		gene.write(">" + str(key) + "\n" + str(value) + "\n")
		gene.close()
	elif "anofar" in key:
		gene = open("anofar.fasta", "a")
		gene.write(">" + str(key) + "\n" + str(value) + "\n")
		gene.close()
	elif "anodir" in key:
		gene = open("anodir.fasta", "a")
		gene.write(">" + str(key) + "\n" + str(value) + "\n")
		gene.close()
	elif "anoatro" in key:
		gene = open("anoatro.fasta", "a")
		gene.write(">" + str(key) + "\n" + str(value) + "\n")
		gene.close()
	elif "anosin" in key:
		gene = open("anosin.fasta", "a")
		gene.write(">" + str(key) + "\n" + str(value) + "\n")
		gene.close()
	elif "anoalb" in key:
		gene = open("anoalb.fasta", "a")
		gene.write(">" + str(key) + "\n" + str(value) + "\n")
		gene.close()
	elif "anodar" in key:
		gene = open("anodar.fasta", "a")
		gene.write(">" + str(key) + "\n" + str(value) + "\n")
		gene.close()
