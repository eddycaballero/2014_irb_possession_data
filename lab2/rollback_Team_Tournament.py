import pymysql
from db_connect import *

def rollback_Team_Tournament():

    is_success = True
    delete_stmt = "delete from Team_Tournament"

    try:

        connection = create_connection()
        cursor = connection.cursor()

        delete_status = run_delete(cursor, delete_stmt)
        if delete_status is False:
            is_success = False
            return is_success

        commit_status = do_commit(connection)
        if commit_status is False:
            is_success = False

    except pymysql.Error as e:
        print "rollback_Team_Tournament error: " + e.strerror