import csv
import pymysql
from db_connect import *






def import_Game():
	is_success = True
	connection = create_connection()
	cursor = connection.cursor()

	insert_prefix = "insert into Game (T_ID, Team_1, Team_2,T_Game_Number, Game_Time, Score_1, Score_2, Winner)" +" values ("
	
	try:
		csvfile = open("Match_Data.csv", "rb")
		reader = csv.reader(csvfile)
		count = 0
		
		

		for line in reader:

			if count == 0:
				count += 1
				continue
			else:
				insert_stmt = insert_prefix
				

				
				
				cursor.execute("SELECT Team_ID FROM Team WHERE Team_Name ='" + line[2].strip() + "'")
				Team_1 = cursor.fetchone()[0]
				cursor.execute("SELECT Team_ID FROM Team WHERE Team_Name ='" + line[3].strip() + "'")
				Team_2 = cursor.fetchone()[0]
				cursor.execute("SELECT T_ID FROM Tournament WHERE T_Name ='" + line[8].strip() + "'")
				T_ID = cursor.fetchone()[0]


				insert_stmt += "'" + str(T_ID) +  "', '"  + str(Team_1)+  "', '"  + str(Team_2)+  "', '"  + str(line[7])  +  "', '"   + line[1]+  "', '"  + line[5]+  "', '"  + line[6]+ "', '"  + line[4]+  "'"   + (')' )

			
				insert_status = run_insert(cursor, insert_stmt)
				if insert_status is False:
					is_success = False
					return is_success
		do_commit(connection)
	except pymysql.Error as e:
		is_success = False
		print "import_Team Error: " + e.strerror
	return is_success



