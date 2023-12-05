import mysql.connector
import getpass
import pandas
from sklearn.model_selection import train_test_split
from sklearn import tree
from sklearn import metrics

"""
input:
vehicleType
vehicleManouevre
vehicleLocationRestrictedLane
vehicleLocationJunction
skiddingAndOverturning
vehicleLeavingCarriageway
firstPointOfImpact
driverPosition
ageOfVehicle
sexOfDriver
ageOfDriver
propulsionType
driverIMDDecile
driverHomeAreaType

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

# Query database for dataset
db = mysql.connector.connect(
    host = host,
    user = username,
    password = password,
    database = database
)

features = [
    "numberOfVehicles",
    "lightConditions",
    "weatherConditions",
    "roadSurfaceConditions",
    "carriagewayHazards",
    "specialConditions",
    "accidentAreaType",
    "roadType",
    "speedLimit",
    "vehicleType",
    "vehicleManoeuvre",
    "vehicleLocationRestrictedLane",
    "vehicleLocationJunction",
    "skiddingAndOverturning",
    "vehicleLeavingCarriageway",
    "hitObjectOffCarriageway",
    "hitObjectInCarriageway",
    "firstPointOfImpact",
    "driverPosition",
    "ageOfVehicle",
    "sexOfDriver",
    "ageOfDriver",
    "propulsionType",
    "driverIMDDecile",
]

query = """with MostSevereCasualty as (select accidentID, vehicleReference, min(casualtySeverity) as mostSevereCasualty from Casualty where casualtyClass = 1 group by accidentID, vehicleReference)
            select """

for feature in features:
    query += feature + ", "

query += "mostSevereCasualty from Vehicle inner join MostSevereCasualty using (accidentID, vehicleReference) inner join Accident using(accidentID) where\n"

first = True
for feature in features:
    if first:
        query += feature + " is not null"
        first = False
    else:
        query += f" and\n{feature} is not null"

query += ";"

# load relevant data into pandas dataframe and do necessary pre-processing
print("Fecthing data from database...")
df = pandas.read_sql(query, db)
db.close()

print("Pre-processing data...")
X = df[features]
Y = df.mostSevereCasualty
X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size=0.1, random_state=1)

# Train Decision Tree classifer
print("Training model...")
clf = tree.DecisionTreeClassifier()
clf = clf.fit(X_train,y_train)

# Test decision tree classifier
print("Testing model...")
y_pred = clf.predict(X_test)
print(metrics.classification_report(y_test, y_pred))

# TODO: perform k fold validation
