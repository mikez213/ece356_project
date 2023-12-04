select 'LKAccidentSeverity' AS '';
delete from LKAccidentSeverity;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Accident_Severity.csv' into table LKAccidentSeverity
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKCasualtySeverity' AS '';
delete from LKCasualtySeverity;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Casualty_Severity.csv' into table LKCasualtySeverity
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKCasualtyType' AS '';
delete from LKCasualtyType;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Casualty_Type.csv' into table LKCasualtyType
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKCasualtySeverity' AS '';
delete from LKCasualtySeverity;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Casualty_Severity.csv' into table LKCasualtySeverity
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKJourneyPurpose' AS '';
delete from LKJourneyPurpose;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Journey_Purpose.csv' into table LKJourneyPurpose
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKJunctionControl' AS '';
delete from LKJunctionControl;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Junction_Control.csv' into table LKJunctionControl
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKJunctionDetail' AS '';
delete from LKJunctionDetail;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Junction_Detail.csv' into table LKJunctionDetail
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKJunctionLocation' AS '';
delete from LKJunctionLocation;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Junction_Location.csv' into table LKJunctionLocation
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKLightCondition' AS '';
delete from LKLightCondition;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Light_Conditions.csv' into table LKLightCondition
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LocalAuthorityDistrict' AS '';
delete from LocalAuthorityDistrict;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Local_Authority_District.csv' into table LocalAuthorityDistrict
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LocalAuthorityHighway' AS '';
delete from LocalAuthorityHighway;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Local_Authority_Highway.csv' into table LocalAuthorityHighway
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKPedCrossHuman' AS '';
delete from LKPedCrossHuman;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Ped_Cross_Human.csv' into table LKPedCrossHuman
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKPedCrossPhysical' AS '';
delete from LKPedCrossPhysical;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Ped_Cross_Physical.csv' into table LKPedCrossPhysical
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKPedLocation' AS '';
delete from LKPedLocation;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Ped_Location.csv' into table LKPedLocation
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKPedMovement' AS '';
delete from LKPedMovement;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Ped_Movement.csv' into table LKPedMovement
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKPointOfImpact' AS '';
delete from LKPointOfImpact;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Point_of_Impact.csv' into table LKPointOfImpact
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'PoliceForce' AS '';
delete from PoliceForce;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Police_Force.csv' into table PoliceForce
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKPoliceOfficerAttendance' AS '';
delete from LKPoliceOfficerAttendance;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Police_Officer_Attend.csv' into table LKPoliceOfficerAttendance
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKRoadClass' AS '';
delete from LKRoadClass;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Road_Class.csv' into table LKRoadClass
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKRoadType' AS '';
delete from LKRoadType;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Road_Type.csv' into table LKRoadType
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKSex' AS '';
delete from LKSex;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Sex_of_Driver.csv' into table LKSex
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKVehicleManoeuvre' AS '';
delete from LKVehicleManoeuvre;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Vehicle_Manoeuvre.csv' into table LKVehicleManoeuvre
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKVehicleType' AS '';
delete from LKVehicleType;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Vehicle_Type.csv' into table LKVehicleType
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

delete from Casualty;
delete from Vehicle;
delete from Accident;

select 'Accident' as '';
load data infile '/var/lib/mysql-files/07-Accidents/Accidents0515.csv' into table Accident
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines
    (accidentID, @locEasting, @locNorthing, @longitude, @latitude, policeForceID, accidentSeverity, numberOfVehicles, numberOfCasualties, @date, @dayOfWeek, @time, localAuthorityDistrictID, localAuthorityHighwayID, firstRoadClass, @firstRoadNumber, roadType, speedLimit, @junctionType, @junctionControlType, @secondRoadClass, @secondRoadNumber, @pedCrossHumanControlType, @pedCrossPhysicalControlType, lightConditions, @weatherConditions, @roadSurfaceConditions, @specialConditions, @carriagewayHazards, accidentAreaType, @policeOfficerAttendance, @lsoa)
    set accidentDateTime = timestamp(str_to_date(@date, '%d/%m/%Y'), str_to_date(@time, '%k:%i')),
    longitude = nullif(@longitude, ''),
    latitude = nullif(@latitude, ''),
    firstRoadNumber = nullif(@firstRoadNumber, -1),
    junctionType = nullif(@junctionType, -1),
    junctionControlType = nullif(@junctionControlType, -1),
    secondRoadClass = nullif(@secondRoadClass, -1),
    secondRoadNumber = nullif(@secondRoadNumber, -1),
    pedCrossHumanControlType = nullif(@pedCrossHumanControlType, -1),
    pedCrossPhysicalControlType = nullif(@pedCrossPhysicalControlType, -1),
    weatherConditions = nullif(@weatherConditions, -1),
    roadSurfaceConditions = nullif(@roadSurfaceConditions, -1),
    specialConditions = nullif(@specialConditions, -1),
    carriagewayHazards = nullif(@carriagewayHazards, -1),
    policeOfficerAttendance = nullif(@policeOfficerAttendance, -1);

