#!/usr/bin/python3
# No se permiten comillas dobles en la inserción a base de datos
import os, sys, glob, datetime, string, psycopg2, psycopg2.extras, shutil, math, argparse, getpass

class Mem:
	def __init__(self):
		self.con=None

	def connect(self):
		strmq="dbname='{}' port='{}' user='{}' host='{}' password='{}'".format(args.db, args.port, args.user, args.host, password)
		try:
			self.con=psycopg2.extras.DictConnection(strmq)
		except psycopg2.Error:
			print("Error conecting database")
			sys.exit(112)
		return self.con

	def disconnect(self):
		self.con.close()

	def connection_string(self):
		return "psql://{}@{}:{}/{}".format(args.user, args.host, args.port, args.db)

class Film:
	def __init__(self, mem):
		self.mem=mem
		self.id=None
		self.savedate=None
		self.name=None
		self.foto=None
		self.pathfoto=None
		self.id_dvd=None
		self.year=None

	def init__create(self,savedate, name, pathfoto, id_dvd):
		"""Introduce pathfoto, ya que deberá luego hacer un insert, id siempre es None, year es None, pero lo parsea en la función"""
		self.savedate=savedate
		self.name=name
		self.id_dvd=id_dvd
		self.pathfoto=pathfoto
		self.parse_name()
		return self

	def init__from_db(self,row):
		self.id=row['id_films']
		self.savedate=row['savedate']
		self.name=row['name']
		self.foto=row['foto']#oid
		self.pathfoto=None
		self.id_dvd=row['id_dvd']
		self.parse_name()
		return self

	def parse_name(self):
		name=self.name
		arr=name.split(". ")
		try:
			self.year=int(arr[len(arr)-1])
			self.name=name.replace(". "+arr[len(arr)-1], "")
			if self.year<1850 or self.year>datetime.date.today().year:#Must be a film
				self.year=None
		except:
			self.year=None

	def delete(self):
		cur=self.mem.con.cursor()
		sqllo0="select lo_unlink("+str(self.foto)+");"
		cur.execute(sqllo0)
		sqldel="delete from films where id_films=" + str(self.id) + ";"
		cur.execute(sqldel)
		cur.close()

	def extract_foto(self):
		"""Extracts and assign self.pathfoto"""
		self.pathfoto='/tmp/pdffilms/{0}.jpg'.format(self.foto)
		cur=self.mem.con.cursor()
		sql="select lo_export({0}, '{1}');".format(self.foto,self.pathfoto)
		cur.execute(sql)
		cur.close()

	def tex_foto(self,width,height):
		return  "\\includegraphics[width={0}cm,height={1}cm]{{{2}.jpg}}".format(width,height,self.foto)

	def save(self):
		if self.id==None:
			if self.year==None:
				name=self.name
			else:
				name="{}. {}".format(self.name,self.year)
			cur.execute("insert into films (savedate, name, foto, id_dvd) values (%s, %s, lo_import(%s), %s) returning id_films;",(self.savedate,name,self.pathfoto, self.id_dvd))
			self.id=cur.fetchone()[0]
			return True



class SetFilms:
	def __init__(self, mem):
		self.arr=[]
		self.mem=mem

	def length(self):
		return len(self.arr)

	def load(self,sql):
		cur=self.mem.con.cursor()
		cur.execute(sql)
		for row in cur:
			self.arr.append(Film(self.mem).init__from_db(row))
		self.mem.con.commit()
		cur.close()

	def delete_all_films(self):
		for f in self.arr:
			f.delete()

	def distinct_id_dvd(self):
		"""Returns a ordered list with distinct id_dvd in the set"""
		s=set([])
		for f in self.arr:
			s.add(f.id_dvd)
		l=list(s)
		return sorted(l)


	def distinct_years(self):
		"""Returns a ordered list with distinct id_dvd in the set"""
		s=set([])
		for f in self.arr:
			s.add(str(f.year))#String para añadir None
		l=list(s)
		return sorted(l)

	def films_in_id_dvd(self, id_dvd):
		"""Returns a SetFilms with the films in a dvd and sorts them by name"""
		result=SetFilms(self.mem)
		for f in self.arr:
			if f.id_dvd==id_dvd:
				result.arr.append(f)
		result.sort_by_name()
		return result

	def films_in_year(self, year):
		"""Return a SetFilms with the filmns in a year and sorts them by name"""
		result=SetFilms(self.mem)
		for f in self.arr:
			if str(f.year)==year:
				result.arr.append(f)
		result.sort_by_name()
		return result

	def sort_by_name(self):
		self.arr=sorted(self.arr, key=lambda f: f.name, reverse=False)


def string2shell(cadena):
    cadena=cadena.replace("'","\\'")
    return cadena


