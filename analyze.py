import xmltodict
import sys

with open("ResearchCompanies.xml") as fd:
	doc = xmltodict.parse(fd.read())

cmap = dict()
for co in doc["Companies"]["Company"]:
	cmap[co["Symbol"]] = co["DispName"]

file = open("report.txt")
with open("report.txt") as file:
	for line in file:
		splits = line.strip().split("|")
		stock_code = splits[0]
		roes = map(lambda x: float(x), splits[1].split(","))
		ders = map(lambda x: float(x), splits[2].split(","))
	
		skip = False
		for roe in roes:
			if roe < float(sys.argv[1]):
				skip = True
				break
	
		if skip: continue	

		skip = False
		for der in ders:
			if der > float(sys.argv[2]) or der < 0:
				skip = True
				break
	
		if skip: continue	

		print cmap[stock_code] + "|" + line.strip()
