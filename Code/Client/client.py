# Importing module
import mysql.connector
import datetime
import time

# before running make sure to change the db from db_m476zhan to db_team66

database = "db356_m476zhan"

accident = {
    "accidentID",
    "accidentSeverity",
    "numberOfVehicles",
    "numberOfCasualties",
    "accidentDateTime",  # datetime
    "lightConditions",
    "weatherConditions",
    "roadSurfaceConditions",
    "carriagewayHazards",
    "specialConditions",
    "isRural",  # boolean
    "latitude",  # decimal(10, 8)
    "longitude",  # decimal(11, 8)
    "localAuthorityDistrictID",
    "localAuthorityHighwayID",
    "firstRoadClass",
    "firstRoadNumber",
    "secondRoadClass",
    "secondRoadNumber",
    "roadType",
    "speedLimit",
    "junctionType",
    "junctionControlType",
    "pedCrossHumanControlType",
    "pedCrossPhysicalControlType",
    "policeForceID"
}


def setup_tables(mydb, mycursor):
    db = "SELECT table_name FROM information_schema.tables where table_schema = '" + database + "';"
    mycursor.execute(db)
    myresult = mycursor.fetchall()
    tables = [item[0] for item in myresult if not item[0].startswith('LK')]
    lk_tables = [item[0] for item in myresult if item[0].startswith('LK')]
    new_lk_tables = []
    for lookup_t in lk_tables:
        old_lookup_t = lookup_t
        if lookup_t[:2] == "LK":
            lookup_t = lookup_t[2:]
        lookup_t = lookup_t[0].lower() + lookup_t[1:]
        new_lk_tables.append((lookup_t, old_lookup_t))
    print(tables)

    return tables, new_lk_tables


def search(mydb, mycursor):
    # tables, new_lk_tables = setup_tables(mydb, mycursor)
    db = "SELECT table_name FROM information_schema.tables where table_schema = '" + database + "';"
    mycursor.execute(db)
    myresult = mycursor.fetchall()
    tables = [item[0] for item in myresult if not item[0].startswith('LK')]
    lk_tables = [item[0] for item in myresult if item[0].startswith('LK')]
    new_lk_tables = []
    for lookup_t in lk_tables:
        old_lookup_t = lookup_t
        if lookup_t[:2] == "LK":
            lookup_t = lookup_t[2:]
        lookup_t = lookup_t[0].lower() + lookup_t[1:]
        new_lk_tables.append((lookup_t, old_lookup_t))

    # get criteria conditions
    criteria = []
    print("Which category(s) do you want to search with? Enter one at a time, hit enter or done to stop")
    while True:
        print("select a table:", tables)
        input_table = input(criteria)
        if input_table == "done" or input_table == "":
            if not criteria:
                return
            break
        if input_table in tables:
            mycursor.execute("DESCRIBE " + input_table)
            myresult = mycursor.fetchall()
            attributes = [item[0] for item in myresult]
            print(attributes)
            input_attribute = input("select an attribute: ")
            if input_attribute in attributes:

                if input_attribute in [i[0] for i in new_lk_tables]:
                    print("attribute table found: ")
                    lookup_t = input_attribute[0].upper() + input_attribute[1:]
                    # print(lookup_t)
                    if not lookup_t == "LocalAuthorityDistrict" or "LocalAuthorityHighway":
                        lookup_t = "LK" + lookup_t
                        lookup_t = "SELECT * FROM " + lookup_t + ";"
                        # print(lookup_t)
                        mycursor.execute(lookup_t)
                        myresult = mycursor.fetchall()
                        print(myresult)

                comparison = input("What comparison are you using? options: <, =, >: ")
                while comparison not in ["<", "=", ">"]:
                    comparison = input("Invalid, select these options: <, =, >: ")

                value = input("What value are you looking for? (enter numerical value): ")
                criteria.append((input_table, input_attribute, comparison, value))
            else:
                print("not an attribute")
        else:
            print("not a category")

    first = True
    query = ""
    used_tables = []
    for item in criteria:
        # need to removed duplicates
        used_tables.append(item[0])
        if first:
            query = "SELECT * FROM " + item[0]
            first = False
        elif item[0] not in used_tables:
            query += " INNER JOIN " + item[0] + " USING (accidentID)"  # switch to accidentID

    print(query)

    first = True
    query += " WHERE "
    for item in criteria:

        if not first:
            query += " AND "

        query += "(" + item[1] + " " + item[2] + " " + item[3] + ")"
        first = False

    print(query)
    # SELECT * FROM GameGoals INNER JOIN GamePlays USING (accidentID) WHERE (accidentID < 3) AND (accidentID < 19)
    mycursor.execute(query + ";")
    print(mycursor.column_names)
    myresult = mycursor.fetchmany(25)  # 25 rows max
    for x in myresult:
        print(x)


