import pymysql
from rollback_Tournament import *
from import_Tournament import *
from rollback_Team import *
from import_Team import *
from rollback_Game import *
from import_Game import *
from rollback_Possession import *
from import_Possession import *
'''
from rollback_Team_Tournament import *
from import_Team_Tournament import *


# rollback Team_Tournament table
is_success = rollback_Team_Tournament()

if is_success is True:
    print "rollback_Team_Tournament: successful"
else:
    print "rollback_Team_Tournament: failed"

'''

# rollback Possession table
is_success = rollback_Possession()

if is_success is True:
    print "rollback_Possession: successful"
else:
    print "rollback_Possession: failed"

# rollback Game table
is_success = rollback_Game()

if is_success is True:
    print "rollback_Game: successful"
else:
    print "rollback_Game: failed"

# rollback Team table
is_success = rollback_Team()

if is_success is True:
    print "rollback_Team: successful"
else:
    print "rollback_Team: failed"

# rollback Tournament table
is_success = rollback_Tournament()

if is_success is True:
    print "rollback_Tournament: successful"
else:
    print "rollback_Tournament: failed"



# populate Tournament table
is_success = import_Tournament()

if is_success is True:
    print "import_Tournament: successful"
else:
    print "import_Tournament: failed"

# populate Team table
is_success = import_Team()

if is_success is True:
    print "import_Team: successful"
else:
    print "import_Team: failed"

# populate Game table
is_success = import_Game()

if is_success is True:
    print "import_Game: successful"
else:
    print "import_Game: failed"

# populate Possession table
is_success = import_Possession()

if is_success is True:
    print "import_Possession: successful"
else:
    print "import_Possession: failed"
'''
# populate Team_Tournament table
is_success = import_Team_Tournament()

if is_success is True:
    print "import_Team_Tournament: successful"
else:
    print "import_Team_Tournament: failed"
'''