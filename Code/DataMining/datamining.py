import mysql.connector
import getpass
import pandas
from sklearn.model_selection import cross_val_score, KFold
from sklearn import tree, metrics
from statistics import mean
import json

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
    "ageOfVehicle",
    "sexOfDriver",
    "ageOfDriver",
    "propulsionType",
    "driverIMDDecile",
]

relevantMetrics = [
    ["2", "precision"],
    ["2", "recall"],
    ["3", "precision"],
    ["3", "recall"],
    ["4", "precision"],
    ["4", "recall"],
    ["accuracy"]
]

n = 100

print(features)

query = """with MostSevereCasualty as (select accidentID, vehicleReference, min(casualtySeverity) as mostSevereCasualty from Casualty where casualtyClass = 1 or casualtyClass = 2 group by accidentID, vehicleReference)
            select """

for feature in features:
    query += feature + ", "

query += "case when mostSevereCasualty is null then 4 when mostSevereCasualty = 1 then 2 else mostSevereCasualty end as severity from Vehicle left outer join MostSevereCasualty using (accidentID, vehicleReference) inner join Accident using(accidentID) where\n"

first = True
for feature in features:
    if first:
        query += feature + " is not null"
        first = False
    else:
        query += f" and\n{feature} is not null"

query += ";"

# load relevant data into pandas dataframe and do necessary pre-processing
print("Fetching data from database...")
df = pandas.read_sql(query, db)
db.close()

print("Pre-processing data...")
X = df[features]
Y = df.severity

# Perform k-fold cross validation
print("Performing k-fold cross validation...")
decisionTrees = []
kf = KFold(n_splits=n, shuffle=True, random_state=1)
reports = []
f =  open('metrics.txt', 'w')
for i, (train_index, test_index) in enumerate(kf.split(X)):
    # Train Decision Tree classifer
    print(f"Training model {i}...")
    X_train, X_test, y_train, y_test = X.loc[train_index], X.loc[test_index], Y.loc[train_index], Y.loc[test_index]
    clf = tree.DecisionTreeClassifier()
    clf = clf.fit(X_train,y_train)

    # Test decision tree classifier
    print(f"Testing model {i}...")
    y_pred = clf.predict(X_test)

    decisionTrees.append(clf)
    reports.append(metrics.classification_report(y_test, y_pred, output_dict=True))
    f.write(f"Model {i} metrics:\n")
    metricReport = metrics.classification_report(y_test, y_pred)
    f.write(metricReport)
    print(metricReport)

f.close()

f = open('metrics.json', 'w')
f.write(json.dumps(reports))
f.close()

avgMetrics = {}
for metric in relevantMetrics:
    key = ""
    for s in metric:
        key += s
    avgMetrics[key] = 0

for report in reports:
    for metric in relevantMetrics:
        m = report
        key = ""
        for s in metric:
            m = m[s]
            key += s
        
        avgMetrics[key] += m

for key in avgMetrics:
    print(key + ": " + str(avgMetrics[key]/n))
