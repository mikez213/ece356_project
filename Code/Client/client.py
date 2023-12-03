# Importing module
import mysql.connector
import datetime

# The following items should be present:
# (a) Ideal client requirements
# (b) Actual client proposed
# (c) Actual client implemented
# (d) Test cases necessary to validate the client
# (e) Justification for the client design
# Client should include both the ability to query data and to update/input data,
# as appropriate to the project area.

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


def search(mydb, mycursor):
    mycursor.execute("SELECT table_name FROM information_schema.tables where table_schema = 'NHL_356';")
    myresult = mycursor.fetchall()
    tables = [item[0] for item in myresult]
    print(tables)
    # for x in myresult:
    #     print(x)

    # get criteria conditions
    criteria = []
    print("Which category(s) do you want to search with? Enter one at a time, hit enter or done to stop")
    while True:
        print("select a table:", tables)
        input_table = input(criteria)
        if input_table == "done" or input_table == "":
            break
        if input_table in tables:
            mycursor.execute("DESCRIBE " + input_table)
            myresult = mycursor.fetchall()
            attributes = [item[0] for item in myresult]
            print(attributes)
            input_attribute = input("select an attribute: ")
            if input_attribute in attributes:
                comparison = input("What comparison are you using? options: <, =, >")
                while comparison not in ["<", "=", ">"]:
                    comparison = input("Invalid, select these options: <, =, >")
                # need to get keys/defintions here for user (they can reference "daylight" with "2" and format correct)

                value = input("What value are you looking for?")
                criteria.append((input_table, input_attribute, comparison, value))
            else:
                print("not an attribute")
        else:
            print("not a category")

    # get info categories
    # print("Which category(s) do you want information about? Enter one at a time, hit enter or done to stop")
    # info = []
    # while True:
    #     print("select a table:", tables)
    #     input_table = input(info)
    #     if input_table == "done" or input_table == "":
    #         break
    #     if input_table in tables:
    #         mycursor.execute("DESCRIBE " + input_table)
    #         myresult = mycursor.fetchall()
    #         attributes = [item[0] for item in myresult]
    #         print(attributes)
    #         input_attribute = input("select an attribute: ")
    #         if input_attribute in attributes:
    #             info.append((input_table, input_attribute))
    #
    #         else:
    #             print("not an attribute")
    #     else:
    #         print("not a category")

    first = True
    query = ""
    for item in criteria:
        # need to removed duplicates
        if first:
            query = "SELECT * FROM " + item[0]
            first = False
        else:
            query += " INNER JOIN " + item[0] + " USING (gameID)"  # switch to gameID

    print(query)

    first = True
    query += " WHERE "
    for item in criteria:

        if not first:
            query += " AND "

        query += "(" + item[1] + " " + item[2] + " " + item[3] + ")"
        first = False

    print(query)
    # SELECT * FROM GameGoals INNER JOIN GamePlays USING (playID) WHERE (playID < 3) AND (playID < 19)
    mycursor.execute(query + ";")
    print(mycursor.column_names)
    myresult = mycursor.fetchmany(25)  # 25 rows max
    for x in myresult:
        print(x)
    # search_type = []
    # values = []
    # for category in criteria:
    #     print("For", category)
    #     new_type = input("What comparison are you using?")
    #     new_value = input("What value are you looking for?")
    #
    #     # mycursor.execute("SELECT table_name, table_schema, table_type, table_rows FROM information_schema.tables where table_name = '" , category , "' and table_schema = 'NHL_356';")
    #     # myresult = mycursor.fetchall()
    #     # res = [item[0] for item in myresult]
    #     # print(res)
    #     #
    #     # need to print what each number/table means
    #     # need to add things for date time, bools, latitude/long
    #
    #     values.append(new_value)
    #     search_type.append(new_type)
    #
    # print(values, search_type)

    # if value == "value":
    #     min = input("enter value: ")
    #     max = min
    # elif value == "range":
    #     min = input("enter lower bound: ")
    #     max = input("enter upper bound: ")
    # else:
    #     print("invalid entry")


def modify(mydb, mycursor):
    print("Which catagory do you want to search with? ")
    mycursor.execute(
        "SELECT table_name, table_schema, table_type, table_rows FROM information_schema.tables where table_schema = 'NHL_356';")

    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)


def create(mydb, mycursor):
    crash = {}

    print("Details:")
    year = int(input("Year:"))
    month = int(input("Month:"))
    day = int(input("Day:"))
    # hour = int(input("Hour:"))
    # minute = int(input("Min:"))
    crash["date"] = datetime.date(year, month, day)
    # crash["time"] = datetime.time(hour, minute)

    print(crash)


# Creating connection object
mydb = mysql.connector.connect(
    host="riku.shoshin.uwaterloo.ca",
    user="m476zhan",
    password="1234",
    database="NHL_356"
)

mycursor = mydb.cursor()

# Printing the connection object
print(mydb)

while True:
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
#
# myresult = mycursor.fetchall()
#
# for x in myresult:
#     print(x)
# query info

# modify entry

# create new accident
