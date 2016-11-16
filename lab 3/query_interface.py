import pymysql
from db_connect import *


def print_menu():
	print "1. Show all counts of possession origins"
	print "2. Show all close games"
	print "3. Show all blowout games"
	print "4. Show all possession origins by chosen team"
	print "5. View games with chosen point differential"
	print "6. View tournaments played in by chosen team"
	print "7. View teams that played in less than four tournaments"
	print "8. View teams that played in every tournament"
	
	print "9. View teams that won a range of tournaments"
	print "10. View the winners of each tournament"
	
	print "11. Exit the program"














def possession_origin():
	
	#CREATE VIEW Possession_Origin AS
	is_success = True
	query = "SELECT Origin, count(Poss_ID) FROM Possession group by origin order by count(poss_ID) DESC"
 
	try: 
		connection = create_connection()
		cursor = connection.cursor()

		query_status = run_stmt(cursor, query)
		if query_status is False:
			is_success = False

		results = cursor.fetchall()
		print ""	
		for row in results:
			print row
		print "" 

	except pymysql.Error as e:
		is_success = False
		print "Possession Origin query failed: " + e.strerror

	return is_success



def Close_Games_Raw():
	is_success = True
	query = "drop view if exists Close_Games_Raw; CREATE VIEW Close_Games_Raw as select Team_1 as Team1,(select distinct t.Team_Name from team t inner join game g on t.Team_ID = g.Team_1 where g.Team_1 = Team1) as Team1Name, Score_1, Score_2, Team_2 as Team2, (select distinct t.Team_Name from team t inner join game g on t.Team_ID = g.Team_2 where g.Team_2 = Team2) as Team2Name from game g inner join tournament t on g.T_ID = t.T_ID where (abs(Score_1 - Score_2) < 7) order by t.T_Date;"

	try: 
		connection = create_connection()
		cursor = connection.cursor()

		query_status = run_stmt(cursor, query)
		if query_status is False:
			is_success = False

		results = cursor.fetchall()
		print ""	
		for row in results:
			print row
		print "" 

	except pymysql.Error as e:
		is_success = False
		print "Close Games Raw query failed: " + e.strerror

	return is_success



def Close_Games():
	is_success = True
	query = "SELECT Team1Name as Team_1, Score_1, Score_2, Team2Name as Team_2 from Close_Games_Raw order by abs(Score_1 - Score_2) ASC"

	try: 
		connection = create_connection()
		cursor = connection.cursor()

		query_status = run_stmt(cursor, query)
		if query_status is False:
			is_success = False

		results = cursor.fetchall()
		print ""	
		for row in results:
			print row
		print "" 

	except pymysql.Error as e:
		is_success = False
		print "Close Games query failed: " + e.strerror

	return is_success


def Blowouts_Raw():
	is_success = True
	query = "drop view if exists Blowouts_Raw; CREATE VIEW Blowouts_Raw as select Team_1 as Team1,(select distinct t.Team_Name from team t inner join game g on t.Team_ID = g.Team_1 where g.Team_1 = Team1) as Team1Name, Score_1, Score_2, Team_2 as Team2, (select distinct t.Team_Name from team t inner join game g on t.Team_ID = g.Team_2 where g.Team_2 = Team2) as Team2Name from game g inner join tournament t on g.T_ID = t.T_ID where (abs(Score_1 - Score_2) > 21) order by t.T_Date"

	try: 
		connection = create_connection()
		cursor = connection.cursor()

		query_status = run_stmt(cursor, query)
		if query_status is False:
			is_success = False

		results = cursor.fetchall()
		print ""	
		for row in results:
			print row
		print "" 

	except pymysql.Error as e:
		is_success = False
		print "Blowouts Raw query failed: " + e.strerror

	return is_success

