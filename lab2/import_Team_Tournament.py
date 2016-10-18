import csv
import pymysql
from db_connect import *



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


def import_Team_Tournament():
	is_success = True

	t_dictionary = {'HK7s':1, 'L7s':2, 'D7s':3, 'GC7s':4, 'T7s':5, 'NZ7s':6, 'S7s':7, 'PE7s':8, 'USA7s':9 }
	insert_prefix = "insert into Team_Tournament (Team_ID, T_ID)" +" values ("
	tournamentList = []
	try:
		connection = create_connection()
		cursor = connection.cursor()

		csvfile = open("Possession_Data.csv", "rb")
		reader = csv.reader(csvfile)
		count = 0
		
		

		for line in reader:

			if count == 0:
				count += 1
				continue
			else:
				insert_stmt = insert_prefix
				

				
				
			
				print str(line[1].strip())
				cursor.execute("SELECT Team_ID FROM Possession WHERE T_Name ='" + str(line[1].strip()) + "' and Poss_ID = '" + str(1) + "' and Poss_ID = '" + str(1) + "'  ")
				Team_ID = cursor.fetchone()[0]
				count += 1
				
				

				
				insert_stmt += "'" + str(Team_ID) + "','" + str(t_dictionary[str(line[1].strip())]) +  "'"   + (')' )
				insert_status = run_insert(cursor, insert_stmt)
				if insert_status is False:
					is_success = False
					return is_success

		do_commit(connection)

	except pymysql.Error as e:
		is_success = False
		print "import_Possession Error: " + e.strerror
	return is_success
				
			
				





