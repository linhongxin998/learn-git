def delblankline(infile, outfile):
 infopen = open(infile, 'r')
 outfopen = open(outfile, 'w')
 db = infopen.read()
 outfopen.write(db.replace(' ','\n'))
 infopen.close()
 outfopen.close()
 
delblankline("appword.txt", "appworduse.txt")