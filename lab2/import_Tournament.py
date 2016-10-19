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
	return dates


def import_Tournament():
	is_success = True

	insert_prefix = "insert into Tournament (T_Date, T_Name)" +" values ("
	tournamentList = []
	try:
		connection = create_connection()
		cursor = connection.cursor()

		csvfile = open("match_data.csv", "rb")
		reader = csv.reader(csvfile)
		count = 0
		t_ID = 1
		dateList = []

		for line in reader:

			if count == 0:
				count += 1
				continue
			else:
				insert_stmt = insert_prefix
				date = ''
				for ch in line[0][:-1]:
					if ch != ".":
						date += ch
					else:
						date += "-"
				date += "-2014"
				datez = date[6:] + "-"+ date[3:6] + date[:2]
				insert_stmt += "'" + datez + "', '" + line[8] + "'" + ')'

				

			if date[3:]+line[8] not in dateList:
				insert_status = run_insert(cursor, insert_stmt)
				if insert_status is False:
					is_success = False
					return is_success
				tournamentList.append(insert_stmt)
				dateList.append(date[3:]+line[8])
			do_commit(connection)



	except pymysql.Error as e:
		is_success = False
		print "import_Tournament Error: " + e.strerror

	return is_success