def Yn(pregunta):
	ok = False
	while True:
		user_input = input(pregunta +" [Y|n]").strip().lower()
		if not user_input or user_input == 'y':
			return True
		elif user_input == 'n':
			return False
		else:
			print ("Please enter 'Y', 'n'")

def string2tex(cadena):
	cadena=cadena.replace('[','$ [ $')
	cadena=cadena.replace(']','$ ] $')
	cadena=cadena.replace('&','\&')
	cadena=cadena.replace('²','$ ^2 $')
	cadena=cadena.replace('#', '\#')
	return cadena


### MAIN SCRIPT ###
parser=argparse.ArgumentParser('Films documentation')
group = parser.add_mutually_exclusive_group()
group.add_argument('-i', '--insert', help='Insert films from current numbered directory', action="store_true")
group.add_argument('-g', '--generate', help='Generate films documentation', action="store_true")

group_db=parser.add_argument_group("Postgres database connection parameters")
group_db.add_argument('--user', help='Postgresql user', default='postgres')
group_db.add_argument('--port', help='Postgresql server port', default=5432)
group_db.add_argument('--host', help='Postgresql server address', default='127.0.0.1')
group_db.add_argument('--db', help='Postgresql database', default='pdffilms')


parser.add_argument('--output', help="Path to the output document", action="append", default=[])

args=parser.parse_args()


mem=Mem()

print("Introduzca la contraseña para {}".format(mem.connection_string()))
password=getpass.getpass()
mem.connect()
cwd=os.getcwd().split("/")
try:
	shutil.rmtree("/tmp/pdffilms")
except:
	pass
os.mkdir("/tmp/pdffilms")
os.system("chmod 777 /tmp/pdffilms")


if args.insert==True:# insertar
	try:
		id=int(cwd[len(cwd)-1])
	except:
		print ("El directorio actual no es un directorio numérico")
		sys.exit(100)

	if Yn("El identificador del dispositivo a introducir es '" +str(id) + "'. ¿Desea continuar?")==False:
		sys.exit(100)


	print ("+ Comprobando que el nombre de los videos y las imágenes tienen el formato correcto")
	for file in glob.glob( os.getcwd()+ "/*.jpg" ):
		if os.path.exists(file[:-3]+"avi")==False and os.path.exists(file[:-3]+"mpg")==False and os.path.exists(file[:-3]+"mkv")==False:
			print ("No existe un video con el mismo nombre '" +  file[:-3]+"'")
			sys.exit(100)

	sf=SetFilms(mem)
	sf.load("SELECT * FROM films WHERE id_dvd=" + str(id))

	# "Chequeando si hay registros en la base de datos del dispositivo " + str(id)
	if len(sf.arr)>0:
		if Yn("+ ¿Desea borrar los registros del dispositivo '" +str(id) + "'?")==False:
			sys.exit(100)
		else:
			print ("   - Borrando los registros...")
			sf.delete_all_films()
	cur=mem.con.cursor()
	print ("+ Insertando las peliculas en la base de datos")
	for file in glob.glob( os.getcwd()+ "/*.jpg" ):
		f=Film(mem).init__create(datetime.date.today(), file[len(os.getcwd())+1:-4], file,id)
		f.save()
		print ("    - {0}".format(file[len(os.getcwd())+1:-4]))
	cur.close()
	mem.con.commit()

