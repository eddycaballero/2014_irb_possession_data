import csv
import pymysql
from db_connect import *




def import_Team():
	is_success = True

	insert_prefix = "insert into Team (Team_ID, Team_Name)" +" values ("

	try:
		connection = create_connection()
		cursor = connection.cursor()

		csvfile = open("Team_ID.csv", "rb")
		reader = csv.reader(csvfile)
		count = 0
		
		for line in reader:
			if count == 0:
				count += 1
				continue
			else:
				insert_stmt = insert_prefix
				insert_stmt += "'" + line[0] + "', '" + line[1] + "'" + (')')
				
			

			insert_status = run_insert(cursor, insert_stmt)
			if insert_status is False:
				is_success = False
				return is_success
		do_commit(connection)
	except pymysql.Error as e:
		is_success = False
		print "import_Team Error: " + e.strerror
	return is_success




		

	