import pymysql
from db_connect import *

def rollback_Game():

    is_success = True
    #safe_mode_stmt = "SET SQL_SAFE_UPDATES = 0"
    rollback_stmt = "delete from Game where Game_ID <> -1 " # had to add the last little bit to avoid MySQL's safe update mode from giving us an error

    try:
        connection = create_connection()
        cursor = connection.cursor()

        insert_status = run_insert(cursor, rollback_stmt)
        if insert_status is False:
            is_success = False
            return is_success

        commit_status = do_commit(connection)
        if commit_status is False:
            is_success = False

    except pymysql.Error as e:
        print "import_Team error: " + e.strerror

    return is_success

    insert_stmt = "ALTER TABLE Game AUTO_INCREMENT = 1;"
    try:

        connection = create_connection()
        cursor = connection.cursor()

        insert_status = run_insert(cursor, insert_stmt)
        if insert_status is False:
            is_success = False
            return is_success

        commit_status = do_commit(connection)
        if commit_status is False:
            is_success = False

    except pymysql.Error as e:
        print "rollback_Game error: " + e.strerror

    return is_success