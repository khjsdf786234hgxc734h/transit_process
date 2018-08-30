from config import db_host, db_database, db_user, db_password
from sqlalchemy import create_engine, text
import os
import csv

header = True
directory = os.path.expanduser('~') + '/transit_process/'
#sql_stop_times = 'insert into stop_times (`trip_id`,`arrival_time`,`departure_time`,`stop_id`,`stop_sequence`,`pickup_type`,`drop_off_type`,`timepoint`) values (?,?,?,?,?,?,?,?)'
sql_stop_times = 'insert into stop_times (`trip_id`,`arrival_time`,`departure_time`,`stop_id`) values (?,?,?,?)'
engine = create_engine('mysql+mysqldb://' + db_user + ':' + db_password + '@' + db_host + '/' + db_database , echo = False)
conn = engine.connect()
trans = conn.begin()
with open(directory + 'stop_times.txt', 'r') as f:
    for line in csv.reader(f):
        if header == True:
            header = False
        else:
            print(line)
            conn.execute(sql_stop_times, ['cxaa2055911', '11:07:00', '11:07:00', '104205'])
trans.commit()
conn.close()