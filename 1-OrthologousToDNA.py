import os

# A DNA fasta dic for all species
main_dic_DNA = {}
for item in os.listdir("0-Genomes/"):
	if item.endswith(".fa"):
		arquivo = open("0-Genomes/" + str(item), "r")
		for line in arquivo:
			line = line.rstrip()
			if line.startswith(">"):
				key_name = line[1:14]
				main_dic_DNA[key_name] = ""
			else:
				main_dic_DNA[key_name] = main_dic_DNA[key_name] + line
		arquivo.close()
	else:
		pass

arquivo = open("MainOrthoTable.tab", "r")
count = 0
for line in arquivo:
	if line.startswith("Gene stable ID"):
		pass
	else:
		count += 1
		new_arquivo_dna = open("OG" + str(count) + "_dna.fasta", "w")
		line = line.split()
		for item in line:
			try:
				key_name_dna = item + str("-RA")
				new_arquivo_dna.write(">" + str(key_name_dna) + "\n" + str(main_dic_DNA[key_name_dna]) + "\n")
			except:
				try:
					key_name_dna = item + str("-RB")
					new_arquivo_dna.write(">" + str(key_name_dna) + "\n" + str(main_dic_DNA[key_name_dna]) + "\n")
				except:
					try:
						key_name_dna = item + str("-RC")
						new_arquivo_dna.write(">" + str(key_name_dna) + "\n" + str(main_dic_DNA[key_name_dna]) + "\n")
					except:
						try:
							key_name_dna = item + str("-RD")
							new_arquivo_dna.write(">" + str(key_name_dna) + "\n" + str(main_dic_DNA[key_name_dna]) + "\n")
						except:
							try:
								key_name_dna = item + str("-RE")
								new_arquivo_dna.write(">" + str(key_name_dna) + "\n" + str(main_dic_DNA[key_name_dna]) + "\n")
							except:
								key_name_dna = item + str("-RF")
								new_arquivo_dna.write(">" + str(key_name_dna) + "\n" + str(main_dic_DNA[key_name_dna]) + "\n")
		new_arquivo_dna.close()
arquivo.close()
