import xmltodict
import sys

min_roe = 20.0
max_dte = 1.0

if len(sys.argv) > 1:
	min_roe = float(sys.argv[1])

if len(sys.argv) > 2:
	min_dte = float(sys.argv[2])

with open("ResearchCompanies.xml") as fd:
	doc = xmltodict.parse(fd.read())

cmap = dict()
for co in doc["Companies"]["Company"]:
	cmap[co["Symbol"]] = co["DispName"]

report = "report.txt"
if len(sys.argv) > 3:
	report = sys.argv[3]

only_increasing = False
if len(sys.argv) > 4:
	only_increasing = sys.argv[4] == "True"

print only_increasing

with open(report) as file:
	for line in file:
		splits = line.strip().split("|")
		stock_code = splits[0]
		roes = map(lambda x: float(x), splits[1].split(","))
		ders = map(lambda x: float(x), splits[2].split(","))
	
		skip = False
		for roe in roes[:-1]:
			if roe < min_roe:
				skip = True
				break
	
		if skip: continue	
	
		if only_increasing:
			skip = False
			mx = roes[0]
			for roe in roes[:-1]:
				if roe < mx:
					skip = True
					break
			if skip: continue	
		
		skip = False
		for der in ders[:-1]:
			if der > max_dte or der < 0:
				skip = True
				break
	
		if skip: continue	

		print cmap[stock_code] + "|" + line.strip()
