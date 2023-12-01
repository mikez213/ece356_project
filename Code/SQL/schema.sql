drop table if exists Accident;
drop table if exists Casualty;
drop table if exists Vehicle;

create table Accident (
    accidentID int primary key
);

create table Casualty (
    accidentID int not null,
    casualtyReference int not null,
    primary key(accidentID, casualtyReference),
    foreign key(accidentID) references Accident(accidentID)
);

create table Vehicle (
    accidentID int not null,
    vehicleReference int not null,
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

create Table LKLightCondition (
    lightConditionID int primary key,
    lightConditionDescription varchar(64) not null
);

create Table LKLocalAuthorityDistrict (
    localAuthorityDistrictID int primary key,
    localAuthorityDistrictDescription varchar(64) not null
);

create Table LKLocalAuthorityHighway (
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

create Table LKPoliceForce (
    policeForceID int primary key,
    policeForceDescription varchar(64) not null
);

create Table LKPoliceOfficerAttend (
    policeOfficerAttendID int primary key,
    policeOfficerAttendDescription varchar(64) not null
);

create Table LKRoadClass (
    roadClassID int primary key,
    roadClassDescription varchar(64) not null
);

create Table LKRoadType (
    roadTypeID int primary key,
    roadTypeDescription varchar(64) not null
);

create Table LKSexOfDriver (
    sexOfDriverID int primary key,
    sexOfDriverDescription varchar(64) not null
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