def Blowouts():
	is_success = True
	query = "SELECT Team1Name as Team_1, Score_1, Score_2, Team2Name as Team_2 from Blowouts_Raw order by abs(Score_1 - Score_2) DESC"

	try: 
		connection = create_connection()
		cursor = connection.cursor()

		query_status = run_stmt(cursor, query)
		if query_status is False:
			is_success = False

		results = cursor.fetchall()
		print ""	
		for row in results:
			print row
		print "" 

	except pymysql.Error as e:
		is_success = False
		print "Blowouts query failed: " + e.strerror

	return is_success





def team_possesion_origin(team):

	is_success = True
	query = "SELECT t.Team_Name, origin, count(poss_ID) from Team t inner join possession p on t.Team_ID = p.Team_ID where t.Team_ID = " + str(team) + " group by p.Origin"
 
	try: 
		connection = create_connection()
		cursor = connection.cursor()

		query_status = run_stmt(cursor, query)
		if query_status is False:
			is_success = False

		results = cursor.fetchall()
		print ""	
		for row in results:
			print row
		print "" 

	except pymysql.Error as e:
		is_success = False
		print "Query failed: " + e.strerror

	return is_success


def choose_point_diff_view(num):

	is_success = True
	query = "drop view if exists Choose_Diff_Raw; create view Choose_Diff_Raw as select Team_1 as Team1,(select distinct t.Team_Name from team t inner join game g on t.Team_ID = g.Team_1 where g.Team_1 = Team1) as Team1Name, Score_1, Score_2, Team_2 as Team2, (select distinct t.Team_Name from team t inner join game g on t.Team_ID = g.Team_2 where g.Team_2 = Team2) as Team2Name from game g inner join tournament t on g.T_ID = t.T_ID where (abs(Score_1 - Score_2) <" + str(num) + ") order by t.T_Date"
 
	try: 
		connection = create_connection()
		cursor = connection.cursor()

		query_status = run_stmt(cursor, query)
		if query_status is False:
			is_success = False

		results = cursor.fetchall()
		print ""	
		for row in results:
			print row
		print "" 

	except pymysql.Error as e:
		is_success = False
		print "Query failed: " + e.strerror

	return is_success

def choose_point_diff():

	is_success = True
	query = "select Team1Name as Team_1, Score_1, Score_2, Team2Name as Team_2 from Choose_Diff_Raw order by abs(Score_1 - Score_2) ASC"
 
	try: 
		connection = create_connection()
		cursor = connection.cursor()

		query_status = run_stmt(cursor, query)
		if query_status is False:
			is_success = False

		results = cursor.fetchall()
		print ""	
		for row in results:
			print row
		print "" 

	except pymysql.Error as e:
		is_success = False
		print "Query failed: " + e.strerror

	return is_success



def tournaments_played_view():

	is_success = True
	query = "drop view if exists tournaments_played; create view Tournaments_Played as select t.team_name, tour.T_ID as Tournament_ID, (select Tournament.T_Name from Tournament where T_ID = Tournament_ID) as Tournament_Name, (select Tournament.T_Date from Tournament where T_ID = Tournament_ID) as Date from Team t left outer join Team_Tournament tour on tour.Team_ID = t.Team_ID"
 
	try: 
		connection = create_connection()
		cursor = connection.cursor()

		query_status = run_stmt(cursor, query)
		if query_status is False:
			is_success = False

		results = cursor.fetchall()
		print ""	
		for row in results:
			print row
		print "" 

	except pymysql.Error as e:
		is_success = False
		print "Query failed: " + e.strerror

	return is_success

def Tournaments_per_Team(team):
	
	is_success = True
	query = ("select Tournament_Name from Tournaments_Played where team_name = " + "\'" + str(team) + "\'")
 
	try: 
		connection = create_connection()
		cursor = connection.cursor()

		query_status = run_stmt(cursor, query)
		if query_status is False:
			is_success = False

		results = cursor.fetchall()
		print ""	
		for row in results:
			print row
		print "" 

	except pymysql.Error as e:
		is_success = False
		print "Query failed: " + e.strerror

	return is_success