select 'Vehicle' as '';
load data infile '/var/lib/mysql-files/07-Accidents/Vehicles0515.csv' into table Vehicle
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines
    (accidentID, vehicleReference, @vehicleType, @towingAndArticulation, @vehicleManoeuvre, @vehicleLocationRestrictedLane, @vehicleLocationJunction, @skiddingAndOverturning, @hitObjectInCarriageway, @vehicleLeavingCarriageway, @hitObjectOffCarriageway, @firstPointOfImpact, @driverPosition, @journeyPurposeOfDriver, @sexOfDriver, @ageOfDriver, @ageBand, @engineCapacity, @propulsionType, @ageOfVehicle, @driverIMDDecile, @driverHomeAreaType, @extra)
    set vehicleType = nullif(@vehicleType, -1),
    towingAndArticulation = nullif(@towingAndArticulation, -1),
    vehicleManoeuvre = nullif(@vehicleManoeuvre, -1),
    vehicleLocationRestrictedLane = nullif(@vehicleLocationRestrictedLane, -1),
    vehicleLocationJunction = nullif(@vehicleLocationJunction, -1),
    skiddingAndOverturning = nullif(@skiddingAndOverturning, -1),
    hitObjectInCarriageway = nullif(@hitObjectInCarriageway, -1),
    vehicleLeavingCarriageway = nullif(@vehicleLeavingCarriageway, -1),
    hitObjectOffCarriageway = nullif(@hitObjectOffCarriageway, -1),
    firstPointOfImpact = nullif(@firstPointOfImpact, -1),
    driverPosition = nullif(@driverPosition, -1),
    journeyPurposeOfDriver = nullif(@journeyPurposeOfDriver, -1),
    sexOfDriver = nullif(@sexOfDriver, -1),
    ageOfDriver = nullif(@ageOfDriver, -1),
    engineCapacity = nullif(@engineCapacity, -1),
    propulsionType = nullif(@propulsionType, -1),
    ageOfVehicle = nullif(@ageOfVehicle, -1),
    driverIMDDecile = nullif(@driverIMDDecile, -1),
    driverHomeAreaType = nullif(@driverHomeAreaType, -1);

select 'Casualty' as '';
load data infile '/var/lib/mysql-files/07-Accidents/Casualties0515.csv' into table Casualty
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines
    (accidentID, vehicleReference, casualtyReference, casualtyClass, @sexOfCasualty, @ageOfCasualty, @ageBand, casualtySeverity, @pedLocation, @pedMovement, @carPassengerType, @busPassengerType, @pedRoadMaintenanceWorker, casualtyType, @casualtyHomeAreaType, @extra)
    set sexOfCasualty = nullif(@sexOfCasualty, -1),
    ageOfCasualty = nullif(@ageOfCasualty, -1),
    pedLocation = nullif(@pedLocation, -1),
    pedMovement = nullif(@pedMovement, -1),
    carPassengerType = nullif(@carPassengerType, -1),
    busPassengerType = nullif(@busPassengerType, -1),
    pedRoadMaintenanceWorker = nullif(@pedRoadMaintenanceWorker, -1),
    casualtyHomeAreaType = nullif(@casualtyHomeAreaType, -1);
