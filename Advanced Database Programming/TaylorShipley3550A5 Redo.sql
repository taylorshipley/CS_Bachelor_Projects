-- GameOfficialScheduler create script
-- CS3550 
-- <Taylor Shipley>

USE [master];
GO
-- Drops Database and creates new one
DROP DATABASE IF EXISTS officiatingDB;
CREATE DATABASE officiatingDB;

USE [officiatingDB];
GO

-- Drops Tables
DROP TABLE IF EXISTS gosSecurityQuestion;
DROP TABLE IF EXISTS gosSecurityAnswer;
DROP TABLE IF EXISTS gosUser;
DROP TABLE IF EXISTS gosArbiter;
DROP TABLE IF EXISTS gosOfficialQualification;
DROP TABLE IF EXISTS gosOfficiatingPosition;
DROP TABLE IF EXISTS gosSportLevel;
DROP TABLE IF EXISTS gosSite;
DROP TABLE IF EXISTS gosGameOfficial;
DROP TABLE IF EXISTS gosGame;
DROP TABLE IF EXISTS gosSchool;

-- Creates new tables

-- Creates Security Question Table
CREATE TABLE gosSecurityQuestion(
    odSecurityQuestion_id int NOT NULL,
    question Nvarchar(255) NOT NULL
);


-- Creates Security Answer Table
CREATE TABLE gosSecurityAnswer(
    odUser_id int NOT NULL,
    odSecurityQuestion_id int NOT NULL,
	answer NVarchar(Max) NOT NULL,
);



-- Creates User Table
CREATE TABLE gosUser(
    odUser_id int NOT NULL,
    emailAddress NVarchar(450) NOT NULL,
	firstName NVarchar(25) NOT NULL,
	lastName NVarchar(50) NOT NULL,
	streetAddress NVarchar(255) NOT NULL,
	city NVarchar(50) NOT NULL,
	[state] NVarchar (2) NOT NULL,
	zip Nvarchar(9) NOT NULL,
	cellPhoneNumber Nvarchar(10) NOT NULL,
	homePhoneNumber Nvarchar(10) NULL,
	workPhoneNumber Nvarchar(10) NULL,
	feesAccumulated smallMoney NOT NULL,
	[password] NVarchar(30) NOT NULL
);


-- Creates Arbiter Table
CREATE TABLE gosArbiter(
    odUser_id int NOT NULL,
    odSportLevel_id int NOT NULL,
);

-- Creates OfficialQualification Table
CREATE TABLE gosOfficialQualification(
    odUser_id int NOT NULL,
    odSportLevel_id int NOT NULL,
	odOfficiatingPosition_id int NOT NULL,
);

-- Creates OfficiatingPosition Table
CREATE TABLE gosOfficiatingPosition(
	odOfficiatingPosition_id int NOT NULL,
	positionName NVarchar(25) NOT NULL
);

-- Creates SportLevel Table
CREATE TABLE gosSportLevel(
	odSportLevel_id int NOT NULL,
	Sport NVarchar(25) NOT NULL,
	[Level] NVarchar(25) NOT NULL,
	Pay smallMoney,
);

-- Creates Site Table
CREATE TABLE gosSite(
    odSiteName_id int NOT NULL,
	siteName NVarchar(50) NOT NULL,
	streetAddress NVarchar(255) NOT NULL,
	city NVarchar(50) NOT NULL,
	[state] NVarchar (2) NOT NULL,
	zip Nvarchar(9) NOT NULL,
	workPhoneNumber Nvarchar(10) NOT NULL,
	);
	
-- Creates GameOfficial Table
CREATE TABLE gosGameOfficial(
    odUser_id int NOT NULL,
	odGame_id int NOT NULL,
	odOfficiatingPosition_id int NOT NULL,
	);
	
-- Creates Game Table
CREATE TABLE gosGame(
    odGame_id int NOT NULL,
	gameDateTime dateTime NOT NULL,
	odSportLevel_id int NOT NULL,
	odSiteName_id int NOT NULL,
	homeTeam int NULL,
	vistingTeam int NULL,
	);
	
-- Creates School Table
CREATE TABLE gosSchool(
    odSchool_id int NOT NULL,
	schoolName NVarchar(50) NOT NULL,
	streetAddress NVarchar(255) NOT NULL,
	city NVarchar(50) NOT NULL,
	[state] NVarchar (2) NOT NULL,
	zip Nvarchar(9) NOT NULL,
	workPhoneNumber Nvarchar(10) NOT NULL,
	);

--Adds Primary Keys
ALTER TABLE gosSecurityQuestion
Add PRIMARY KEY (odSecurityQuestion_id);

ALTER TABLE gosSecurityAnswer
ADD CONSTRAINT PK_gosSecurityAnswer PRIMARY KEY (odUser_id,odSecurityQuestion_id);

ALTER TABLE gosUser
ADD PRIMARY KEY (odUser_id);