def few_tournaments():

	is_success = True
	query = "Select team_name, count(*) from Tournaments_Played group by team_name having count(*) < 4"
 
	try: 
		connection = create_connection()
		cursor = connection.cursor()

		query_status = run_stmt(cursor, query)
		if query_status is False:
			is_success = False

		results = cursor.fetchall()
		print ""	
		for row in results:
			print row
		print "" 

	except pymysql.Error as e:
		is_success = False
		print "Query failed: " + e.strerror

	return is_success


def all_tournaments():

	is_success = True
	query = "select Team_Name from Tournaments_Played group by Team_Name having count(*) = 9"
 
	try: 
		connection = create_connection()
		cursor = connection.cursor()

		query_status = run_stmt(cursor, query)
		if query_status is False:
			is_success = False

		results = cursor.fetchall()
		print ""	
		for row in results:
			print row
		print "" 

	except pymysql.Error as e:
		is_success = False
		print "Query failed: " + e.strerror

	return is_success

def choose_tournament_nums(min, max):

	'MAKE SURE MAX <= 9'


	is_success = True
	query = ("select Team_Name, count(Tournament_ID) from Tournaments_Played group by Team_Name having count(*) >=" + str(min) + " and count(*) <=" +  str(max))
 
	try: 
		connection = create_connection()
		cursor = connection.cursor()

		query_status = run_stmt(cursor, query)
		if query_status is False:
			is_success = False

		results = cursor.fetchall()
		print ""	
		for row in results:
			print row
		print "" 

	except pymysql.Error as e:
		is_success = False
		print "Query failed: " + e.strerror

	return is_success


def tournament_winners_raw_view():

	is_success = True
	query = "drop view if exists Tournament_Winner_Raw; create view Tournament_Winner_Raw as select T_ID as Tournament_ID, (select Tournament.T_Name from Tournament where T_ID = Tournament_ID) as Tournament_Name, winner from game where T_Game_Number = 45"
 
	try: 
		connection = create_connection()
		cursor = connection.cursor()

		query_status = run_stmt(cursor, query)
		if query_status is False:
			is_success = False

		results = cursor.fetchall()
		print ""	
		for row in results:
			print row
		print "" 

	except pymysql.Error as e:
		is_success = False
		print "Query failed: " + e.strerror

	return is_success

def all_tournament_winners():

	is_success = True
	query = "select Tournament_Name, winner as Winner From Tournament_Winner_Raw"
 
	try: 
		connection = create_connection()
		cursor = connection.cursor()

		query_status = run_stmt(cursor, query)
		if query_status is False:
			is_success = False

		results = cursor.fetchall()
		print ""	
		for row in results:
			print row
		print "" 

	except pymysql.Error as e:
		is_success = False
		print "Query failed: " + e.strerror

	return is_success




