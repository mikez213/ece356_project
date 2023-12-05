import mysql.connector
import getpass
import pandas
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn import metrics

"""
input:
vehicleType
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
query = """with MostSevereCasualty as (select accidentID, vehicleReference, min(casualtySeverity) as mostSevereCasualty from Casualty where casualtyClass = 1 group by accidentID, vehicleReference)
            select vehicleType, driverPosition, ageOfVehicle, sexOfDriver, ageOfDriver, propulsionType, driverIMDDecile, driverHomeAreaType, mostSevereCasualty from Vehicle inner join MostSevereCasualty using (accidentID, vehicleReference) where 
                vehicleType is not null and 
                driverPosition is not null and 
                ageOfVehicle is not null and 
                sexOfDriver is not null and 
                ageOfDriver is not null and 
                propulsionType is not null and 
                driverIMDDecile is not null and 
                driverHomeAreaType is not null;
            """

# load relevant data into pandas dataframe and do necessary pre-processing
print("Fecthing data from database...")
df = pandas.read_sql(query, db)
db.close()

print("Pre-processing data...")
feature_cols = ["vehicleType", "driverPosition", "ageOfVehicle", "sexOfDriver", "ageOfDriver", "propulsionType", "driverIMDDecile", "driverHomeAreaType"]
X = df[feature_cols]
Y = df.mostSevereCasualty
X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size=0.1)

# Train Decision Tree classifer
print("Training model...")
clf = DecisionTreeClassifier()
clf = clf.fit(X_train,y_train)

# Test decision tree classifier
print("Testing model...")
y_pred = clf.predict(X_test)
print("Accuracy:", metrics.accuracy_score(y_test, y_pred))

# TODO: perform k fold validation
