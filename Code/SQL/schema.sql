drop table if exists Accident;
drop table if exists Casualty;
drop table if exists Vehicle;
drop table if exists LKAccidentSeverity;
drop table if exists LKCasualtySeverity;
drop table if exists LKCasualtyType;
drop table if exists LKJourneyPurpose;
drop table if exists LKJunctionControlType;
drop table if exists LKJunctionDetail;
drop table if exists LKJunctionLocation;
drop table if exists LKLightConditions;
drop table if exists LocalAuthorityDistrict;
drop table if exists LocalAuthorityHighway;
drop table if exists LKPedCrossHuman;
drop table if exists LKPedCrossPhysical;
drop table if exists LKPedLocation;
drop table if exists LKPedMovement;
drop table if exists LKPointOfImpact;
drop table if exists PoliceForce;
drop table if exists LKRoadClass;
drop table if exists LKRoadType;
drop table if exists LKSex;
drop table if exists LKVehicleLocation;
drop table if exists LKVehicleManoeuvre;
drop table if exists LKVehicleType;
drop table if exists LKWeatherConditions;
drop table if exists LKRoadSurfaceConditions;
drop table if exists LKCarriagewayHazards;
drop table if exists LKSpecialConditions;
drop table if exists LKAccidentAreaType;
drop table if exists LKPoliceOfficerAttendance;
drop table if exists LKPedRoadMaintenanceWorker;
drop table if exists LKHomeAreaType;
drop table if exists LKCarPassengerType;
drop table if exists LKBusPassengerType;
drop table if exists LKTowingAndArticulation;
drop table if exists LKVehicleLocationRestrictedLane;
drop table if exists LKVehicleLocationJunction;
drop table if exists LKSkiddingAndOverturning;
drop table if exists LKVehicleLeavingCarriageway;
drop table if exists LKHitObjectOffCarriageway;
drop table if exists LKDriverPosition;
drop table if exists LKPropulsionType;
drop table if exists LKIMDDecile;

