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
               "IMD_Decile.csv"]

for name in CSVNameList:
    open(name, 'w', newline='\n')