while True:		  
	print_menu()   
	choice = input("Enter your choice [1-11]: ")
	 
	if choice==1:	 
		print "You have chosen to see the total number of each possession origin. Here are the results:"
		possession_origin()
	elif choice==2:	 
		print "You have chosen to see all the close games thoughout the tournaments. Here are the results:"
		Close_Games_Raw()
		Close_Games()
	elif choice==3:	 
		print "You have chosen to see all the blowout games thoughout the tournaments. Here are the results:"
		Blowouts_Raw()
		Blowouts()
	elif choice==4:	 
		flag = False
		print "You have chosen to see all the possession orgins by a user given team."
		print "Please choose a team from the following list by entering the corresponding number:"
		print "1. Argentina 7s"
		print "2. American Samoa 7s"
		print "3. Australia 7s"
		print "4. Belgium 7s"
		print "5. Brazil 7s"
		print "6. Canada 7s"
		print "7. England 7s"
		print "8. Fiji 7s"
		print "9. France 7s"
		print "10. Hong Kong"
		print "11. Japan 7s"
		print "12. Kenya 7s"
		print "13. New Zealand 7s"
		print "14. Papua New Guinea"
		print "15. Portugal 7s"
		print "16. South Africa 7s"
		print "17. Russia 7s"
		print "18. Samoa 7s"
		print "19. Scotland 7s"
		print "20. USA 7s"
		print "21. Wales 7s"
		print "22. Zimbabwe"

		team_choice = input("Enter your choice [1-22]: ")
		
		while not flag:
			if team_choice not in range (1,22):
				team_choice = input("Enter your choice [1-22]: ")
			else:
				flag = True

		team_possesion_origin(team_choice)

	elif choice==5:	 
		print "You have chosen to see all the games thoughout the tournaments with a user given point differential."
		point_diff = input("Enter a point differential: ")
		print "Here are your results:"
		choose_point_diff_view(point_diff)
		choose_point_diff()

	elif choice==6:	 
		flag = False
		team_dictionary = {1:'Argentina 7s', 2:'American Samoa 7s', 3:'Australia 7s', 4:'Belgium 7s', 5:'Brazil 7s', 6:'Canada 7s', 7:'England 7s', 8:'Fiji 7s', 9: 'France 7s', 10:'Hong Kong', 11:'Japan 7s', 12:'Kenya 7s', 13:'New Zealand 7s', 14:'Papua New Guinea', 15:'Portugal 7s', 16:'South Africa 7s', 17:'Russia 7s', 18:'Samoa 7s', 19: 'Scotland 7s', 20:'USA 7s', 21: 'Wales 7s', 22:'Zimbabwe' }
		print "You have chosen to see all the tournaments played in by a user given team."
		print "Please choose a team from the following list by entering the corresponding number:"
		print "1. Argentina 7s"
		print "2. American Samoa 7s"
		print "3. Australia 7s"
		print "4. Belgium 7s"
		print "5. Brazil 7s"
		print "6. Canada 7s"
		print "7. England 7s"
		print "8. Fiji 7s"
		print "9. France 7s"
		print "10. Hong Kong"
		print "11. Japan 7s"
		print "12. Kenya 7s"
		print "13. New Zealand 7s"
		print "14. Papua New Guinea"
		print "15. Portugal 7s"
		print "16. South Africa 7s"
		print "17. Russia 7s"
		print "18. Samoa 7s"
		print "19. Scotland 7s"
		print "20. USA 7s"
		print "21. Wales 7s"
		print "22. Zimbabwe"
		team_choice = input("Enter your choice [1-22]: ")
		while not flag:
			if team_choice not in range (1,22):
				team_choice = input("Enter your choice [1-22]: ")
			else:
				flag = True
		team_choice = team_dictionary[team_choice]
		print "Here are the tournaments that " + team_choice + " played in:"
		tournaments_played_view()
		Tournaments_per_Team(team_choice)


	elif choice==7:	 
		print "You have chosen to see teams that have played in less than four tournaments. Here are the results:"
		tournaments_played_view()
		few_tournaments()

	elif choice==8:	 
		print "You have chosen to see teams that have played in every tournament. Here are the results:"
		all_tournaments()

	elif choice==9:	 
		flag = False
		
		print "You have chosen to see teams that won a user entered range of tournaments."
		
		min = input('Enter a minimum: ')
		while not flag:
			if min not in range (1,9):
				min = input("Enter your choice [1-9]: ")
			else:
				flag = True
		flag1 = False
		max = input('Enter a maximum: ')
		
		while not flag1:
			if max not in range (min,10):
				max = input("Enter your choice [1-9]: ")
			else:
				flag1 = True
		
		all_tournaments()
		choose_tournament_nums(min,max)
	elif choice==10:	 
		print "You have chosen to view the winners of each tournament. Here are the results:"
		tournament_winners_raw_view()
		all_tournament_winners()
	
	
		




		


	
	elif choice==11:
		print "Goodbye!"
		break
	else:
		raw_input("Wrong choice! Try again: ")




	






