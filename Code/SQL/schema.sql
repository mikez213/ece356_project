drop table if exists LKAccidentSeverity;
drop table if exists LKCasualtySeverity;
drop table if exists LKCasualtyType;
drop table if exists LKJourneyPurpose;
drop table if exists LKJunctionDetail;
drop table if exists LKVehicleLocationJunction;
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
drop table if exists LKSkiddingAndOverturning;
drop table if exists LKVehicleLeavingCarriageway;
drop table if exists LKHitObjectOffCarriageway;
drop table if exists LKHitObjectInCarriageway;
drop table if exists LKDriverPosition;
drop table if exists LKPropulsionType;
drop table if exists LKIMDDecile;
drop table if exists LKCasualtyClass;
drop table if exists LKJunctionControl;
drop table if exists Casualty;
drop table if exists Vehicle;
drop table if exists Accident;

create table Accident (
    accidentID varchar(16) primary key,
    accidentSeverity int references LKAccidentSeverity(accidentSeverityID),
    numberOfVehicles int,
    numberOfCasualties int,
    accidentDateTime datetime,
    lightConditions int references LKLightConditions(lightConditionID),
    weatherConditions int references LKWeatherConditions(weatherConditionsID),
    roadSurfaceConditions int references LKRoadSurfaceConditions(roadSurfaceConditionsID),
    carriagewayHazards int references LKCarriagewayHazards(carriagewayHazardsID),
    specialConditions int references LKSpecialConditions(specialConditionsID),
    accidentAreaType int references LKAccidentAreaType(accidentAreaTypeID),
    latitude decimal(10, 8),
    longitude decimal(11, 8),
    localAuthorityDistrictID int references LocalAuthorityDistrict(localAuthorityDistrictID),
    localAuthorityHighwayID varchar(64) references LocalAuthorityHighway(localAuthorityHighwayID),
    firstRoadClass int references LKRoadClass(roadClassID),
    firstRoadNumber int,
    secondRoadClass int references LKRoadClass(roadClassID),
    secondRoadNumber int,
    roadType int references LKRoadType(roadTypeID),
    speedLimit int,
    junctionType int references LKJunctionDetail(junctionDetailID),
    junctionControlType int references LKJunctionControl,
    pedCrossHumanControlType int references LKPedCrossHuman(pedCrossHumanID),
    pedCrossPhysicalControlType int references LKPedCrossPhysical(pedCrossPhysicalID),
    policeOfficerAttendance int references LKPoliceOfficerAttendance(policeOfficerAttendanceID),
    policeForceID int references PoliceForce(policeForceID)
);

create table Vehicle (
    accidentID varchar(16) not null references Accident(accidentID),
    vehicleReference int not null,
    vehicleType int references LKVehicleType(vehicleTypeID),
    towingAndArticulation int references LKTowingAndArticulation(towingAndArticulationID),
    vehicleManoeuvre int references LKVehicleManoeuvre(vehicleManoeuvreID),
    vehicleLocationRestrictedLane int references LKVehicleLocationRestrictedLane(vehicleLocationRestrictedLaneID),
    vehicleLocationJunction int references LKVehicleLocationJunction(vehicleLocationJunctionID),
    skiddingAndOverturning int references LKSkiddingAndOverturning(skiddingAndOverturningID),
    vehicleLeavingCarriageway int references LKVehicleLeavingCarriageway(vehicleLeavingCarriagewayID),
    hitObjectOffCarriageway int references LKHitObjectOffCarriageway(hitObjectOffCarriagewayID),
    hitObjectInCarriageway int references LKHitObjectInCarriageway(hitObjectInCarriagewayID),
    firstPointOfImpact int references LKPointOfImpact(pointOfImpactID),
    driverPosition int references LKDriverPosition(driverPositionID),
    journeyPurposeOfDriver int references LKJourneyPurpose(journeyPurposeID),
    sexOfDriver int references LKSex(sexID),
    ageOfDriver int,
    engineCapacity int,
    propulsionType int references LKPropulsionType(propulsionTypeID),
    ageOfVehicle int,
    driverIMDDecile int references LKIMDDecile(IMDDecileID),
    driverHomeAreaType int references LKHomeAreaType(homeAreaTypeID),
    primary key(accidentID, vehicleReference)
);

create table Casualty (
    accidentID varchar(16) not null references Accident(accidentID),
    vehicleReference int not null,
    casualtyReference int not null,
    casualtyClass int references LKCasualtyClass(casualtyClassID),
    casualtyType int references LKCasualtyType(casualtyTypeID),
    sexOfCasualty int references LKSex(sexID),
    ageOfCasualty int,
    casualtySeverity int references LKCasualtySeverity(casualtySeverityID),
    pedLocation int references LKPedLocation(pedLocationID),
    pedMovement int references LKPedMovement(pedMovementID),
    pedRoadMaintenanceWorker int references LKPedRoadMaintenanceWorker(pedRoadMaintenanceWorkerID),
    casualtyHomeAreaType int references LKHomeAreaType(homeAreaTypeID),
    carPassengerType int references LKCarPassengerType(carPassengerTypeID),
    busPassengerType int references LKBusPassengerType(busPassengerTypeID),
    primary key(accidentID, vehicleReference, casualtyReference),
    foreign key(accidentID, vehicleReference) references Vehicle(accidentID, vehicleReference)
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

create Table LKVehicleLocationJunction (
    vehicleLocationJunctionID int primary key,
    vehicleLocationJunctionDescription varchar(64) not null
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
    policeForceName varchar(64) not null
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

create Table LKHitObjectInCarriageway (
    hitObjectInCarriagewayID int primary key,
    hitObjectInCarriagewayDescription varchar(64) not null
);

create Table LKDriverPosition (
    driverPositionID int primary key,
    driverPositionDescription varchar(64) not null
);

create Table LKPropulsionType (
    propulsionTypeID int primary key,
    propulsionTypeDescription varchar(64) not null
);

create Table LKIMDDecile (
    IMDDecileID int primary key,
    IMDDecileDescription varchar(64) not null
);

create Table LKCasualtyClass (
    casualtyClassID int primary key,
    casualtyClassDescription varchar(64) not null
);