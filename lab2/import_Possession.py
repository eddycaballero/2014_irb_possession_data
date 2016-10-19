import csv
import pymysql
from db_connect import *



def import_Possession():
	is_success = True
	


	team_dictionary = {'ARG':'Argentina 7s', 'ASM':'American Samoa 7s', 'AUS':'Australia 7s', 'BEL':'Belgium 7s', 'BRA':'Brazil 7s', 'CAN':'Canada 7s', 'ENG':'England 7s', 'FIJ':'Fiji 7s', 'FRA': 'France 7s', 'HKG':'Hong Kong', 'JPN':'Japan 7s', 'KEN':'Kenya 7s', 'NZL':'New Zealand 7s', 'PNG':'Papua New Guinea', 'POR':'Portugal 7s', 'RSA':'South Africa 7s', 'RUS':'Russia 7s', 'SAM':'Samoa 7s', 'SCO': 'Scotland 7s', 'USA':'USA 7s', 'WAL': 'Wales 7s', 'ZIM':'Zimbabwe' }
	
	t_dictionary = {'HK7s':1, 'L7s':2, 'D7s':3, 'GC7s':4, 'T7s':5, 'NZ7s':6, 'S7s':7, 'PE7s':8, 'USA7s':9 }
	

	
	insert_prefix = "insert into Possession (Team_ID, Game_ID, T_Name, Origin, Start_, End_, Lost)" +" values ("

	try:
		connection = create_connection()
		cursor = connection.cursor()


		csvfile = open("Possession_Data.csv", "rb")
		reader = csv.reader(csvfile)
		
		count = 0
		Team_Name = ''
		

		for line in reader:
			if count == 0:
				count += 1
				continue
			else:
				insert_stmt = insert_prefix

				
				
				cursor.execute("SELECT Team_ID FROM Team WHERE Team_Name ='" + team_dictionary[str(line[4].strip())] + "'")
				Team_ID = cursor.fetchone()[0]
				
				cursor.execute("SELECT Game_ID FROM Game WHERE T_Game_Number = '" + line[2].strip() + "'  and  T_ID = '" + str(t_dictionary[str(line[1].strip())]) + "'")
				Game_ID = cursor.fetchone()[0]
				
				


				
				insert_stmt +=  "'"  + str(Team_ID) +  "','" + str(Game_ID) +  "','" + line[1] + "','" +  line[6] +  "','" +  line[7] +  "','" + line[8] +  "','" +  line[9] +  "'"  + (')' )
				insert_status = run_insert(cursor, insert_stmt)
				if insert_status is False:
					is_success = False
					return is_success
			do_commit(connection)
	except pymysql.Error as e:
		is_success = False
		print "import_Possession Error: " + e.strerror
	return is_success