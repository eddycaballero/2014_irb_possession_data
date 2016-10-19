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
	team_dictionary = {'ARG':1, 'ASM':2, 'AUS':3, 'BEL':4, 'BRA':5, 'CAN':6, 'ENG':7, 'FIJ':8, 'FRA': 9, 'HKG':10, 'JPN':11, 'KEN':12, 'NZL':13, 'PNG':14, 'POR':15, 'RSA':16, 'RUS':17, 'SAM':18, 'SCO': 19, 'USA':20, 'WAL': 21, 'ZIM':22}
	

	insert_prefix = "insert into Team_Tournament (Team_ID, T_ID)" +" values ("
	tournamentList = []
	try:
		connection = create_connection()
		cursor = connection.cursor()

		csvfile = open("Possession_Data.csv", "rb")
		reader = csv.reader(csvfile)
		count = 0
		
		teamT = []

		for line in reader:

			if count == 0:
				count += 1
				continue
			else:
				insert_stmt = insert_prefix
				
				team1 = str(team_dictionary[line[4]])
				team2 = str(team_dictionary[line[5]])
				T = str(t_dictionary[line[1]])

				if team1 + T not in teamT:
					teamT.append(team1+T)
					insert_stmt += "'" + team1 + "', '" + T + "')"
				elif team2 + T not in teamT:
					teamT.append(team2+T)
					insert_stmt += "'" + team2 + "', '" + T + "')"
				else:
					continue
				
				

				insert_status = run_insert(cursor, insert_stmt)
				if insert_status is False:
					is_success = False
					return is_success




			do_commit(connection)

	except pymysql.Error as e:
		is_success = False
		print "import_Possession Error: " + e.strerror
	return is_success
				
			
				