elif args.generate==True:
	# SACA LAS IMÁGENES DE LA BASE DE DATOS
	print ("  - Sacando las imágenes")
	if len(args.output)==0:
		print ("    Necesita añadir al menos un documento de salida. Por ejemplo '--output peliculas.pdf'")
		sys.exit(0)
	sf=SetFilms(mem)
	sf.load("SELECT * FROM films")
	for f in sf.arr:
		f.extract_foto()

	header=""
	header = header + "\\documentclass[12pt,a4paper]{article}\n"
	header = header + "\\usepackage{pdflscape}\n"
	header = header + "\\usepackage[utf8]{inputenc}\n"
	header = header + "\\usepackage[spanish]{babel}\n"
	header = header + "\\usepackage[T1]{fontenc}\n"
	header = header + "\\usepackage{geometry}\n"
	header = header + "\\usepackage{setspace}\n"
	header = header + "\\usepackage{graphicx}\n"
	header = header + "\\usepackage{ae,aecompl}\n"
	header = header + "\\usepackage[bookmarksnumbered, colorlinks=true, linkcolor=blue, pdftitle={Listado de películas}, pdfauthor={Pelvis}, pdfkeywords={eric5}]{hyperref}\n"
	header = header + "\\geometry{verbose,a4paper}\n"
	header = header + "\\usepackage{anysize}\n"
	header = header + "\\marginsize{1.8cm}{1.3cm}{1.5cm}{1.5cm} \n"
	header = header + "\\usepackage{array}\n"
	header = header + "\\begin{document}\n"

	bd=""
	bd=bd + "\\begin{center}\n"
	bd=bd + "\\section*{Listado de películas}\n\n"
	bd=bd + "\\addcontentsline{toc}{section}{Listado de películas}\n"
	bd=bd + "Este listado tiene {0} películas y fue generado el día {1}\n".format(sf.length(), datetime.date.today())
	bd=bd + "\\end{center}\n"
	bd=bd +"\\tableofcontents{ }\n"
	bd=bd +"\\newpage\n"


	print ("  - Listado por página")
	# LISTADO DE DVD POR PAGINA
	bd = bd + "\section{Carátulas grandes}\n"
	for id_dvd in reversed(sf.distinct_id_dvd()):
		# Son necesarias las dos
		bd=bd + "\\subsection*{Índice "+str(id_dvd)+"}\n" 
		bd=bd + "\\label{{sec:{0}}}\n".format(id_dvd)
		bd=bd + "\\addcontentsline{toc}{subsection}{Índice "+str(id_dvd)+"}\n" 
		bd=bd + "\\begin{tabular}{c c}\n"
		for i, fi in enumerate(sf.films_in_id_dvd(id_dvd).arr):
			bd=bd+"\\begin{tabular}{p{7.1cm}}\n" #Tabla foto name interior
			bd=bd+ fi.tex_foto(7,7) + "\\\\\n"
			bd=bd+ string2tex(fi.name) +"\\\\\n"
			bd=bd+"\\end{tabular} &"
			if i % 2==1:
				bd=bd[:-2]+"\\\\\n"
		bd = bd + "\\end{tabular}\n"
		bd=bd +"\n\\newpage\n\n"


	print ("  - Listado de carátulas en pequeño")
	# LISTADO DE CARATULAS JUNTAS
	bd=bd + "\section{Carátulas pequeñas}\n"
	for id_dvd in reversed(sf.distinct_id_dvd()):
		bd=bd + "\\begin{tabular}{m{2.1cm} m{2.1cm} m{2.1cm} m{2.1cm} m{2.1cm} m{2.1cm} m{2.1cm}}\n"
		bd=bd + "Índice " +str(id_dvd) + " & "
		for fi in sf.films_in_id_dvd(id_dvd).arr:
			bd=bd + fi.tex_foto(2.1,2.1) + " &" 
		bd = bd[:-2]  + "\\\\\n"
		bd = bd + "\\end{tabular} \\\\\n\n"
	bd=bd +"\n\\newpage\n\n"


	print ("  - Listado ordenado alfabéticamente")
	# ORDENADAS ALFABETICAMENTE
	bd=bd + "\section{Ordenadas alfabéticamente}\n"
	sf.sort_by_name()
	for f in sf.arr:
		bd=bd + "\\subsection*{{{0}}}\n".format(string2tex(f.name))
		bd=bd + "\\addcontentsline{{toc}}{{subsection}}{{{0}}}\n".format(string2tex(f.name))
		bd=bd + "\\begin{tabular}{m{2.3cm} m{15cm}}\n"
		bd=bd + f.tex_foto(2.2,2.2) + " & ~\\nameref{{sec:{0}}}\\\\\n".format(f.id_dvd)#Reference to DVD page
		bd = bd + "\\end{tabular}\n\n"
	bd=bd +"\\newpage\n\n"


	print ("  - Listado ordenado por años")
	# ORDENADAS POR AÑO
	bd=bd + "\section{Ordenadas por año}\n"
	for year in reversed(sf.distinct_years()):
		if year=="None":
			bd=bd + "\\subsection*{Año desconocido}\n" 
			bd=bd + "\\addcontentsline{toc}{subsection}{Año desconocido}\n" 
		else:
			bd=bd + "\\subsection*{Año "+year +"}\n" 
			bd=bd + "\\addcontentsline{toc}{subsection}{Año "+year+"}\n" 
		for fi in sf.films_in_year(year).arr:
			bd=bd + "\\begin{tabular}{m{2.3cm} m{15cm}}\n"
			bd=bd + "{0} & {1}. (~\\nameref{{sec:{2}}} )\\\\\n".format(fi.tex_foto(2.2,2.2), string2tex(fi.name), fi.id_dvd)
			bd = bd + "\\end{tabular} \\\\\n\n"
		bd=bd +"\n\\newpage\n\n"

	footer=" \
	\end{document} \
	"

	doc = header + bd + footer

	d=open("/tmp/pdffilms/peliculas.tex","w")
	d.write(doc)
	d.close()

	os.system("cd /tmp/pdffilms;pdflatex /tmp/pdffilms/peliculas.tex;  &>/dev/null;pdflatex /tmp/pdffilms/peliculas.tex; pdflatex /tmp/pdffilms/peliculas.tex")
	for output in args.output:
		os.system("cp /tmp/pdffilms/peliculas.pdf {}".format(output))

else:
	parser.print_help()

mem.disconnect()

shutil.rmtree("/tmp/pdffilms")

