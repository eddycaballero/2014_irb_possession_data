import csv
import pymysql


def create_connection():

	try:
		connection = pymysql.connect(host="localhost",
							user="root",
							passwd="cars101",
							db="irb2014")
		return connection

	except pymysql.Error as error:
		print "connect error: ", error

def destroy_connection(conn):
	conn.close()


def run_insert(insert_stmt):
	try:
		conn = create_connection()
		cur = conn.cursor()
		cur.execute(insert_stmt)
		conn.commit()
		destroy_connection(conn)
	except pymysql.Error as error:
		print "insert error: ", error

def SQLdate(dateString):

	date = ''
	for ch in dateString[:-1]:
		if ch != ".":
			date += ch
		else:
			date += "-"
	date += "-2014"
	datez = date[6:] + "-"+ date[3:6] + date[:2]
	return datez


def import_csv():
	t_dictionary = {'HK7s':1, 'L7s':2, 'D7s':3, 'GC7s':4, 'T7s':5, 'NZ7s':6, 'S7s':7, 'PE7s':8, 'USA7s':9 }
	insert_prefix = "insert into Team_Tournament (Team_ID, T_ID)" +" values ("
	tournamentList = []
	try:
		csvfile = open("Possession_Data.csv", "rb")
		reader = csv.reader(csvfile)
		count = 0
		
		

		for line in reader:

			if count == 0:
				count += 1
				continue
			else:
				insert_stmt = insert_prefix
				

				conn2 = create_connection()
				cur2 = conn2.cursor()
				
			
				print str(line[1].strip())
				cur2.execute("SELECT Team_ID FROM Possession WHERE T_Name ='" + str(line[1].strip()) + "' and Poss_ID = '" + str(1) + "' and Poss_ID = '" + str(1) + "'  ")
				Team_ID = cur2.fetchone()[0]
				count += 1
				
				

				
				insert_stmt += "'" + str(Team_ID) + "','" + str(t_dictionary[str(line[1].strip())]) +  "'"   + (')' )
				print insert_stmt
			
				run_insert(insert_stmt)






	except IOError as e:
		print "IO Error: " + e.strerror

import_csv()