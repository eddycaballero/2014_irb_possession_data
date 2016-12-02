import json
import tweepy
from db_connect import *

API_KEY = 'xtpBSreLQlZzu4ojkr2RVJDJ8'
API_SECRET = 'PdrRR9rPXDN3AZBi7mrpctTFYfDWWLSQKB6RV4mRIk65YCI2vS'
TOKEN_KEY = '518788492-rojmXRevZtHad4tpaIPGOpLfl2urHZRLdeds4USI'
TOKEN_SECRET = 'ng7mBvE3w6fUdoNudoPFzC0ZDe87pdfJIhW0A0I7qPQe3'

def get_api_instance():
  auth = tweepy.OAuthHandler(API_KEY, API_SECRET)
  auth.set_access_token(TOKEN_KEY, TOKEN_SECRET)
  api_inst = tweepy.API(auth)
  return api_inst

def do_data_pull(api_inst):

  sql_query = "select Team_Name, Team_ID from Team order by Team_Name"

  try: 
    conn = create_connection()
    db_cursor = conn.cursor()
    query_status = run_stmt(db_cursor, sql_query)
    resultset = db_cursor.fetchall()

    for record in resultset:
      team_ID = record[1]
      if record[0][-3:] == " 7s":
        team_name = record[0][:-3]
      else:
        team_name = record[0]

      team_query = "(#Rugby) AND "
      twitter_query = team_query + "'" + team_name + "'"
      print "twitter_query: " + twitter_query
      twitter_cursor = tweepy.Cursor(api_inst.search, q=twitter_query, lang="en")

      for page in twitter_cursor.pages():
        for item in page:
          json_str = json.dumps(item._json)
          print json_str
          print "found a " + team_name + " tweet"
          insert_stmt = "insert into Tweet(tweet_doc, team_ID) values(%s, %s)"
          run_prepared_stmt(db_cursor, insert_stmt, (json_str, team_ID))
          do_commit(conn)

  except pymysql.Error as error:
    is_success = False
    print "do_data_pull: " + e.strerror

api_inst = get_api_instance()
do_data_pull(api_inst)