def modify(mydb, mycursor):
    accidentID = input("enter accidentID or 'exit': ")
    if accidentID == "exit":
        return

    query = "select * from Accident where accidentID = '" + accidentID + "';"
    mycursor.execute(query)
    myresult = mycursor.fetchall()
    if myresult == []:
        print("accidentID not found")
        return
    print("accidentID valid")

    db = "SELECT table_name FROM information_schema.tables where table_schema = '" + database + "';"
    mycursor.execute(db)
    myresult = mycursor.fetchall()
    tables = [item[0] for item in myresult if not item[0].startswith('LK')]
    lk_tables = [item[0] for item in myresult if item[0].startswith('LK')]
    new_lk_tables = []
    for lookup_t in lk_tables:
        old_lookup_t = lookup_t
        if lookup_t[:2] == "LK":
            lookup_t = lookup_t[2:]
        lookup_t = lookup_t[0].lower() + lookup_t[1:]
        new_lk_tables.append((lookup_t, old_lookup_t))
    print(tables)

    target = []

    print("Which category(s) do you want to modify? Enter one at a time, hit enter or done to stop")
    while True:
        print("select a category or done: ")
        input_table = input(target)
        if input_table == "done" or input_table == "":
            break
        if input_table in tables:
            mycursor.execute("DESCRIBE " + input_table)
            myresult = mycursor.fetchall()
            attributes = [(item[0], item[1]) for item in myresult]
            print(attributes)

            input_attribute = input("enter an attribute to be modified: ")

            att_name = [(item[0]) for item in attributes]
            if input_attribute in att_name:
                target.append((input_table, input_attribute))
            else:
                print("not an attribute")
        else:
            print("not a category")

    # need to add checks for valid accidentID
    for item in target:
        current_val = ""
        current_val += "SELECT " + item[1] + " FROM " + item[0] + " WHERE (accidentID = '" + accidentID + "');"
        print(current_val)
        mycursor.execute(current_val)
        myresult = mycursor.fetchall()
        result = [item[0] for item in myresult]
        print("current value is ", result)

        # here copy the code for getting information from tables from query
        if item[1] in [i[0] for i in new_lk_tables]:
            print("lookup table found: ")
            lookup_t = item[1][0].upper() + item[1][1:]
            if not lookup_t == "LocalAuthorityDistrict" or "LocalAuthorityHighway":
                lookup_t = "LK" + lookup_t
                lookup_t = "SELECT * FROM " + lookup_t + ";"
                print(lookup_t)
                mycursor.execute(lookup_t)
                myresult = mycursor.fetchall()
                print(myresult)

        new_value = input("input new value: ")

        query = ""
        query += "UPDATE " + item[0] + " SET " + item[1] + " = " + str(
            new_value) + " where accidentID = '" + accidentID + "';"
        print(query)
        mycursor.execute(query)
        myresult = mycursor.fetchall()
        print(myresult)

        current_val = ""
        current_val += "SELECT " + item[1] + " FROM " + item[0] + " WHERE (accidentID = '" + accidentID + "');"
        print(current_val)
        mycursor.execute(current_val)
        myresult = mycursor.fetchall()
        result = [item[0] for item in myresult]
        print("new value is ", result)


# check end of for testing code
def create(mydb, mycursor):
    query = "SELECT MAX(accidentID) FROM Accident;"
    print(query)
    mycursor.execute(query)
    myresult = mycursor.fetchall()
    result = [item[0] for item in myresult]
    # print("current max accidentID is ", result)
    # print(str(result[0])[4:])  # might need to revise this for acc instead of game
    second_accident = str(int(str(result[0])[4:]) + 11)
    # generate new accident ID

    Accident = {}  # 26 entries
    Casualty = {}  # 12(13)
    Vehicle = {}  # 18(19)

    print("Creating new accident:")
    try:
        year = int(input("Year:"))
        month = int(input("Month:"))
        day = int(input("Day:"))
    except:
        print("invalid date")
        return
    tables = ["Accident", "Vehicle", "Casualty"]

    for table in tables:
        des = "DESCRIBE " + table
        mycursor.execute(des)
        myresult = mycursor.fetchall()
        attributes = [(item[0], item[1]) for item in myresult]
        print(attributes)

        # example:
        accident = {}
        for item in attributes:
            if not item[0] == "accidentID" or "accidentDateTime":
                accident[item[0]] = input(str(item[0]))

        accident["accidentID"] = "" + str(year) + second_accident + ""


        if table == "Accident":
            try:
                accident["accidentDateTime"] = datetime.date(year, month, day).strftime("%Y%m%d")
            except:
                print("invalid date ")
                break
        query = "INSERT INTO " + table + " VALUES ("

        first = True
        for item in attributes:
            if not first:
                query += ", "
            query += "'" + accident[item[0]] + "'"
            first = False

        query += ");"
        print(query)
        try:
            mycursor = mydb.cursor()
            mycursor.execute(query)
            mydb.commit()
            res = mycursor.fetchall()
            print(res)
        except:
            print("issue with creation, please check your values")
            return
        finally:
            mycursor.close()
            mycursor = mydb.cursor()

        print(table + " table created succesfully")

    print("all tables created")
    print("new accidentID is " + str(year) + second_accident)


# Creating connection object
mydb = mysql.connector.connect(
    host="riku.shoshin.uwaterloo.ca",
    user="m476zhan",
    password="1234",
    database=database
)

mycursor = mydb.cursor()

# Printing the connection object
print(mydb)

while True:
    mycursor.reset()
    action = input("Select your action: query, modify, create, quit")

    if action == "query":
        search(mydb, mycursor)
    elif action == "modify":
        modify(mydb, mycursor)
    elif action == "create":
        create(mydb, mycursor)
    elif action == "quit":
        break
    else:
        print("invalid action")

# mycursor.execute("SELECT table_name, table_schema, table_type, table_rows FROM information_schema.tables;")
# copy this to test create:
""" 
create
2018
12
30
4
5
6
7
8
9
1
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
1
2
3
4
5
6
7
8
9
1
11
12
13
14
15
16
17
18
19
20
21
1
2
3
4
5
6
7
8
9
1
11
12
13
14

 """
