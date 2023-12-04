import csv

CSVNameList = ["Weather_Conditions.csv", 
               "Road_Surface_Conditions.csv", 
               "Carriageway_Hazards.csv", 
               "Special_Conditions.csv", 
               "Home_Area_Type.csv", 
               "Ped_Road_Maintenace_Worker.csv", 
               "Car_Passenger_Type.csv",
               "Bus_Passenger_Type.csv",
               "Vehicle_Location_Restricted_Lane.csv", 
               "Skidding_And_Overturning.csv",
               "Vehicle_Leaving_Carriageway.csv",
               "Hit_Object_Off_Carriageway.csv",
               "Hit_Object_In_Carriageway.csv",
               "Driver_Position.csv",
               "Propulsion_Type.csv",
               "IMD_Decile.csv",
               "Towing_And_Articulation.csv"]

tableNameList = ["LKWeatherConditions", 
                 "LKRoadSurfaceConditions",
                "LKCarriagewayHazards", 
                "LKSpecialConditions", 
                "LKHomeAreaType", 
                "LKPedRoadMaintenanceWorker",
                "LKCarPassengerType",
                "LKBusPassengerType",
                "LKVehicleLocationRestrictedLane",
                "LKSkiddingAndOverturning",
                "LKVehicleLeavingCarriageway",
                "LKHitObjectOffCarriageway",
                "LKHitObjectInCarriageway",
                "LKDriverPosition",
                "LKPropulsionType",
                "LKIMDDecile",
                "LKTowingAndArticulation"]

sqlFile = open("insertContextCSVs.sql", 'w')

for csvName, tableName in zip(CSVNameList, tableNameList):
    with open(csvName, mode='r') as csvFile:
        csvReader = csv.reader(csvFile)
        header = next(csvReader)
        sqlFile.write("INSERT INTO " + tableName + " VALUES ")
        pp = 0
        for row in csvReader:
            if pp != 0:
                sqlFile.write(", ")
            sqlFile.write("(" + row[0] + ", \"" + row[1] + "\")")
            pp += 1
        
        sqlFile.write(";\n")

sqlFile.close()