-- GameOfficialScheduler create script
-- CS3550 
-- <Taylor Shipley>

-- Drops Database and creates new one
DROP DATABASE IF EXISTS officiatingDB;
CREATE DATABASE officiatingDB;

-- Drops Tables and creats new ones
-- Creates Security Question Table
DROP TABLE IF EXISTS SecurityQuestion;
CREATE TABLE SecurityQuestion(
    odSecurityQuestion_id int NOT NULL PRIMARY KEY,
    question Nvarchar(225) NOT NULL UNIQUE
);

-- Creates Security Answer Table
DROP TABLE IF EXISTS SecurityAnswer;
CREATE TABLE SecurityAnswer(
    odUser_id int NOT NULL UNIQUE,
    odSecurityQuestion_id int NOT NULL UNIQUE REFERENCES SecurityQuestion(odSecurityQuestion_id),
	answer NVarchar(Max) NOT NULL,
	CONSTRAINT PK_SecurityAnswer PRIMARY KEY (odUser_id,odSecurityQuestion_id),
);

-- Creates User Table
DROP TABLE IF EXISTS [User];
CREATE TABLE [User](
    odUser_id int NOT NULL PRIMARY KEY,
    emailAddress NVarchar(450) NOT NULL UNIQUE,
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
DROP TABLE IF EXISTS Arbiter;
CREATE TABLE Arbiter(
    odUser_id int NOT NULL UNIQUE REFERENCES [User](odUser_id),
    odSportLevel_id int NOT NULL UNIQUE,
	CONSTRAINT PK_Arbiter PRIMARY KEY (odUser_id,odSportLevel_id)
);
-- Creates OfficialQualification Table
DROP TABLE IF EXISTS OfficialQualification;
CREATE TABLE OfficialQualification(
    odUser_id int NOT NULL UNIQUE,
    odSportLevel_id int NOT NULL UNIQUE,
	odOfficiatingPosition_id int NOT NULL UNIQUE,
	CONSTRAINT PK_OfficialQualification PRIMARY KEY (odUser_id,odSportLevel_id,odOfficiatingPosition_id)
);
-- Creates OfficiatingPosition Table
DROP TABLE IF EXISTS OfficiatingPosition;
CREATE TABLE OfficiatingPosition(
	odOfficiatingPosition_id int NOT NULL UNIQUE,
	positionName NVarchar(25) NOT NULL UNIQUE
);
-- Creates SportLevel Table
DROP TABLE IF EXISTS  SportLevel;
CREATE TABLE SportLevel(
	odSportLevel_id int PRIMARY KEY,
	Sport NVarchar(25) NOT NULL,
	[Level] NVarchar(25) NOT NULL,
	Pay smallMoney,
	CONSTRAINT UC_SportLevel UNIQUE (Sport,[Level])
);
-- Creates Site Table
DROP TABLE IF EXISTS [Site];
CREATE TABLE [Site](
    odSite_id int PRIMARY KEY,
	siteName NVarchar(50) NOT NULL UNIQUE,
	streetAddress NVarchar(255) NOT NULL,
	city NVarchar(50) NOT NULL,
	[state] NVarchar (2) NOT NULL,
	zip Nvarchar(9) NOT NULL,
	workPhoneNumber Nvarchar(10) NOT NULL,
	);
-- Creates GameOfficial Table
DROP TABLE IF EXISTS GameOfficial;
CREATE TABLE GameOfficial(
    odUser_id int NOT NULL UNIQUE,
	odGame_id int NOT NULL UNIQUE,
	odOfficiatingPosition_id int NOT NULL UNIQUE,
	CONSTRAINT PK_GameOfficial PRIMARY KEY (odUser_id,odGame_id,odOfficiatingPosition_id)
	);
-- Creates Game Table
DROP TABLE IF EXISTS Game;
CREATE TABLE Game(
    odGame_id int NOT NULL PRIMARY KEY,
	gameDateTime dateTime NOT NULL,
	odSportLevel_id int UNIQUE NOT NULL REFERENCES SportLevel(odSportLevel_id),
	odSiteName_id int NOT NULL UNIQUE REFERENCES [Site](odSite_id),
	homeTeam int NULL,
	vistingTeam int NULL,
	CONSTRAINT UC_Game UNIQUE (gameDateTime,odSportLevel_id,odSiteName_id)
	);
-- Creates School Table
DROP TABLE IF EXISTS School;
CREATE TABLE School(
    odSchool_id int NOT NULL PRIMARY KEY,
	schoolName NVarchar(50) NOT NULL UNIQUE,
	streetAddress NVarchar(255) NOT NULL,
	city NVarchar(50) NOT NULL,
	[state] NVarchar (2) NOT NULL,
	zip Nvarchar(9) NOT NULL,
	workPhoneNumber Nvarchar(10) NOT NULL,
	);

-- Adds Constraints
ALTER TABLE Game
ADD FOREIGN KEY (HomeTeam) REFERENCES School(odSchool_id);

ALTER TABLE Game
ADD FOREIGN KEY (vistingTeam) REFERENCES School(odSchool_id);

ALTER TABLE GameOfficial
ADD FOREIGN KEY (odUser_id) REFERENCES OfficialQualification(odUser_id);

ALTER TABLE GameOfficial
ADD FOREIGN KEY (odGame_id) REFERENCES Game(odGame_id);

ALTER TABLE GameOfficial
ADD FOREIGN KEY (odOfficiatingPosition_id) REFERENCES OfficiatingPosition(odOfficiatingPosition_id);

ALTER TABLE SecurityAnswer
ADD FOREIGN KEY (odUser_id) REFERENCES [User](odUser_id);

ALTER TABLE Arbiter
ADD FOREIGN KEY (odSportLevel_id) REFERENCES SportLevel(odSportLevel_id);

ALTER TABLE OfficialQualification
ADD FOREIGN KEY (odSportLevel_id) REFERENCES SportLevel(odSportLevel_id);

ALTER TABLE OfficialQualification
ADD FOREIGN KEY (odUser_id) REFERENCES GameOfficial(odUser_id);

ALTER TABLE OfficialQualification
ADD FOREIGN KEY (odOfficiatingPosition_id) REFERENCES OfficiatingPosition(odOfficiatingPosition_id);

