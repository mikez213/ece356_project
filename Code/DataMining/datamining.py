import mysql.connector
import getpass

"""
input:
vehicleType
isLeftHandDrive
engineCapacity
ageOfVehicle
sexOfDriver
ageOfDriver
driverIMD

output:
casualty level of driver
1. No casualty
2. Light
3. Serious
4. Fatal
"""

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

# TODO: split data into k-partitions

# TODO: train k decision trees

# TODO: validate decision trees
