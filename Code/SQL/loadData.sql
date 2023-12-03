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
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/LKSexOfDriver.csv' into table LKSex
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKVehicleLocation' AS '';
delete from LKVehicleLocation;
load data infile '/var/lib/mysql-files/07-Accidents/contextCSVs/Vehicle_Location.csv' into table LKVehicleLocation
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

-- TODO: local file
select 'LKWeatherConditions' AS '';
delete from LKWeatherConditions;
load data infile '' into table LKWeatherConditions
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKRoadSurfaceConditions' AS '';
delete from LKRoadSurfaceConditions;
load data infile '' into table LKRoadSurfaceConditions
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKCarriagewayHazards' AS '';
delete from LKCarriagewayHazards;
load data infile '' into table LKCarriagewayHazards
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKSpecialConditions' AS '';
delete from LKSpecialConditions;
load data infile '' into table LKSpecialConditions
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKAccidentAreaType' AS '';
delete from LKAccidentAreaType;
load data infile '' into table LKAccidentAreaType
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKPoliceOfficerAttendance' AS '';
delete from LKPoliceOfficerAttendance;
load data infile '' into table LKPoliceOfficerAttendance
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKPedRoadMaintenanceWorker' AS '';
delete from LKPedRoadMaintenanceWorker;
load data infile '' into table LKPedRoadMaintenanceWorker
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKHomeAreaType' AS '';
delete from LKHomeAreaType;
load data infile '' into table LKHomeAreaType
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKCarPassengerType' AS '';
delete from LKCarPassengerType;
load data infile '' into table LKCarPassengerType
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKBusPassengerType' AS '';
delete from LKBusPassengerType;
load data infile '' into table LKBusPassengerType
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKTowingAndArticulation' AS '';
delete from LKTowingAndArticulation;
load data infile '' into table LKTowingAndArticulation
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKVehicleLocationRestrictedLane' AS '';
delete from LKVehicleLocationRestrictedLane;
load data infile '' into table LKVehicleLocationRestrictedLane
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKVehicleLocationJunction' AS '';
delete from LKVehicleLocationJunction;
load data infile '' into table LKVehicleLocationJunction
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKSkiddingAndOverturning' AS '';
delete from LKSkiddingAndOverturning;
load data infile '' into table LKSkiddingAndOverturning
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKVehicleLeavingCarriageway' AS '';
delete from LKVehicleLeavingCarriageway;
load data infile '' into table LKVehicleLeavingCarriageway
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKHitObjectOffCarriageway' AS '';
delete from LKHitObjectOffCarriageway;
load data infile '' into table LKHitObjectOffCarriageway
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKDriverPosition' AS '';
delete from LKDriverPosition;
load data infile '' into table LKDriverPosition
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKPropulsionType' AS '';
delete from LKPropulsionType;
load data infile '' into table LKPropulsionType
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'LKIMDDecile' AS '';
delete from LKIMDDecile;
load data infile '' into table LKIMDDecile
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines;

select 'Accident' as '';
create table TempAccident (
    accidentID varchar(16) primary key,
    accidentSeverity int,
    numberOfVehicles int,
    numberOfCasualties int,
    accidentDateTime datetime,
    lightConditions int,
    weatherConditions int,
    roadSurfaceConditions int,
    carriagewayHazards int,
    specialConditions int,
    accidentAreaType int,
    latitude decimal(10, 8),
    longitude decimal(11, 8),
    localAuthorityDistrictID int,
    localAuthorityHighwayID varchar(64),
    firstRoadClass int,
    firstRoadNumber int,
    secondRoadClass int,
    secondRoadNumber int,
    roadType int,
    speedLimit int,
    junctionType int,
    junctionControlType int,
    pedCrossHumanControlType int,
    pedCrossPhysicalControlType int,
    policeOfficerAttendance int,
    policeForceID int
);
load data infile '/var/lib/mysql-files/07-Accidents/Accidents0515.csv' into table TempAccident
    fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\n'
    ignore 1 lines
    (accidentID, @locEasting, @locNorthing, @longitude, @latitude, policeForceID, accidentSeverity, numberOfVehicles, numberOfCasualties, @date, @dayOfWeek, @time, localAuthorityDistrictID, localAuthorityHighwayID, firstRoadClass, firstRoadNumber, roadType, speedLimit, junctionType, junctionControlType, secondRoadClass, secondRoadNumber, pedCrossHumanControlType, pedCrossPhysicalControlType, lightConditions, weatherConditions, roadSurfaceConditions, specialConditions, carriagewayHazards, accidentAreaType, policeOfficerAttendance, @lsoa)
    set accidentDateTime = timestamp(str_to_date(@date, '%d/%m/%Y'), str_to_date(@time, '%k:%i')),
    longitude = nullif(@longitude, ''),
    latitude = nullif(@latitude, '');

insert into Accident select * from TempAccident where longitude is not null and latitude is not null;

drop table TempAccident;