ALTER TABLE gosArbiter
ADD CONSTRAINT PK_gosArbiter PRIMARY KEY (odUser_id,odSportLevel_id);

ALTER TABLE gosOfficialQualification
ADD CONSTRAINT PK_gosOfficialQualification PRIMARY KEY (odUser_id,odSportLevel_id,odOfficiatingPosition_id);

ALTER TABLE gosSportLevel
ADD PRIMARY KEY (odSportLevel_id);

ALTER TABLE gosSite
ADD PRIMARY KEY (odSiteName_id);

ALTER TABLE gosGameOfficial
ADD CONSTRAINT PK_gosGameOfficial PRIMARY KEY (odUser_id,odGame_id,odOfficiatingPosition_id);

ALTER TABLE gosSchool
ADD PRIMARY KEY (odSchool_id);

ALTER TABLE gosGame
ADD PRIMARY KEY (odGame_id);

-- Adds Alternate keys
ALTER TABLE gosSecurityQuestion
ADD UNIQUE (question);

ALTER TABLE gosSecurityAnswer
ADD UNIQUE (odUser_id);

ALTER TABLE gosSecurityAnswer
ADD UNIQUE (odSecurityQuestion_id);

ALTER TABLE gosUser
ADD UNIQUE (emailAddress);

ALTER TABLE gosArbiter
ADD UNIQUE (odUser_id);

ALTER TABLE gosArbiter
ADD UNIQUE (odSportLevel_id);

ALTER TABLE gosOfficialQualification
ADD UNIQUE (odUser_id);

ALTER TABLE gosOfficialQualification
ADD UNIQUE (odSportLevel_id);

ALTER TABLE gosOfficialQualification
ADD UNIQUE (odOfficiatingPosition_id);

ALTER TABLE gosOfficiatingPosition
ADD UNIQUE (odOfficiatingPosition_id);

ALTER TABLE gosOfficiatingPosition
ADD UNIQUE (positionName);

ALTER TABLE gosSportLevel
ADD  CONSTRAINT UC_gosSportLevel UNIQUE (Sport,[Level]);

ALTER TABLE gosSite
ADD UNIQUE (siteName);

ALTER TABLE gosGameOfficial
ADD UNIQUE (odUser_id);
	
ALTER TABLE gosGameOfficial
ADD UNIQUE (odGame_id);
	
ALTER TABLE gosGameOfficial
ADD UNIQUE (odOfficiatingPosition_id);
	
ALTER TABLE gosGame
ADD UNIQUE (odSportLevel_id);
	
ALTER TABLE gosGame
ADD UNIQUE (odSiteName_id);
	
ALTER TABLE gosGame
ADD CONSTRAINT UC_gosGame UNIQUE (gameDateTime,odSportLevel_id,odSiteName_id);

ALTER TABLE gosSchool
ADD UNIQUE (schoolName);

-- Adds Foreign Keys
ALTER TABLE gosGame
ADD FOREIGN KEY (HomeTeam) REFERENCES gosSchool(odSchool_id);

ALTER TABLE gosGame
ADD FOREIGN KEY (vistingTeam) REFERENCES gosSchool(odSchool_id);

ALTER TABLE gosGameOfficial
ADD FOREIGN KEY (odUser_id) REFERENCES gosOfficialQualification(odUser_id);

ALTER TABLE gosGameOfficial
ADD FOREIGN KEY (odGame_id) REFERENCES gosGame(odGame_id);

ALTER TABLE gosGameOfficial
ADD FOREIGN KEY (odOfficiatingPosition_id) REFERENCES gosOfficiatingPosition(odOfficiatingPosition_id);

ALTER TABLE gosSecurityAnswer
ADD FOREIGN KEY (odSecurityQuestion_id) REFERENCES gosSecurityQuestion(odSecurityQuestion_id);

ALTER TABLE gosSecurityAnswer
ADD FOREIGN KEY (odUser_id) REFERENCES gosUser(odUser_id);

ALTER TABLE gosArbiter
ADD FOREIGN KEY (odUser_id) REFERENCES gosUser(odUser_id);

ALTER TABLE gosArbiter
ADD FOREIGN KEY (odSportLevel_id) REFERENCES gosSportLevel(odSportLevel_id);

ALTER TABLE gosOfficialQualification
ADD FOREIGN KEY (odSportLevel_id) REFERENCES gosSportLevel(odSportLevel_id);

ALTER TABLE gosOfficialQualification
ADD FOREIGN KEY (odUser_id) REFERENCES gosGameOfficial(odUser_id);

ALTER TABLE gosOfficialQualification
ADD FOREIGN KEY (odOfficiatingPosition_id) REFERENCES gosOfficiatingPosition(odOfficiatingPosition_id);

ALTER TABLE gosGame
ADD FOREIGN KEY (odSportLevel_id) REFERENCES gosSportLevel(odSportLevel_id);
	
ALTER TABLE gosGame
ADD FOREIGN KEY (odSiteName_id) REFERENCES gosSite(odSiteName_id);

