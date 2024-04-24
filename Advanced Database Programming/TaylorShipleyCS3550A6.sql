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
    odSecurityQuestion_id int NOT NULL IDENTITY,
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
    odUser_id int NOT NULL IDENTITY,
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
	odOfficiatingPosition_id int NOT NULL IDENTITY,
	positionName NVarchar(25) NOT NULL
);

-- Creates SportLevel Table
CREATE TABLE gosSportLevel(
	odSportLevel_id int NOT NULL IDENTITY,
	Sport NVarchar(25) NOT NULL,
	[Level] NVarchar(25) NOT NULL,
	Pay smallMoney,
);

-- Creates Site Table
CREATE TABLE gosSite(
    odSiteName_id int NOT NULL IDENTITY,
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
    odGame_id int NOT NULL IDENTITY,
	gameDateTime dateTime NOT NULL,
	odSportLevel_id int NOT NULL,
	odSiteName_id int NOT NULL,
	homeTeam int NULL,
	visitingTeam int NULL,
	);
	
-- Creates School Table
CREATE TABLE gosSchool(
    odSiteName_id int NOT NULL,
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

ALTER TABLE gosOfficiatingPosition
ADD PRIMARY KEY (odOfficiatingPosition_id);

ALTER TABLE gosSportLevel
ADD PRIMARY KEY (odSportLevel_id);

ALTER TABLE gosSite
ADD PRIMARY KEY (odSiteName_id);

ALTER TABLE gosGameOfficial
ADD CONSTRAINT PK_gosGameOfficial PRIMARY KEY (odUser_id, odGame_id, odOfficiatingPosition_id);

ALTER TABLE gosSchool
ADD PRIMARY KEY (odSiteName_id);

ALTER TABLE gosGame
ADD PRIMARY KEY (odGame_id);

-- Adds Alternate keys
ALTER TABLE gosSecurityQuestion
ADD UNIQUE (question);

ALTER TABLE gosUser
ADD UNIQUE (emailAddress);

ALTER TABLE gosArbiter
ADD UNIQUE (odUser_id);

ALTER TABLE gosArbiter
ADD UNIQUE (odSportLevel_id);

ALTER TABLE gosOfficiatingPosition
ADD UNIQUE (positionName);

ALTER TABLE gosSportLevel
ADD  CONSTRAINT UC_gosSportLevel UNIQUE (Sport,[Level]);

ALTER TABLE gosSite
ADD UNIQUE (siteName);
	
ALTER TABLE gosGame
ADD CONSTRAINT UC_gosGame UNIQUE (gameDateTime,odSportLevel_id,odSiteName_id);

ALTER TABLE gosSchool
ADD UNIQUE (schoolName);

-- Adds Foreign Keys
ALTER TABLE gosGame
ADD FOREIGN KEY (HomeTeam) REFERENCES gosSchool(odSiteName_id);

ALTER TABLE gosGame
ADD FOREIGN KEY (visitingTeam) REFERENCES gosSchool(odSiteName_id);

ALTER TABLE gosGameOfficial
ADD FOREIGN KEY (odUser_id) REFERENCES gosUser(odUser_id);

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
ADD FOREIGN KEY (odUser_id) REFERENCES gosUser(odUser_id);

ALTER TABLE gosOfficialQualification
ADD FOREIGN KEY (odOfficiatingPosition_id) REFERENCES gosOfficiatingPosition(odOfficiatingPosition_id);

ALTER TABLE gosGame
ADD FOREIGN KEY (odSportLevel_id) REFERENCES gosSportLevel(odSportLevel_id);
	
ALTER TABLE gosGame
ADD FOREIGN KEY (odSiteName_id) REFERENCES gosSite(odSiteName_id);



-- Insert Statements for User Table

INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('adambaxter@yahoo.com','Adam','Baxter','1969 N 250 E','Layton','UT','84041','8013183890','','8017743323',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('Sheldonb@hotmail.com','Sheldon','Bennett','770 OAKMONT LN.','Fruit Heights','UT','84037','8017260200','','',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('lbirdland@gmail.com','Lars','Birdland','527 Dartmouth Drive','Morgan','UT','84050','8019277676','8019277634','',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('marvdeyoung@outlook.com','Marv','DeYoung','1228 N 310 E','Layton','UT','84040','8016406046','','',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('john.eliason@gmail.com','John','Eliason','402 S 750 W','Riverdale','UT','84405','8017264706','','',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('shawnf@gmail.com','Shawn','Fernandez','4934 S. 3900 W.','Roy','UT','84067','8013645907','','8013685829',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('francis.morgan@gmail.com','Morgan','Francis','288 E Primrose Rd','Layton','UT','84040','8013098023','','8016226471',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('gardner1@comcast.net','Randy','Gardner','152 29TH STREET','Ogden','UT','84403','8016985376','8016212832','',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('rogtaylor@hotmail.com','Roger','Taylor','42 WEST 800 NORTH','Kaysville','UT','84037','8015044236','','',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('tommytaylor88@hotmail.com','Tommy','Taylor','42 WEST 800 NORTH','Kaysville','UT','84037','8015408756','','',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('jacksonthomas@yahoo.com','Jackson','Thomas','1923 N 200 E','Layton','UT','84041','8015097934','','',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('darrintreegold@yahoo.com','Darrin','Treegold','3449 Porter Avenue','OGDEN','UT','84403','8016216391','','',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('tannerthursday@gmail.com','Tanner','Thursday','1389 EASTRIDGE CIRCLE','Logan','UT','84321','4357505536','4357169667','4359940494',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('matt.troy@gmail.com','Matt','Troy','307 Homestead Crt.','Providence','UT','84332','4358113495','4352133959','4357132680',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('kevin.tracy@yahoo.com','Kevin','Tracy','4305A Appomattox Cir.','HAFB','UT','84056','2084042259','','',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('matt.tucker9@gmail.com','Matt','Tucker','504 East 2590 South','Bountiful','UT','84010','4355084520','','8018152350',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('trueandtrue@gmail.com','Davis','Turner','1149 South 620 West','Tremonton','UT','84337','4352303019','','',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('andrewunitoa@mail.weber.edu','Andrew','Unitoa','3477 Eccles Ave','Ogden','UT','84403','8019407854','','',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('cveibell@netzero.net','Charles','Veibell','3321 South 1200 West','Riverdale','UT','84405','8013024234','8017163685','',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('randell.waddington@aggiemail.usu.edu','Randell','Waddington','455 E 200 N Apartment 1C','Logan','UT','84321','8014156325','','',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('lester.walker@yahoo.com','Lester','Walker','308 Pear Lane','Bountiful','UT','84010','8016234958','','',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('jeff.wall76@gmail.com','Jeff','Wall','1586 W 1210 N','Farmington','UT','84025','8015241670','8014523949','',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('dannywallace@wsd.net','Danny','Wallace','346 E. 1275 North','North Ogden','UT','84414','8014101472','8017479446','8014524239',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('wallingtonscott@hotmail.com','Scott','Wallington','2971 Grandview Dr.','Ogden','UT','84403','8016103612','','',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('brett.ward@gmail.com','Brett','Ward','345 W. 360 N.','Smithfield','UT','84335','4355023694','','',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('davidwarren22@hotmail.com','David','Warren','2261 W 6025 S','Roy','UT','84067','8015184330','','',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('micah.w@aggiemail.usu.edu','Micah','Watkins','2351 N 500 E APT 211','Logan','UT','84341','8018072832','','',0.00,'Temppass1');
INSERT INTO gosUser (emailAddress, firstName, lastName, streetAddress, city, [state], zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password) VALUES ('mark.welch90@gmail.com','Mark','Welch','2320 West 5680 South','Roy','UT','84067','8014032468','','',0.00,'Temppass1');

-- Insert Statements for SecurityQuestion Table
INSERT INTO gosSecurityQuestion(question) VALUES('What was your childhood nickname?');
INSERT INTO gosSecurityQuestion(question) VALUES('In what city did you meet your spouse/significant other?');
INSERT INTO gosSecurityQuestion(question) VALUES('What is the name of your favorite childhood friend?');
INSERT INTO gosSecurityQuestion(question) VALUES('What street did you live on in third grade?');
INSERT INTO gosSecurityQuestion(question) VALUES('What is your oldest sibling�s birthday month and year? (e.g., January 1900)');
INSERT INTO gosSecurityQuestion(question) VALUES('What is the middle name of your youngest child?');

-- Insert Statements for SecurityAnswer
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,1,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,1,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,2,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,2,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,3,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,3,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,4,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,4,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,5,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,5,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,6,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,6,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,7,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,7,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,8,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,8,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,9,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,9,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,10,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,10,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,11,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,11,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,12,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,12,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,13,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,13,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,14,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,14,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,15,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,15,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,16,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,16,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,17,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,17,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,18,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,18,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,19,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,19,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,20,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,20,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,21,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,21,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,22,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,22,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,23,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,23,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,24,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,24,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,25,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,25,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,26,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,26,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,27,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,27,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (1,28,'TempAnswer');
INSERT INTO gosSecurityAnswer(odSecurityQuestion_id,odUser_id,answer) VALUES (2,28,'TempAnswer');

-- Insert Statements for SportLevel
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Football','Varsity',74);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Football','Junior Varsity',59);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Football','Sophomore',59);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Football','Freshman',59);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Volleyball','Varsity',59);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Volleyball','Junior Varsity',49);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Volleyball','Sophomore',49);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Volleyball','Freshman',49);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Basketball Men','Varsity',69);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Basketball Men','Junior Varsity',59);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Basketball Men','Sophomore',59);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Basketball Men','Freshman',59);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Basketball Women','Varsity',69);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Basketball Women','Junior Varsity',59);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Basketball Women','Sophomore',59);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Basketball Women','Freshman',59);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Baseball','Varsity',69);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Baseball','Junior Varsity',59);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Baseball','Sophomore',59);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Baseball','Freshman',59);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Softball','Varsity',59);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Softball','Junior Varsity',49);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Softball','Sophomore',49);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Softball','Freshman',49);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Soccer Men','Varsity',69);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Soccer Men','Junior Varsity',49);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Soccer Men','Sophomore',49);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Soccer Men','Freshman',49);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Soccer Women','Varsity',69);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Soccer Women','Junior Varsity',49);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Soccer Women','Sophomore',49);
INSERT INTO gosSportLevel (Sport, [Level], Pay) VALUES ('Soccer Women','Freshman',49);

-- Insert Statements for Site Table
INSERT INTO gosSite(SiteName, workPhoneNumber, streetAddress, city, state, zip) VALUES ('Bear River High School',4352572500,'1450 S Main St','Garland','UT',843129797);
INSERT INTO gosSite(SiteName, workPhoneNumber, streetAddress, city, state, zip) VALUES ('Bountiful High School',8014023900,'695 Orchard Dr','Bountiful','UT',84010);
INSERT INTO gosSite(SiteName, workPhoneNumber, streetAddress, city, state, zip) VALUES ('Box Elder High School',4357344840,'380 S 600 W','Brigham City','UT',843022442);
INSERT INTO gosSite(SiteName, workPhoneNumber, streetAddress, city, state, zip) VALUES ('Clearfield High School',8014028200,'931� S Falcon Drive','Clearfield','UT',84015);
INSERT INTO gosSite(SiteName, workPhoneNumber, streetAddress, city, state, zip) VALUES ('Davis High School',8014028800,'325 S Main St','Kaysville','UT',840372598);
INSERT INTO gosSite(SiteName, workPhoneNumber, streetAddress, city, state, zip) VALUES ('Farmington High School',8014029050,'548 Glovers Ln','Farmington','UT',840250588);
INSERT INTO gosSite(SiteName, workPhoneNumber, streetAddress, city, state, zip) VALUES ('Fremont High School',8014524000,'1900 N 4700 W','Ogden','UT',84404);
INSERT INTO gosSite(SiteName, workPhoneNumber, streetAddress, city, state, zip) VALUES ('Layton High School',8014024800,'440 Wasatch Dr','Layton','UT',840413272);
INSERT INTO gosSite(SiteName, workPhoneNumber, streetAddress, city, state, zip) VALUES ('Logan High School',4357552380,'162 W 100 S','Logan','UT',843215298);
INSERT INTO gosSite(SiteName, workPhoneNumber, streetAddress, city, state, zip) VALUES ('Morgan High School',8018293418,'55 Trojan Blvd','Morgan','UT',840500917);
INSERT INTO gosSite(SiteName, workPhoneNumber, streetAddress, city, state, zip) VALUES ('Mountain Crest High School',4357927765,'255 South 800 East','Hyrum','UT',84319);
INSERT INTO gosSite(SiteName, workPhoneNumber, streetAddress, city, state, zip) VALUES ('Northridge High School',8014028500,'2430 N Hillfield Rd.','Layton','UT',84041);
INSERT INTO gosSite(SiteName, workPhoneNumber, streetAddress, city, state, zip) VALUES ('Roy High School',8017744922,'2150 W 4800 S','Roy','UT',840671899);
INSERT INTO gosSite(SiteName, workPhoneNumber, streetAddress, city, state, zip) VALUES ('Skyview High School',4355636273,'520 S 250 E','Smithfield','UT',843351699);
INSERT INTO gosSite(SiteName, workPhoneNumber, streetAddress, city, state, zip) VALUES ('Syracuse High School',8014027900,'665 S 2000 W','Syracuse','UT',84075);
INSERT INTO gosSite(SiteName, workPhoneNumber, streetAddress, city, state, zip) VALUES ('Weber High School',8017463700,'3650 N 500 W','Ogden','UT',844141455);

--Insert Statements for School Table
INSERT INTO gosSchool(odSiteName_id, schoolName, workPhoneNumber, streetAddress, city, state, zip) VALUES ((SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Bear River High School'), 'Bear River High School',4352572500,'1450 S Main St','Garland','UT',843129797);
INSERT INTO gosSchool(odSiteName_id, schoolName, workPhoneNumber, streetAddress, city, state, zip) VALUES ((SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Bountiful High School'), 'Bountiful High School',8014023900,'695 Orchard Dr','Bountiful','UT',84010);
INSERT INTO gosSchool(odSiteName_id, schoolName, workPhoneNumber, streetAddress, city, state, zip) VALUES ((SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Box Elder High School'), 'Box Elder High School',4357344840,'380 S 600 W','Brigham City','UT',843022442);
INSERT INTO gosSchool(odSiteName_id, schoolName, workPhoneNumber, streetAddress, city, state, zip) VALUES ((SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Clearfield High School'), 'Clearfield High School',8014028200,'931� S Falcon Drive','Clearfield','UT',84015);
INSERT INTO gosSchool(odSiteName_id, schoolName, workPhoneNumber, streetAddress, city, state, zip) VALUES ((SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Davis High School'), 'Davis High School',8014028800,'325 S Main St','Kaysville','UT',840372598);
INSERT INTO gosSchool(odSiteName_id, schoolName, workPhoneNumber, streetAddress, city, state, zip) VALUES ((SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Farmington High School'), 'Farmington High School',8014029050,'548 Glovers Ln','Farmington','UT',840250588);
INSERT INTO gosSchool(odSiteName_id, schoolName, workPhoneNumber, streetAddress, city, state, zip) VALUES ((SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Fremont High School'), 'Fremont High School',8014524000,'1900 N 4700 W','Ogden','UT',84404);
INSERT INTO gosSchool(odSiteName_id, schoolName, workPhoneNumber, streetAddress, city, state, zip) VALUES ((SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Layton High School'), 'Layton High School',8014024800,'440 Wasatch Dr','Layton','UT',840413272);
INSERT INTO gosSchool(odSiteName_id, schoolName, workPhoneNumber, streetAddress, city, state, zip) VALUES ((SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Logan High School'), 'Logan High School',4357552380,'162 W 100 S','Logan','UT',843215298);
INSERT INTO gosSchool(odSiteName_id, schoolName, workPhoneNumber, streetAddress, city, state, zip) VALUES ((SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Morgan High School'), 'Morgan High School',8018293418,'55 Trojan Blvd','Morgan','UT',840500917);
INSERT INTO gosSchool(odSiteName_id, schoolName, workPhoneNumber, streetAddress, city, state, zip) VALUES ((SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Mountain Crest High School'), 'Mountain Crest High School',4357927765,'255 South 800 East','Hyrum','UT',84319);
INSERT INTO gosSchool(odSiteName_id, schoolName, workPhoneNumber, streetAddress, city, state, zip) VALUES ((SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Northridge High School'), 'Northridge High School',8014028500,'2430 N Hillfield Rd.','Layton','UT',84041);
INSERT INTO gosSchool(odSiteName_id, schoolName, workPhoneNumber, streetAddress, city, state, zip) VALUES ((SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Roy High School'), 'Roy High School',8017744922,'2150 W 4800 S','Roy','UT',840671899);
INSERT INTO gosSchool(odSiteName_id, schoolName, workPhoneNumber, streetAddress, city, state, zip) VALUES ((SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Skyview High School'), 'Skyview High School',4355636273,'520 S 250 E','Smithfield','UT',843351699);
INSERT INTO gosSchool(odSiteName_id, schoolName, workPhoneNumber, streetAddress, city, state, zip) VALUES ((SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Syracuse High School'), 'Syracuse High School',8014027900,'665 S 2000 W','Syracuse','UT',84075);
INSERT INTO gosSchool(odSiteName_id, schoolName, workPhoneNumber, streetAddress, city, state, zip) VALUES ((SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Weber High School'), 'Weber High School',8017463700,'3650 N 500 W','Ogden','UT',844141455);

-- Insert Statements for Game Table
INSERT INTO gosGAME(gameDateTime,odSportLevel_id,odSiteName_id, homeTeam, visitingTeam) VALUES('20220826 07:00:00 PM', (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Northridge High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Northridge High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Davis High School'));
INSERT INTO gosGAME(gameDateTime,odSportLevel_id,odSiteName_id, homeTeam, visitingTeam) VALUES('20220826 07:00:00 PM', (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Fremont High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Fremont High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Roy High School'));
INSERT INTO gosGAME(gameDateTime,odSportLevel_id,odSiteName_id, homeTeam, visitingTeam) VALUES('20220826 07:00:00 PM', (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Layton High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Layton High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Syracuse High School'));
INSERT INTO gosGAME(gameDateTime,odSportLevel_id,odSiteName_id, homeTeam, visitingTeam) VALUES('20220826 07:00:00 PM', (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odSiteName_id FROM gosSite WHERE SiteName = 'ClearField High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'ClearField High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Weber High School'));
INSERT INTO gosGAME(gameDateTime,odSportLevel_id,odSiteName_id, homeTeam, visitingTeam) VALUES('20220825 06:30:00 PM', (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Varsity'), (SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Morgan High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Morgan High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Bountiful High School'));
INSERT INTO gosGAME(gameDateTime,odSportLevel_id,odSiteName_id, homeTeam, visitingTeam) VALUES('20220825 06:30:00 PM', (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Varsity'), (SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Skyview High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Skyview High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Box Elder High School'));
INSERT INTO gosGAME(gameDateTime,odSportLevel_id,odSiteName_id, homeTeam, visitingTeam) VALUES('20220825 06:30:00 PM', (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Varsity'), (SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Farmington High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Farmington High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Logan High School'));
INSERT INTO gosGAME(gameDateTime,odSportLevel_id,odSiteName_id, homeTeam, visitingTeam) VALUES('20220825 06:30:00 PM', (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Varsity'), (SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Bear River High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Bear River High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Layton High School'));
INSERT INTO gosGAME(gameDateTime,odSportLevel_id,odSiteName_id, homeTeam, visitingTeam) VALUES('20220825 05:00:00 PM', (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Junior Varsity'), (SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Morgan High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Morgan High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Bountiful High School'));
INSERT INTO gosGAME(gameDateTime,odSportLevel_id,odSiteName_id, homeTeam, visitingTeam) VALUES('20220825 05:00:00 PM', (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Junior Varsity'), (SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Skyview High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Skyview High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Box Elder High School'));
INSERT INTO gosGAME(gameDateTime,odSportLevel_id,odSiteName_id, homeTeam, visitingTeam) VALUES('20220825 05:00:00 PM', (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Junior Varsity'), (SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Farmington High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Farmington High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Logan High School'));
INSERT INTO gosGAME(gameDateTime,odSportLevel_id,odSiteName_id, homeTeam, visitingTeam) VALUES('20220825 05:00:00 PM', (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Junior Varsity'), (SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Bear River High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Bear River High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Layton High School'));
INSERT INTO gosGAME(gameDateTime,odSportLevel_id,odSiteName_id, homeTeam, visitingTeam) VALUES('20220825 03:30:00 PM', (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Sophomore'), (SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Morgan High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Morgan High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Bountiful High School'));
INSERT INTO gosGAME(gameDateTime,odSportLevel_id,odSiteName_id, homeTeam, visitingTeam) VALUES('20220825 03:30:00 PM', (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Sophomore'), (SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Skyview High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Skyview High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Box Elder High School'));
INSERT INTO gosGAME(gameDateTime,odSportLevel_id,odSiteName_id, homeTeam, visitingTeam) VALUES('20220825 03:30:00 PM', (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Sophomore'), (SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Farmington High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Farmington High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Logan High School'));
INSERT INTO gosGAME(gameDateTime,odSportLevel_id,odSiteName_id, homeTeam, visitingTeam) VALUES('20220825 03:30:00 PM', (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Sophomore'), (SELECT odSiteName_id FROM gosSite WHERE SiteName = 'Bear River High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Bear River High School'), (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = 'Layton High School'));

-- Insert Statements for the table OfficiatingPosition
INSERT INTO gosOfficiatingPosition(positionName) VALUES('Referee');
INSERT INTO gosOfficiatingPosition(positionName) VALUES('Umpire');
INSERT INTO gosOfficiatingPosition(positionName) VALUES('Back Judge')
INSERT INTO gosOfficiatingPosition(positionName) VALUES('Head Linesman');
INSERT INTO gosOfficiatingPosition(positionName) VALUES('Line Judge');

-- Insert Statements for the table Official Qualification
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'rogtaylor@hotmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'matt.troy@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'cveibell@netzero.net'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'wallingtonscott@hotmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'tommytaylor88@hotmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'kevin.tracy@yahoo.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'randell.waddington@aggiemail.usu.edu'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'brett.ward@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'jacksonthomas@yahoo.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Back Judge'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'matt.tucker9@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Back Judge'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'lester.walker@yahoo.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Back Judge'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'davidwarren22@hotmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Back Judge'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'darrintreegold@yahoo.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Head Linesman'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'trueandtrue@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Head Linesman'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'jeff.wall76@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Head Linesman'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'micah.w@aggiemail.usu.edu'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Head Linesman'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'tannerthursday@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Line Judge'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'andrewunitoa@mail.weber.edu'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Line Judge'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'dannywallace@wsd.net'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Line Judge'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'mark.welch90@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Football' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Line Judge'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'adambaxter@yahoo.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'adambaxter@yahoo.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Junior Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'adambaxter@yahoo.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Sophomore'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'adambaxter@yahoo.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Freshman'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'lbirdland@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'lbirdland@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Junior Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'lbirdland@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Sophomore'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'lbirdland@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Freshman'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'john.eliason@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'john.eliason@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Junior Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'john.eliason@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Sophomore'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'john.eliason@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Freshman'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'francis.morgan@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'francis.morgan@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Junior Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'francis.morgan@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Sophomore'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'francis.morgan@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Freshman'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'Sheldonb@hotmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'Sheldonb@hotmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Junior Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'Sheldonb@hotmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Sophomore'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'Sheldonb@hotmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Freshman'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'marvdeyoung@outlook.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'marvdeyoung@outlook.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Junior Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'marvdeyoung@outlook.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Sophomore'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'marvdeyoung@outlook.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Freshman'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'shawnf@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'shawnf@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Junior Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'shawnf@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Sophomore'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'shawnf@gmail.com'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Freshman'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'gardner1@comcast.net'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'gardner1@comcast.net'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Junior Varsity'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'gardner1@comcast.net'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Sophomore'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosOfficialQualification(odUser_id, odSportLevel_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUSER WHERE emailAddress = 'gardner1@comcast.net'), (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = 'Volleyball' AND [Level] = 'Freshman'), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));

-- Insert Statements for Game Official Table
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'adambaxter@yahoo.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 06:30:00 PM' AND odSportLevel_id = 5 AND odSiteName_id = 10), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'adambaxter@yahoo.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 05:00:00 PM' AND odSportLevel_id = 6 AND odSiteName_id = 10), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'adambaxter@yahoo.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 03:30:00 PM' AND odSportLevel_id = 7 AND odSiteName_id = 10), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'andrewunitoa@mail.weber.edu'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220826 07:00:00 PM' AND odSportLevel_id = 1 AND odSiteName_id = 7), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Line Judge'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'brett.ward@gmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220826 07:00:00 PM' AND odSportLevel_id = 1 AND odSiteName_id = 4), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'cveibell@netzero.net'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220826 07:00:00 PM' AND odSportLevel_id = 1 AND odSiteName_id = 8), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'dannywallace@wsd.net'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220826 07:00:00 PM' AND odSportLevel_id = 1 AND odSiteName_id = 8), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Line Judge'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'darrintreegold@yahoo.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220826 07:00:00 PM' AND odSportLevel_id = 1 AND odSiteName_id = 12), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Head Linesman'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'davidwarren22@hotmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220826 07:00:00 PM' AND odSportLevel_id = 1 AND odSiteName_id = 4), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Back Judge'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'trueandtrue@gmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220826 07:00:00 PM' AND odSportLevel_id = 1 AND odSiteName_id = 7), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Head Linesman'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'jacksonthomas@yahoo.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220826 07:00:00 PM' AND odSportLevel_id = 1 AND odSiteName_id = 12), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Back Judge'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'jeff.wall76@gmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220826 07:00:00 PM' AND odSportLevel_id = 1 AND odSiteName_id = 8), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Head Linesman'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'john.eliason@gmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 06:30:00 PM' AND odSportLevel_id = 5 AND odSiteName_id = 6), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'john.eliason@gmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 05:00:00 PM' AND odSportLevel_id = 6 AND odSiteName_id = 6), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'john.eliason@gmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 03:30:00 PM' AND odSportLevel_id = 7 AND odSiteName_id = 6), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'kevin.tracy@yahoo.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220826 07:00:00 PM' AND odSportLevel_id = 1 AND odSiteName_id = 7), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'lbirdland@gmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 06:30:00 PM' AND odSportLevel_id = 5 AND odSiteName_id = 14), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'lbirdland@gmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 05:00:00 PM' AND odSportLevel_id = 6 AND odSiteName_id = 14), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'lbirdland@gmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 03:30:00 PM' AND odSportLevel_id = 7 AND odSiteName_id = 14), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'lester.walker@yahoo.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220826 07:00:00 PM' AND odSportLevel_id = 1 AND odSiteName_id = 8), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Back Judge'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'mark.welch90@gmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220826 07:00:00 PM' AND odSportLevel_id = 1 AND odSiteName_id = 4), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Line Judge'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'marvdeyoung@outlook.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 06:30:00 PM' AND odSportLevel_id = 5 AND odSiteName_id = 14), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'marvdeyoung@outlook.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 05:00:00 PM' AND odSportLevel_id = 6 AND odSiteName_id = 14), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'marvdeyoung@outlook.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 03:30:00 PM' AND odSportLevel_id = 7 AND odSiteName_id = 14), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'matt.troy@gmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220826 07:00:00 PM' AND odSportLevel_id = 1 AND odSiteName_id = 7), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'matt.tucker9@gmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220826 07:00:00 PM' AND odSportLevel_id = 1 AND odSiteName_id = 7), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Back Judge'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'micah.w@aggiemail.usu.edu'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220826 07:00:00 PM' AND odSportLevel_id = 1 AND odSiteName_id = 4), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Head Linesman'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'francis.morgan@gmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 06:30:00 PM' AND odSportLevel_id = 5 AND odSiteName_id = 1), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'francis.morgan@gmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 05:00:00 PM' AND odSportLevel_id = 6 AND odSiteName_id = 1), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'francis.morgan@gmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 03:30:00 PM' AND odSportLevel_id = 7 AND odSiteName_id = 1), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'randell.waddington@aggiemail.usu.edu'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220826 07:00:00 PM' AND odSportLevel_id = 1 AND odSiteName_id = 8), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'gardner1@comcast.net'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 06:30:00 PM' AND odSportLevel_id = 5 AND odSiteName_id = 1), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'gardner1@comcast.net'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 05:00:00 PM' AND odSportLevel_id = 6 AND odSiteName_id = 1), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'gardner1@comcast.net'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 03:30:00 PM' AND odSportLevel_id = 7 AND odSiteName_id = 1), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'rogtaylor@hotmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220826 07:00:00 PM' AND odSportLevel_id = 1 AND odSiteName_id = 12), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'wallingtonscott@hotmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220826 07:00:00 PM' AND odSportLevel_id = 1 AND odSiteName_id = 4), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Referee'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'shawnf@gmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 06:30:00 PM' AND odSportLevel_id = 5 AND odSiteName_id = 6), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'shawnf@gmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 05:00:00 PM' AND odSportLevel_id = 6 AND odSiteName_id = 6), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'shawnf@gmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 03:30:00 PM' AND odSportLevel_id = 7 AND odSiteName_id = 6), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'Sheldonb@hotmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 06:30:00 PM' AND odSportLevel_id = 5 AND odSiteName_id = 10), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'Sheldonb@hotmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 05:00:00 PM' AND odSportLevel_id = 6 AND odSiteName_id = 10), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'Sheldonb@hotmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220825 03:30:00 PM' AND odSportLevel_id = 7 AND odSiteName_id = 10), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'tannerthursday@gmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220826 07:00:00 PM' AND odSportLevel_id = 1 AND odSiteName_id = 12), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Line Judge'));
INSERT INTO gosGameOfficial(odUser_id, odGame_id, odOfficiatingPosition_id) VALUES((SELECT odUser_id FROM gosUser WHERE emailAddress = 'tommytaylor88@hotmail.com'), (SELECT odGame_id FROM gosGame WHERE gameDateTime = '20220826 07:00:00 PM' AND odSportLevel_id = 1 AND odSiteName_id = 12), (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE PositionName = 'Umpire'));

-- Select statements to test the inserts were done correctly
SELECT 'This is table' AS "gosSecurityQuestion";
SELECT * FROM gosSecurityQuestion;
SELECT 'This is table' AS "gosSecurityAnswer";
SELECT * FROM gosSecurityAnswer;
SELECT 'This is table' AS "gosUser";
SELECT * FROM gosUser;
SELECT 'This is table' AS "gosArbiter";
SELECT * FROM gosArbiter;
SELECT 'This is table' AS "gosOfficialQualification";
SELECT * FROM gosOfficialQualification;
SELECT 'This is table' AS "gosOfficiatingPosition";
SELECT * FROM gosOfficiatingPosition;
SELECT 'This is table' AS "gosSportLevel";
SELECT * FROM gosSportLevel;
SELECT 'This is table' AS "gosSite";
SELECT * FROM gosSite;
SELECT 'This is table' AS "gosGameOfficial";
SELECT * FROM gosGameOfficial;
SELECT 'This is table' AS "gosGame";
SELECT * FROM gosGame;
SELECT 'This is table' AS "gosSchool";
SELECT * FROM gosSchool;