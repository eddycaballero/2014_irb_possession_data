import pymysql
from db_connect import *

def rollback_Possession():

    is_success = True
    delete_stmt = "delete from Possession"

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
        print "rollback_Possession error: " + e.strerror





    insert_stmt = "ALTER TABLE Possession AUTO_INCREMENT = 1;"
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
        print "rollback_Possession error: " + e.strerror

    return is_success