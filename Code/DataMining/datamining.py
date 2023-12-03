import mysql.connector
import getpass

host = input("host: ")
database = input("database: ")
username = input("username: ")
password = getpass.getpass("password: ")

db = mysql.connector.connect(
    host = host,
    user = username,
    password = password,
    database = database
)

cursor = db.cursor()

query = ("show columns from Accident")

cursor.execute(query)

for result in cursor:
    print(result)

cursor.close()
db.close()

# TODO: load relevant data into numpy array
# load data infile '/var/lib/mysql-files/NHL_356/player_info.csv' ignore into table PlayerInfo
#      fields terminated by ','
#      enclosed by '"'
#      lines terminated by '\n';

# TODO: split data into k-partitions

# TODO: train k decision trees

# TODO: validate decision trees