create table Accident (
    accidentID int primary key,
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
    localAuthorityHighwayID int,
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

create table Casualty (
    accidentID int not null,
    vehicleReference int not null,
    casualtyReference int not null,
    casualtyClass int,
    casualtyType int,
    sexOfCasualty int,
    ageOfCasualty int,
    casualtySeverity int,
    pedLocation int,
    pedMovement int,
    pedRoadMaintenanceWorker int,
    casualtyHomeAreaType,
    carPassengerType int,
    busPassengerType int,
    primary key(accidentID, vehicleReference, casualtyReference),
    foreign key(accidentID) references Accident(accidentID)
);

create table Vehicle (
    accidentID int not null,
    vehicleReference int not null,
    vehicleType int,
    towingAndArticulation int,
    vehicleManoeuvre int,
    vehicleLocationRestrictedLane int,
    vehicleLocationJunction int,
    skiddingAndOverturning int,
    vehicleLeavingCarriageway int,
    hitObjectOffCarriageway int,
    firstPointOfImpact int,
    driverPosition int,
    journeyPurposeOfDriver int,
    sexOfDriver int,
    ageOfDriver int,
    engineCapacity int,
    propulsionType int,
    ageOfVehicle int,
    driverIMDDecile int,
    driverHomeAreaType int,
    primary key(accidentID, vehicleReference),
    foreign key(accidentID) references Accident(accidentID)
);

create Table LKAccidentSeverity (
    accidentSeverityID int primary key,
    accidentSeverityDescription varchar(64) not null
);

create Table LKCasualtySeverity (
    casualtySeverityID int primary key,
    casualtySeverityDescription varchar(64) not null
);

create Table LKCasualtyType (
    casualtyTypeID int primary key,
    casualtyTypeDescription varchar(64) not null
);

create Table LKJourneyPurpose (
    journeyPurposeID int primary key,
    journeyPurposeDescription varchar(64) not null
);

create Table LKJunctionControl (
    junctionControlID int primary key,
    junctionControlDescription varchar(64) not null
);

create Table LKJunctionDetail (
    junctionDetailID int primary key,
    junctionDetailDescription varchar(64) not null
);

create Table LKJunctionLocation (
    junctionLocationID int primary key,
    junctionLocationDescription varchar(64) not null
);

create Table LKLightConditions (
    lightConditionID int primary key,
    lightConditionDescription varchar(64) not null
);

create Table LocalAuthorityDistrict (
    localAuthorityDistrictID int primary key,
    localAuthorityDistrictDescription varchar(64) not null
);

create Table LocalAuthorityHighway (
    localAuthorityHighwayID int primary key,
    localAuthorityHighwayDescription varchar(64) not null
);

create Table LKPedCrossHuman (
    pedCrossHumanID int primary key,
    pedCrossHumanDescription varchar(64) not null
);

create Table LKPedCrossPhysical (
    pedCrossPhysicalID int primary key,
    pedCrossPhysicalDescription varchar(64) not null
);

create Table LKPedLocation (
    pedLocationID int primary key,
    pedLocationDescription varchar(64) not null
);

create Table LKPedMovement (
    pedMovementID int primary key,
    pedMovementDescription varchar(64) not null
);

create Table LKPointOfImpact (
    pointOfImpactID int primary key,
    pointOfImpactDescription varchar(64) not null
);

create Table PoliceForce (
    policeForceID int primary key,
    policeForcName varchar(64) not null
);

create Table LKPoliceOfficerAttendance (
    policeOfficerAttendanceID int primary key,
    policeOfficerAttendanceDescription varchar(64) not null
);

create Table LKRoadClass (
    roadClassID int primary key,
    roadClassDescription varchar(64) not null
);

create Table LKRoadType (
    roadTypeID int primary key,
    roadTypeDescription varchar(64) not null
);

create Table LKSex (
    sexID int primary key,
    sexDescription varchar(64) not null
);

create Table LKVehicleLocation (
    vehicleLocationID int primary key,
    vehicleLocationDescription varchar(64) not null
);

create Table LKVehicleManoeuvre (
    vehicleManoeuvreID int primary key,
    vehicleManoeuvreDescription varchar(64) not null
);

create Table LKVehicleType (
    vehicleTypeID int primary key,
    vehicleTypeDescription varchar(64) not null
);

create Table LKWeatherConditions (
    weatherConditionsID int primary key,
    weatherConditionsDescription varchar(64) not null
);

create Table LKCarriagewayHazards (
    carriagewayHazardsID int primary key,
    carriagewayHazardsDescription varchar(64) not null
);

create Table LKRoadSurfaceConditions (
    roadSurfaceConditionsID int primary key,
    roadSurfaceConditionsDescription varchar(64) not null
);

create Table LKSpecialConditions (
    specialConditionsID int primary key,
    specialConditionsDescription varchar(64) not null
);

create Table LKAccidentAreaType (
    accidentAreaTypeID int primary key,
    accidentAreaTypeDescription varchar(64) not null
);

create Table LKPedRoadMaintenanceWorker (
    pedRoadMaintenanceWorkerID int primary key,
    pedRoadMaintenanceWorkerDescription varchar(64) not null
);

create Table LKHomeAreaType (
    homeAreaTypeID int primary key,
    homeAreaTypeDescription varchar(64) not null
);

create Table LKCarPassengerType (
    carPassengerTypeID int primary key,
    carPassengerTypeDescription varchar(64) not null
);

create Table LKBusPassengerType (
    busPassengerTypeID int primary key,
    busPassengerTypeDescription varchar(64) not null
);

create Table LKTowingAndArticulation (
    towingAndArticulationID int primary key,
    towingAndArticulationDescription varchar(64) not null
);

create Table LKVehicleLocationRestrictedLane (
    vehicleLocationRestrictedLaneID int primary key,
    vehicleLocationRestrictedLaneDescription varchar(64) not null
);

create Table LKVehicleLocationJunction (
    vehicleLocationJunctionID int primary key,
    vehicleLocationJunctionDescription varchar(64) not null
);

create Table LKSkiddingAndOverturning (
    skiddingAndOverturningID int primary key,
    skiddingAndOverturningDescription varchar(64) not null
);

create Table LKVehicleLeavingCarriageway (
    vehicleLeavingCarriagewayID int primary key,
    vehicleLeavingCarriagewayDescription varchar(64) not null
);

create Table LKHitObjectOffCarriageway (
    hitObjectOffCarriagewayID int primary key,
    hitObjectOffCarriagewayDescription varchar(64) not null
);

create Table LKDriverPosition (
    driverPositionID int primary key,
    driverPositionDescription varchar(64) not null
);

create Table LKPropulsionType (
    propulsionType int primary key,
    propulsionTypeDescription varchar(64) not null
);

create Table LKIMDDecile (
    IMDDecileID int primary key,
    IMDDecileDescription varchar(64) not null
);
