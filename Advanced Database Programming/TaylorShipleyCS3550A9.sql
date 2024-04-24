-- GameOfficialScheduler 
-- CS3550 
-- <Taylor Shipley>

USE [master];
GO
-- Drops Database and creates new one
DROP DATABASE IF EXISTS GameOfficialScheduler;
CREATE DATABASE GameOfficialScheduler;

USE [GameOfficialScheduler];
GO

-- Drops Tables
DROP TABLE IF EXISTS gosSecurityQuestion;
DROP TABLE IF EXISTS gosSecurityAnswer;
DROP TABLE IF EXISTS gosUser;
DROP TABLE IF EXISTS gosOfficialQualification;
DROP TABLE IF EXISTS gosOfficiatingPosition;
DROP TABLE IF EXISTS gosSportLevel;
DROP TABLE IF EXISTS gosArbiter;
DROP TABLE IF EXISTS gosSite;
DROP TABLE IF EXISTS gosGameOfficial;
DROP TABLE IF EXISTS gosGame;
DROP TABLE IF EXISTS gosSchool;
DROP TABLE IF EXISTS gosGameOfficialPaymentHistory;

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

-- Creates Arbiter Table
CREATE TABLE gosArbiter(
 odUser_id int NOT NULL,
 odSportLevel_id int NOT NULL,
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
	athleticDirector NVarchar(255) NULL
	);

-- Creates Game-Official Payment History Table
CREATE TABLE gosGameOfficialPaymentHistory(
odPaymentHistory_id int NOT NULL IDENTITY
, odUser_id int NOT NULL
, odGame_id int NOT NULL
, odOfficiatingPosition_id int NOT NULL
, paymentAmount smallMoney Not Null
)

--Adds Primary Keys
ALTER TABLE gosSecurityQuestion
Add PRIMARY KEY (odSecurityQuestion_id);

ALTER TABLE gosSecurityAnswer
ADD CONSTRAINT PK_gosSecurityAnswer PRIMARY KEY (odUser_id,odSecurityQuestion_id);

ALTER TABLE gosUser
ADD PRIMARY KEY (odUser_id);

ALTER TABLE gosArbiter
ADD CONSTRAINT PK_gosArbiter PRIMARY KEY (odUser_id, odSportLevel_id);

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

ALTER TABLE gosGameOfficialPaymentHistory
ADD PRIMARY KEY (odPaymentHistory_id)

-- Adds Alternate keys
ALTER TABLE gosSecurityQuestion
ADD UNIQUE (question);

ALTER TABLE gosUser
ADD UNIQUE (emailAddress);

ALTER TABLE gosOfficiatingPosition
ADD UNIQUE (positionName);

ALTER TABLE gosSportLevel
ADD CONSTRAINT UC_gosSportLevel UNIQUE (Sport,[Level]);

ALTER TABLE gosSite
ADD UNIQUE (siteName);
	
ALTER TABLE gosGame
ADD CONSTRAINT UC_gosGame UNIQUE (gameDateTime,odSportLevel_id,odSiteName_id);

ALTER TABLE gosSchool
ADD UNIQUE (schoolName);

ALTER TABLE gosGameOfficialPaymentHistory
ADD CONSTRAINT PK_gosGameOfficialPaymentHistory UNIQUE (odUser_id, odGame_id, odOfficiatingPosition_id);

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

ALTER TABLE gosGameOfficialPaymentHistory
ADD FOREIGN KEY(odUser_id) REFERENCES gosUser(odUser_id);

ALTER TABLE gosGameOfficialPaymentHistory
ADD FOREIGN KEY(odGame_id) REFERENCES gosGame(odGame_id);

ALTER TABLE gosGameOfficialPaymentHistory
ADD FOREIGN KEY(odOfficiatingPosition_id) REFERENCES gosOfficiatingPosition(odOfficiatingPosition_id);

--Functions
-- Create procedure to retrieve error information.  
IF EXISTS (SELECT * FROM Information_schema.Routines WHERE specific_name = 'usp_GetErrorInfo')   
    DROP PROCEDURE [dbo].usp_GetErrorInfo;  
GO  
CREATE PROCEDURE usp_GetErrorInfo  
AS  
SELECT  
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;  
GO  

-- Create Function getUserID
IF EXISTS
(SELECT * FROM sysobjects WHERE id=OBJECT_id(N'[dbo].udf_getUserID'))
DROP FUNCTION [dbo].udf_getUserID;
GO
CREATE FUNCTION [dbo].udf_getUserID
(@emailAddress NVarchar(255))
RETURNS INT
AS
BEGIN
	DECLARE @odUser_id INT;

		SELECT @odUser_id = @odUser_id
		FROM gosUser WHERE emailAddress = @emailAddress

	IF @odUser_id IS NULL
	SET @odUser_id = -1;

	RETURN @odUser_id
END

GO

-- Create Function getQuestionID
IF EXISTS
(SELECT * FROM sysobjects WHERE id=OBJECT_id(N'[dbo].udf_getQuestionID'))
DROP FUNCTION [dbo].udf_getQuestionID;
GO
CREATE FUNCTION [dbo].udf_getQuestionID
(@question NVarchar(255))
RETURNS INT
AS
BEGIN
	DECLARE @odSecurityQuestion_id INT;

		SELECT @odSecurityQuestion_id = odSecurityQuestion_id
		FROM gosSecurityQuestion WHERE question = @question

	IF @odSecurityQuestion_id IS NULL
	SET @odSecurityQuestion_id = -1;

	RETURN @odSecurityQuestion_id
END

GO

-- Create Function getSchoolID
IF EXISTS
(SELECT * FROM sysobjects WHERE id=OBJECT_id(N'[dbo].udf_getSchoolID'))
DROP FUNCTION [dbo].udf_getSchoolID;
GO
CREATE FUNCTION [dbo].udf_getSchoolID
(@schoolName NVarchar(50))

RETURNS INT
AS
BEGIN
	DECLARE @odSite_id INT;

		SELECT @odSite_id = odSiteName_id
		FROM gosSchool WHERE schoolName = @schoolName

	IF @odSite_id IS NULL
	SET @odSite_id = -1;

	RETURN @odSite_id
END

GO

-- Create Function getSportLevelID
IF EXISTS
(SELECT * FROM sysobjects WHERE id=OBJECT_id(N'[dbo].udf_getSportLevelID'))
DROP FUNCTION [dbo].udf_getSportLevelID;
GO
CREATE FUNCTION [dbo].udf_getSportLevelID
(
@Sport NVarchar(25)
, @Level NVarchar(25)
)

RETURNS INT
AS
BEGIN
	DECLARE @odSportLevel_id INT;

		SELECT @odSportLevel_id = odSportLevel_id
		FROM gosSportLevel WHERE Sport = @Sport AND [Level] = @Level

	IF @odSportLevel_id IS NULL
	SET @odSportLevel_id = -1;

	RETURN @odSportLevel_id
END

GO

-- Create Function getSiteID
IF EXISTS
(SELECT * FROM sysobjects WHERE id=OBJECT_id(N'[dbo].udf_getSiteID.'))
DROP FUNCTION [dbo].udf_getSiteID;
GO
CREATE FUNCTION [dbo].udf_getSiteID
(@siteName NVarchar(50))
RETURNS INT
AS
BEGIN
	DECLARE @odSite_id INT;

		SELECT @odSite_id = odSiteName_id
		FROM gosSite WHERE siteName = @siteName

	IF @odSite_id IS NULL
	SET @odSite_id = -1;

	RETURN @odSite_id
END

GO

-- Create Function getGameID
IF EXISTS
(SELECT * FROM sysobjects WHERE id=OBJECT_id(N'[dbo].udf_getGameID.'))
DROP FUNCTION [dbo].udf_getGameID;
GO
CREATE FUNCTION [dbo].udf_getGameID
(
@siteName NVarchar(50)
, @sport NVarchar(25)
, @level NVarchar(25)
, @gameDateTime dateTime
)
RETURNS INT
AS
BEGIN
	DECLARE @odGame_id INT;

		SELECT @odGame_id = odGame_id
		FROM gosGame WHERE odSportLevel_id = (SELECT [dbo].udf_getSportLevelID(@sport,@level)) 
		AND odSiteName_id = (SELECT [dbo].udf_getSiteID(@siteName))
		AND gameDateTime = @gameDateTime

	IF @odGame_id IS NULL
	SET @odGame_id = -1;

	RETURN @odGame_id
END

GO

-- Create Function getPositionID
IF EXISTS
(SELECT * FROM sysobjects WHERE id=OBJECT_id(N'[dbo].udf_getPositionID.'))
DROP FUNCTION [dbo].udf_getPositionID;
GO
CREATE FUNCTION [dbo].udf_getPositionID
(@positionName NVarchar(25))
RETURNS INT
AS
BEGIN
	DECLARE @odPosition_id INT;

		SELECT @odPosition_id = odOfficiatingPosition_id
		FROM gosOfficiatingPosition WHERE positionName = @positionName

	IF @odPosition_id IS NULL
	SET @odPosition_id = -1;

	RETURN @odPosition_id
END

GO

-- Procedures 
-- Create addUser PROCEDURE
IF EXISTS (SELECT * FROM information_schema.Routines WHERE specific_name = 'usp_addUser')
DROP Procedure usp_addUser;
GO

CREATE PROCEDURE [dbo].usp_addUser
	@emailAddress NVarchar(255)
,	@firstName NVarchar(25)
,	@lastName NVarchar(50)
,	@streetAddress NVarchar(255)
,	@city Nvarchar(50)
,	@state NVarchar(2)
,	@zip Nvarchar(9)
,	@cellPhoneNumber NVarchar(10)
,	@homePhoneNumber NVarchar(10)
,	@workPhoneNumber NVarchar(10)
,	@feesAccumulated smallMoney
,	@password Nvarchar(255)

AS
BEGIN

	BEGIN TRY
		INSERT INTO gosUser
		(emailAddress, firstName, lastName, streetAddress, city, state, zip, cellPhoneNumber, homePhoneNumber, workPhoneNumber, feesAccumulated, password)
		VALUES (	
		@emailAddress
	,	@firstName
	,	@lastName
	,	@streetAddress
	,	@city
	,	@state
	,	@zip
	,	@cellPhoneNumber
	,	@homePhoneNumber
	,	@workPhoneNumber
	,	@feesAccumulated
	,	@password
	);
	END TRY

	BEGIN CATCH
		EXECUTE usp_GetErrorInfo;  
		PRINT 'The INSERT into gosUser table failed for EmailAddress: ' +@emailAddress +', FirstName: '+ @firstName +', LastName: ' +@lastName
			+ ', streetAddress: '+@streetAddress+ ', City: '+@city+ ', State: '+ @state+ ', Zip: '+@zip
			+ ', cellPhoneNumber: ' +@cellPhoneNumber+ ', homePhoneNumber: '+@homePhoneNumber+ ', workPhoneNumber: '+@workPhoneNumber
			+ ', feesAccumulated: ' +@feesAccumulated+ ', password: ' +@password
	END CATCH
END

GO

-- Create addQuestion PROCEDURE
IF EXISTS (SELECT * FROM Information_schema.Routines WHERE specific_name = 'usp_addSecurityQuestion')
DROP PROCEDURE usp_addSecurityQuestion;
GO

CREATE PROCEDURE [dbo].usp_addSecurityQuestion
 @question NVarchar(255)

 AS
 BEGIN
	BEGIN TRY
		INSERT INTO gosSecurityQuestion
		(question)
		VALUES
		(@question);
	END TRY

	BEGIN CATCH
		EXECUTE usp_GetErrorInfo;
		PRINT 'The INSERT into gosSecurityQuestion failed for Question: ' + @question
	END CATCH
END

GO

-- Create addSecurityAnswer PROCEDURE
IF EXISTS (SELECT * FROM Information_schema.Routines WHERE specific_name = 'usp_addSecurityAnswer')
DROP PROCEDURE usp_addSecurityAnswer;
GO

CREATE PROCEDURE [dbo].usp_addSecurityAnswer
@emailAddress NVarchar(255)
, @question Nvarchar(255)
, @answer NVarchar(255)

As
BEGIN
	BEGIN TRY
		INSERT INTO gosSecurityAnswer
		(odUser_id, odSecurityQuestion_id, answer)
		VALUES
		(
		(SELECT odUser_id FROM gosUser WHERE emailAddress = @emailAddress)
		, (SELECT odSecurityQuestion_id FROM gosSecurityQuestion WHERE question = @question)
		, @answer
		);
	END TRY

	BEGIN CATCH
		EXECUTE usp_GetErrorInfo; 
		PRINT 'The INSERT into gosSecurityAnswer failed for EmailAddress: '+ @emailAddress +', Question: '+@question+ ', Answer: '+@answer
	END CATCH
END
GO

-- Create addSportLevel Procedure
IF EXISTS (SELECT * FROM Information_schema.Routines WHERE specific_name = 'usp_addSportLevel')
DROP PROCEDURE usp_addSportLevel;
GO
CREATE PROCEDURE [dbo].usp_addSportLevel
@Sport NVarchar(25)
, @Level Nvarchar(25)
, @Pay smallMoney

As
BEGIN
	BEGIN TRY
		INSERT INTO gosSportLevel
		(Sport, [Level], Pay)
		VALUES
		(
		 @Sport
		, @Level
		, @Pay
		);
	END TRY

	BEGIN CATCH
		EXECUTE usp_GetErrorInfo; 
		PRINT 'The INSERT into gosSportLevel failed for : Sport:'+ @Sport +', Level: '+@Level+ ', Pay: '+@Pay
	END CATCH
END
GO

-- Create addArbiter Procedure
IF EXISTS (SELECT * FROM Information_schema.Routines WHERE specific_name = 'usp_addArbiter')
DROP PROCEDURE usp_addArbiter;
GO

CREATE PROCEDURE [dbo].usp_addArbiter
@emailAddress NVarchar(255)
, @Sport NVarchar(25)
, @Level NVarchar(25)

As
BEGIN
	BEGIN TRY
		INSERT INTO gosArbiter
		(odUser_id, odSportLevel_id)
		VALUES
		(
		(SELECT odUser_id FROM gosUser WHERE emailAddress = @emailAddress)
		 , (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = @Sport AND [Level] = @Level)
		);
	END TRY

	BEGIN CATCH
		EXECUTE usp_GetErrorInfo; 
		PRINT 'The INSERT into gosArbiter failed for : emailAddress:'+ @emailAddress +', Sport: '+@Sport+ ', Level: '+@Level
	END CATCH
END
GO

-- Create addSite Procedure
IF EXISTS (SELECT * FROM Information_schema.Routines WHERE specific_name = 'usp_addSite')
DROP PROCEDURE usp_addSite;
GO
CREATE PROCEDURE [dbo].usp_addSite
@SiteName NVarchar(50)
, @workPhoneNumber Nvarchar(10)
, @streetAddress NVarchar(255)
, @city Nvarchar(50)
, @state NVarchar(2)
, @zip NVarchar(9)

As
BEGIN
	BEGIN TRY
		INSERT INTO gosSite
		(SiteName, workPhoneNumber, streetAddress, city, [state], zip)
		VALUES
		(
		 @SiteName
		, @workPhoneNumber
		, @streetAddress
		, @city
		, @state
		, @zip
		);
	END TRY

	BEGIN CATCH
		EXECUTE usp_GetErrorInfo; 
		PRINT 'The INSERT into gosSite failed for : SiteName:'+ @SiteName +', workPhoneNumber: '+@workPhoneNumber+ ', streetAddress: '+@streetAddress+ ', City: '+@city+ ', State: '+ @state+ ', Zip: '+ @zip
	END CATCH
END
GO

-- Create addSchool Procedure
IF EXISTS (SELECT * FROM Information_schema.Routines WHERE specific_name = 'usp_addSchool')
DROP PROCEDURE usp_addSchool;
GO
CREATE PROCEDURE [dbo].usp_addSchool
@schoolName NVarchar(50)
, @workPhoneNumber Nvarchar(10)
, @streetAddress NVarchar(255)
, @city Nvarchar(50)
, @state NVarchar(2)
, @zip NVarchar(9)
, @athleticDirector NVarchar(255)

As
BEGIN
	BEGIN TRY
		INSERT INTO gosSchool
		(odSiteName_id, schoolName, workPhoneNumber, streetAddress, city, [state], zip, athleticDirector)
		VALUES
		(
		 (SELECT odSiteName_id FROM gosSite WHERE SiteName = @schoolName)
		, @schoolName
		, @workPhoneNumber
		, @streetAddress
		, @city
		, @state
		, @zip
		, @athleticDirector
		);
	END TRY

	BEGIN CATCH
		EXECUTE usp_GetErrorInfo; 
		PRINT 'The INSERT into gosSchool failed for : SchoolName:'+ @SchoolName +', workPhoneNumber: '+@workPhoneNumber+ ', streetAddress: '+@streetAddress+ ', City: '+@city+ ', State: '+ @state+ ', Zip: '+ @zip + ', athleticDirector '+ @athleticDirector
	END CATCH
END
GO

-- Create addGame Procedure
IF EXISTS (SELECT * FROM Information_schema.Routines WHERE specific_name = 'usp_addGame')
DROP PROCEDURE usp_addGame;
GO
CREATE PROCEDURE [dbo].usp_addGame
@gameDateTime dateTime
, @Sport NVarchar(25)
, @Level NVarchar(25)
, @siteName NVarchar(50)
, @homeTeam NVarchar(50)
, @visitingTeam NVarchar(50)

As
BEGIN
	BEGIN TRY
		INSERT INTO gosGame
		(gameDateTime, odSportLevel_id, odSiteName_id, homeTeam, visitingTeam)
		VALUES
		(
		 @gameDateTime
		 , (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = @Sport AND [Level] = @Level)
		 , (SELECT odSiteName_id FROM gosSite WHERE SiteName = @siteName)
		 , (SELECT odSiteName_id FROM gosSite WHERE SiteName = @homeTeam)
		 , (SELECT odSiteName_id FROM gosSchool WHERE SchoolName = @visitingTeam)
		);
	END TRY

	BEGIN CATCH
		EXECUTE usp_GetErrorInfo; 
		PRINT 'The INSERT into gosGame failed for : gameDateTime:'+ @gameDateTime +', Sport: '+@Sport+ ', Level: '+@Level+ ', HomeTeam_Name: '+@homeTeam+ ', VisistingTeam_Name: '+ @visitingTeam
	END CATCH
END
GO

-- Create addOfficiatingPosition Procedure
IF EXISTS (SELECT * FROM Information_schema.Routines WHERE specific_name = 'usp_addOfficiatingPosition')
DROP PROCEDURE usp_addOfficiatingPosition;
GO
CREATE PROCEDURE [dbo].usp_addOfficiatingPosition
@PositionName NVarchar(25)
As
BEGIN
	BEGIN TRY
		INSERT INTO gosOfficiatingPosition
		(positionName)
		VALUES
		(
		 @PositionName
		);
	END TRY

	BEGIN CATCH
		EXECUTE usp_GetErrorInfo; 
		PRINT 'The INSERT into gosOfficiatingPosition failed for : positionName:'+ @positionName
	END CATCH
END
GO

-- Create addOfficialQualification Procedure
IF EXISTS (SELECT * FROM Information_schema.Routines WHERE specific_name = 'usp_addOfficialQualification')
DROP PROCEDURE usp_addOfficialQualification;
GO
CREATE PROCEDURE [dbo].usp_addOfficialQualification
@emailAddress NVarchar(Max)
, @Sport NVarchar(25)
, @Level NVarchar(25)
, @PositionName NVarchar(25)

As
BEGIN
	BEGIN TRY
	INSERT INTO gosOfficialQualification
	(odUser_id, odSportLevel_id, odOfficiatingPosition_id)
	VALUES(
	(SELECT odUser_id FROM gosUser WHERE emailAddress = @emailAddress)
	, (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = @Sport AND [Level]= @Level)
	, (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE positionName = @PositionName)
	);
	END TRY

	BEGIN CATCH
		EXECUTE usp_GetErrorInfo; 
		PRINT 'The INSERT into gosOfficialQualification failed for : emailAddress: '+ @emailAddress +', Sport: '+ @Sport +', Level: '+@Level + ', PositionName: ' +@PositionName
	END CATCH
END
GO


-- Create addGameOfficial Procedure
IF EXISTS (SELECT * FROM Information_schema.Routines WHERE specific_name = 'usp_addGameOfficial')
DROP PROCEDURE usp_addGameOfficial;
GO
CREATE PROCEDURE [dbo].usp_addGameOfficial
@emailAddress NVarchar(Max)
, @gameDateTime dateTime
, @sport NVarchar(25)
, @level NVarchar(25)
, @siteName NVarchar(50)
, @positionName NVarchar(25)

As
BEGIN
	BEGIN TRY
	IF EXISTS (
		SELECT 1 FROM 
		gosGame g INNER JOIN gosGameOfficial goff
		ON g.odGame_id = goff.odGame_id
		INNER JOIN gosUser u
		ON goff.odUser_id = u.odUser_id
		WHERE u.emailAddress = @emailAddress AND g.gameDateTime = @gameDateTime
	) 
	BEGIN
		Print 'Cannot add official with email: ' +@emailAddress+ ' to game as they are already assigned to another game at the same time';
		/*SELECT 'Cannot add official with email: ' +@emailAddress+ ' to game as they are already assigned to the game below:' AS 'These are Invalid Conditions';
		SELECT g.odGame_id, g.gameDateTime, u.firstName, u.lastName, u.emailAddress, sl.Sport, sl.[Level], s.siteName, op.positionName
		FROM gosGame g 
		INNER JOIN gosGameOfficial goff
		ON g.odGame_id = goff.odGame_id
		INNER JOIN gosUser u
		ON goff.odUser_id = u.odUser_id
		INNER JOIN gosSite s
		ON g.odSiteName_id = s.odSiteName_id
		INNER JOIN gosSportLevel sl
		ON g.odSportLevel_id = sl.odSportLevel_id
		INNER JOIN gosOfficiatingPosition op
		ON goff.odOfficiatingPosition_id = op.odOfficiatingPosition_id
		WHERE u.emailAddress = @emailAddress AND g.gameDateTime = @gameDateTime*/
		RETURN
	END
	ELSE
		Begin
			INSERT INTO gosGameOfficial
			(odUser_id, odGame_id, odOfficiatingPosition_id)
			VALUES(
			(SELECT odUser_id FROM gosUser WHERE emailAddress = @emailAddress)
			, (SELECT odGame_id FROM gosGame WHERE gameDateTime = @gameDateTime AND odSportLevel_id = (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = @sport AND [Level]= @level) AND odSiteName_id= (SELECT odSiteName_id FROM gosSite WHERE siteName = @siteName))
			, (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE positionName = @positionName)
			);
		END
			END TRY
			BEGIN CATCH
				EXECUTE usp_GetErrorInfo; 
				PRINT 'The INSERT into gosGameOfficial failed for : emailAddress: '+ @emailAddress+ ' gameDateTime:'+ @gameDateTime +', Sport: '+ @Sport +', Level: '+@Level + ', SiteName: '+@siteName + ', PositionName: ' +@PositionName
			END CATCH
		END
GO

-- Create GameOfficialPayment Procedure
IF EXISTS (SELECT * FROM Information_schema.Routines WHERE specific_name = 'usp_GameOfficialPayment')
DROP PROCEDURE usp_GameOfficialPayment;
GO
CREATE PROCEDURE [dbo].usp_GameOfficialPayment
@emailAddress NVarchar(Max)
, @gameDateTime dateTime
, @sport NVarchar(25)
, @level NVarchar(25)
, @siteName NVarchar(50)
, @positionName NVarchar(25)

As
IF NOT EXISTS(SELECT 1 FROM gosGameOfficialPaymentHistory WHERE odUser_id = (SELECT odUser_id FROM gosUser WHERE emailAddress = @emailAddress)
	AND odGame_id = (SELECT odGame_id FROM gosGame WHERE gameDateTime = @gameDateTime AND odSportLevel_id = (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = @sport AND [Level]= @level) AND odSiteName_id= (SELECT odSiteName_id FROM gosSite WHERE siteName = @siteName))
	AND odOfficiatingPosition_id= (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE positionName = @positionName))
BEGIN
	BEGIN TRY
	UPDATE gosUser
	SET feesAccumulated = feesAccumulated + (SELECT pay from gosSportLevel WHERE Sport = @sport AND [Level] = @level)
	WHERE emailAddress = @emailAddress;

	INSERT INTO gosGameOfficialPaymentHistory 
	(odUser_id, odGame_id, odOfficiatingPosition_id, paymentAmount)
	VALUES(
	(SELECT odUser_id FROM gosUser WHERE emailAddress = @emailAddress)
	, (SELECT odGame_id FROM gosGame WHERE gameDateTime = @gameDateTime AND odSportLevel_id = (SELECT odSportLevel_id FROM gosSportLevel WHERE Sport = @sport AND [Level]= @level) AND odSiteName_id= (SELECT odSiteName_id FROM gosSite WHERE siteName = @siteName))
	, (SELECT odOfficiatingPosition_id FROM gosOfficiatingPosition WHERE positionName = @positionName)
	, (SELECT pay from gosSportLevel WHERE Sport = @sport AND [Level] = @level)
	);
	END TRY

	BEGIN CATCH
		EXECUTE usp_GetErrorInfo; 
		PRINT 'The INSERT into gosGameOfficial failed for: emailAddress: '+ @emailAddress +', Sport: '+ @Sport +', Level: '+@Level + ', SiteName: '+@siteName + ', PositionName: ' +@PositionName
	END CATCH
END
ELSE PRINT 'The INSERT into gosGameOfficial failed; Game Official was already paid for that game.'
GO
-- Adding Data via Stored Procedures
-- Execute addUser
EXECUTE usp_addUser @emailAddress= 'ack.devin@gmail.com' , @lastName = 'Ackerman' , @firstName = 'Devin', @streetAddress='3215 S 2500 W #2', @city= 'Roy', @state='UT', @zip='84067', @cellPhoneNumber='8012520239', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'refchrisadams@gmail.com' , @lastName = 'Adams' , @firstName = 'Chris', @streetAddress='358 West 200 North', @city= 'Kaysville', @state='UT', @zip='84037', @cellPhoneNumber='8016994403', @homePhoneNumber= NULL, @workPhoneNumber='8017774911',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'bga78@msn.com' , @lastName = 'Allen' , @firstName = 'Bryce', @streetAddress='470 E 180 N', @city= 'Smithfield', @state='UT', @zip='84335', @cellPhoneNumber='4357600623', @homePhoneNumber= '4355623710', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'grukmuk@msn.com' , @lastName = 'Allen' , @firstName = 'Randy', @streetAddress='3592 South 400 East', @city= 'Logan', @state='UT', @zip='84321', @cellPhoneNumber='4352321449', @homePhoneNumber= '4357557148', @workPhoneNumber='4357529456',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'tybar14@hotmail.com' , @lastName = 'Barfuss' , @firstName = 'Tyson', @streetAddress='2212 North 750 West', @city= 'Ogden', @state='UT', @zip='84414', @cellPhoneNumber='8015263903', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'adambaxter@yahoo.com' , @lastName = 'Baxter' , @firstName = 'Adam', @streetAddress='1969 N 250 E', @city= 'Layton', @state='UT', @zip='84041', @cellPhoneNumber='8013183890', @homePhoneNumber= NULL, @workPhoneNumber='8017743323',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'Sheldonb@hotmail.com' , @lastName = 'Bennett' , @firstName = 'Sheldon', @streetAddress='770 OAKMONT LN.', @city= 'Fruit Heights', @state='UT', @zip='84037', @cellPhoneNumber='8017260200', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'mikeb@aspen.com' , @lastName = 'Benson' , @firstName = 'Mike', @streetAddress='65 W. 1800 S.', @city= 'Bountiful', @state='UT', @zip='84010', @cellPhoneNumber='8017218613', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'paul.bernier@gmail.com' , @lastName = 'Bernier' , @firstName = 'Paul', @streetAddress='1145 N. 1120 W.', @city= 'Clinton', @state='UT', @zip='84015', @cellPhoneNumber='8017269342', @homePhoneNumber= '8017767584', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'lbirdland@gmail.com' , @lastName = 'Birdland' , @firstName = 'Lars', @streetAddress='527 Dartmouth Drive', @city= 'Morgan', @state='UT', @zip='84050', @cellPhoneNumber='8019277676', @homePhoneNumber= '8019277634', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'ldjbon@gmail.com' , @lastName = 'Bonnett' , @firstName = 'Larry', @streetAddress='2434 Gramercy Avenue', @city= 'Ogden', @state='UT', @zip='84401', @cellPhoneNumber='3302583674', @homePhoneNumber= '3852068476', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'jeffbraun8@gmail.com' , @lastName = 'Braun' , @firstName = 'Jeff', @streetAddress='3834 N 400 E', @city= 'Ogden', @state='UT', @zip='84414', @cellPhoneNumber='8013913437', @homePhoneNumber= '8017373482', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'ronbrenk@q.com' , @lastName = 'Brenkmann' , @firstName = 'Ron', @streetAddress='1550 N. 1750 W.', @city= 'Plain City', @state='UT', @zip='84404', @cellPhoneNumber='8016485447', @homePhoneNumber= '8017329136', @workPhoneNumber='8015367561',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'brownfgary@yahoo.com' , @lastName = 'Brown' , @firstName = 'Gary', @streetAddress='623 West 3050 South', @city= 'Syracuse', @state='UT', @zip='84075', @cellPhoneNumber='8016604529', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'davidbueller@yahoo.com' , @lastName = 'Bueller' , @firstName = 'David', @streetAddress='1050 E 1700 N', @city= 'Layton', @state='UT', @zip='84040', @cellPhoneNumber='8017253457', @homePhoneNumber= '8015107830', @workPhoneNumber='8017756878',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'burnettdan@hotmail.com' , @lastName = 'Burnett' , @firstName = 'Daniel', @streetAddress='P.O. Box 145', @city= 'Riverside', @state='UT', @zip='84334', @cellPhoneNumber='4352794156', @homePhoneNumber= '4354583232', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'bryanburningham@hotmail.com' , @lastName = 'Burningham' , @firstName = 'Bryan', @streetAddress='532 E 1250 N', @city= 'Bountiful', @state='UT', @zip='84010', @cellPhoneNumber='8016900329', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'kamburny@mstar.net' , @lastName = 'Burningham' , @firstName = 'Kamaron', @streetAddress='454 West 1850 South', @city= 'Woods Cross', @state='UT', @zip='840872112', @cellPhoneNumber='8015104833', @homePhoneNumber= '8012929489', @workPhoneNumber='8012986036',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'cartercarl_358@hotmail.com' , @lastName = 'Carter' , @firstName = 'Carl', @streetAddress='135 E 500 N', @city= 'Kaysville', @state='UT', @zip='84037', @cellPhoneNumber='8016820896', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'bobcarre@live.com' , @lastName = 'Christensen' , @firstName = 'Bob', @streetAddress='5343 S 1500 E', @city= 'South Weber', @state='UT', @zip='84405', @cellPhoneNumber='8012628735', @homePhoneNumber= NULL, @workPhoneNumber='8016999279',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'dfc99@yahoo.com' , @lastName = 'Christensen' , @firstName = 'Devin', @streetAddress='1776 NORTH 1325 WEST', @city= 'Clinton', @state='UT', @zip='84015', @cellPhoneNumber='8013882399', @homePhoneNumber= NULL, @workPhoneNumber='8015949600',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'jon34131.jc@gmail.com' , @lastName = 'Christensen' , @firstName = 'Jonathan', @streetAddress='524w. 1980s.', @city= 'Nibley', @state='UT', @zip='84321', @cellPhoneNumber='4354541654', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'nickcole@gmail.com' , @lastName = 'Cole' , @firstName = 'Nick', @streetAddress='1775 N. 400 E. # 9', @city= 'Logan', @state='UT', @zip='84341', @cellPhoneNumber='4357601256', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'wcole@gmail.com' , @lastName = 'Cole' , @firstName = 'William', @streetAddress='1642 n. 1125 e.', @city= 'North Ogden', @state='UT', @zip='84414', @cellPhoneNumber='8014109738', @homePhoneNumber= '8015104727', @workPhoneNumber='8014092114',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'trevorcondie@comcast.net' , @lastName = 'Condie' , @firstName = 'Trevor', @streetAddress='3478 Lakeview Drive', @city= 'North Ogden', @state='UT', @zip='84414', @cellPhoneNumber='8012033645', @homePhoneNumber= '8017823879', @workPhoneNumber='4358639450',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'kconnersUtah@comcast.net' , @lastName = 'Conners' , @firstName = 'Kevin', @streetAddress='1862 N 290 W', @city= 'Layton', @state='UT', @zip='84041', @cellPhoneNumber='8016093386', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'randall.crowell@autoliv.net' , @lastName = 'Crowell' , @firstName = 'Randall', @streetAddress='2458 N. 400 E.', @city= 'North Ogden', @state='UT', @zip='84414', @cellPhoneNumber='8017438813', @homePhoneNumber= NULL, @workPhoneNumber='8016252477',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'kevinc987@yahoo.com' , @lastName = 'Cullimore' , @firstName = 'Kevin', @streetAddress='335 South Kays Drive', @city= 'Kaysville', @state='UT', @zip='84037', @cellPhoneNumber='8016569890', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'kraigculli@hotmail.com' , @lastName = 'Cullimore' , @firstName = 'Kraig', @streetAddress='498 N 2375 W', @city= 'West Point', @state='UT', @zip='84015', @cellPhoneNumber='8018093103', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'konnorcullimore@live.com' , @lastName = 'Cullimore' , @firstName = 'Konnor', @streetAddress='1676 w 1400n', @city= 'Farr West', @state='UT', @zip='84404', @cellPhoneNumber='8016059846', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'cactuscutler89@yahoo.com' , @lastName = 'Cutler' , @firstName = 'Mark', @streetAddress='466 South 400 West', @city= 'Garland', @state='UT', @zip='84312', @cellPhoneNumber='4354523380', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'braddavies50@hotmail.com' , @lastName = 'Davies' , @firstName = 'Bradley', @streetAddress='1458 West 1260 North', @city= 'Clinton', @state='UT', @zip='84015', @cellPhoneNumber='8014603662', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'evandavis@gmail.com' , @lastName = 'Davis' , @firstName = 'Evan', @streetAddress='68 South 1450 West', @city= 'Clearfield', @state='UT', @zip='84015', @cellPhoneNumber='8015498977', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'mdavis345@gmail.com' , @lastName = 'Davis' , @firstName = 'Mark', @streetAddress='3590 van buren #42', @city= 'Ogden', @state='UT', @zip='84403', @cellPhoneNumber='8016083618', @homePhoneNumber= '8014222947', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'tomdeelstra@utah.gov' , @lastName = 'Deelstra' , @firstName = 'Tom', @streetAddress='2757 W 1825 S', @city= 'West Haven', @state='UT', @zip='84401', @cellPhoneNumber='8014888496', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'freddenucci@comcast.net' , @lastName = 'Denucci' , @firstName = 'Fredrick', @streetAddress='3460 S. Elaine', @city= 'Bountiful', @state='UT', @zip='84010', @cellPhoneNumber='8016900113', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'marvdeyoung@outlook.com' , @lastName = 'DeYoung' , @firstName = 'Marv', @streetAddress='1228 N 310 E', @city= 'Layton', @state='UT', @zip='84040', @cellPhoneNumber='8016406046', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'david.dickson@gmail.com' , @lastName = 'Dickson' , @firstName = 'David', @streetAddress='234 Eagle Way', @city= 'Fruit Heights', @state='UT', @zip='84037', @cellPhoneNumber='8018296606', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'devindom@msn.com' , @lastName = 'Dominguez' , @firstName = 'Devin', @streetAddress='3021 w 2450 s', @city= 'West Haven', @state='UT', @zip='84401', @cellPhoneNumber='8018065015', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'jeffdowns@gmail.com' , @lastName = 'Downs' , @firstName = 'Jeff', @streetAddress='257 W. 675 S.', @city= 'Kaysville', @state='UT', @zip='84037', @cellPhoneNumber='8016024270', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'brettdyer@live.com' , @lastName = 'Dyer' , @firstName = 'Brett', @streetAddress='3612 w 300 s', @city= 'Ogden', @state='UT', @zip='84404', @cellPhoneNumber='8016806321', @homePhoneNumber= '8012934136', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'brevindyer29@live.com' , @lastName = 'Dyer' , @firstName = 'Brevin', @streetAddress='3612 w 300 s', @city= 'Ogden', @state='UT', @zip='84404', @cellPhoneNumber='8013082820', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'kevindyer36@digis.net' , @lastName = 'Dyer' , @firstName = 'Kevin', @streetAddress='1788 W 675 S', @city= 'OGDEN', @state='UT', @zip='84404', @cellPhoneNumber='8019403915', @homePhoneNumber= '8013932936', @workPhoneNumber='8013742800',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'sportsref20@yahoo.com' , @lastName = 'Eames' , @firstName = 'Ronald', @streetAddress='5249 W 12825 N', @city= 'GARLAND', @state='UT', @zip='84312', @cellPhoneNumber='4352794880', @homePhoneNumber= '4352579625', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'john.eliason@gmail.com' , @lastName = 'Eliason' , @firstName = 'John', @streetAddress='402 S 750 W', @city= 'Riverdale', @state='UT', @zip='84405', @cellPhoneNumber='8017264706', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'matt_elkins@msn.com' , @lastName = 'Elkins' , @firstName = 'Matt', @streetAddress='1415 N. 2225 W', @city= 'Layton', @state='UT', @zip='84041', @cellPhoneNumber='8015899826', @homePhoneNumber= NULL, @workPhoneNumber='8017759850',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'brfootball67@gmail.com' , @lastName = 'Ellis' , @firstName = 'Charles', @streetAddress='1850 W 875 N Apt A8', @city= 'Layton', @state='UT', @zip='84041', @cellPhoneNumber='4352303951', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'michaelengledow@comcast.net' , @lastName = 'Engledow' , @firstName = 'Michael', @streetAddress='P.O. Box 399', @city= 'Layton', @state='UT', @zip='84041', @cellPhoneNumber='8016191287', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'thomas.evans49@gmail.com' , @lastName = 'Evans' , @firstName = 'Thomas', @streetAddress='3052B Minuteman Way', @city= 'Hill AFB', @state='UT', @zip='84056', @cellPhoneNumber='8082712491', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'steven.farnsworth@gmail.com' , @lastName = 'Farnsworth' , @firstName = 'Steven', @streetAddress='534 West 800 South', @city= 'Layton', @state='UT', @zip='84041', @cellPhoneNumber='4355022320', @homePhoneNumber= NULL, @workPhoneNumber='8015663428',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'marcus.federer@yahoo.com' , @lastName = 'Federer' , @firstName = 'Marcus', @streetAddress='3255 N. 4575 W.', @city= 'Plain City', @state='UT', @zip='84404', @cellPhoneNumber='8055083384', @homePhoneNumber= NULL, @workPhoneNumber='8015469889',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'shawnf@gmail.com' , @lastName = 'Fernandez' , @firstName = 'Shawn', @streetAddress='4934 S. 3900 W.', @city= 'Roy', @state='UT', @zip='84067', @cellPhoneNumber='8013645907', @homePhoneNumber= NULL, @workPhoneNumber='8013685829',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'francis.morgan@gmail.com' , @lastName = 'Francis' , @firstName = 'Morgan', @streetAddress='288 E Primrose Rd,', @city= 'Layton', @state='UT', @zip='84040', @cellPhoneNumber='8013098023', @homePhoneNumber= NULL, @workPhoneNumber='8016226471',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'galbraith98@comcast.net' , @lastName = 'Galbraith' , @firstName = 'Reggie', @streetAddress='1323 29TH STREET', @city= 'Ogden', @state='UT', @zip='84403', @cellPhoneNumber='8016965346', @homePhoneNumber= '8016012850', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'gangwerroger@aol.com' , @lastName = 'Gangwer' , @firstName = 'Roger', @streetAddress='1390 W 1800 N', @city= 'Farr West', @state='UT', @zip='84404', @cellPhoneNumber='8014605963', @homePhoneNumber= '8017424842', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'gardner1@comcast.net' , @lastName = 'Gardner' , @firstName = 'Randy', @streetAddress='152 29TH STREET', @city= 'Ogden', @state='UT', @zip='84403', @cellPhoneNumber='8016985376', @homePhoneNumber= '8016212832', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'cgermany@comcast.net' , @lastName = 'Germany' , @firstName = 'Chris', @streetAddress='350 N. Sherwood Dr', @city= 'Providence', @state='UT', @zip='84332', @cellPhoneNumber='8012479674', @homePhoneNumber= '4357564282', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'graycurtis39@aol.com' , @lastName = 'Gray' , @firstName = 'Curtis', @streetAddress='1740 North Dennis Dr.', @city= 'North Ogden', @state='UT', @zip='84414', @cellPhoneNumber='8019291386', @homePhoneNumber= NULL, @workPhoneNumber='8014090780',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'tomgriff@gmail.com' , @lastName = 'Griffin' , @firstName = 'Thomas', @streetAddress='850 N 4000 W', @city= 'Mendon', @state='UT', @zip='84325', @cellPhoneNumber='4357609366', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'shadley@juno.com' , @lastName = 'Hadley' , @firstName = 'Steven', @streetAddress='372 N Brahma Rd.', @city= 'Farmington', @state='UT', @zip='84025', @cellPhoneNumber='8018040579', @homePhoneNumber= '8014513320', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'keith.hales@yahoo.com' , @lastName = 'Hales' , @firstName = 'Keith', @streetAddress='366 W Center St', @city= 'Kaysville', @state='UT', @zip='84037', @cellPhoneNumber='8015102365', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'johnhancock@yahoo.com' , @lastName = 'Hancock' , @firstName = 'John', @streetAddress='442 S. 4200 W.', @city= 'Ogden', @state='UT', @zip='84404', @cellPhoneNumber='8013094440', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'markhaney@hotmail.com' , @lastName = 'Haney' , @firstName = 'Mark', @streetAddress='3317 S. Bluff Ridge Dr.', @city= 'Syracuse', @state='UT', @zip='84075', @cellPhoneNumber='8016377959', @homePhoneNumber= NULL, @workPhoneNumber='8014546098',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'david.hansen0000@hotmail.com' , @lastName = 'Hansen' , @firstName = 'David', @streetAddress='527 North 4200 West', @city= 'West Point', @state='UT', @zip='84015', @cellPhoneNumber='8014987536', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'dannyghansen@gmail.com' , @lastName = 'Hansen' , @firstName = 'Daniel', @streetAddress='1226 West 4550 North', @city= 'Amalga', @state='UT', @zip='84335', @cellPhoneNumber='4357400141', @homePhoneNumber= NULL, @workPhoneNumber='4355459052',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'anthonyharris@gmail.com' , @lastName = 'Harris' , @firstName = 'Anthony', @streetAddress='2763 s Allison Way', @city= 'Syracuse', @state='UT', @zip='84075', @cellPhoneNumber='8012568055', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'carsonharry@gmail.com' , @lastName = 'Harry' , @firstName = 'Carson', @streetAddress='1620 Orchard Dr Unit A', @city= 'Bountiful', @state='UT', @zip='84010', @cellPhoneNumber='8016698701', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'barronhatfield@yahoo.com' , @lastName = 'Hatfield' , @firstName = 'Barron', @streetAddress='588 N Quincy Ave', @city= 'Ogden', @state='UT', @zip='84404', @cellPhoneNumber='8016904750', @homePhoneNumber= '8016755118', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'thomashellstrom@wsd.net' , @lastName = 'Hellstrom' , @firstName = 'Thomas', @streetAddress='2248 N 700 E', @city= 'North Ogden', @state='UT', @zip='84414', @cellPhoneNumber='8015687499', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'hill_dennis@outlook.com' , @lastName = 'Hill' , @firstName = 'Dennis', @streetAddress='1342 West 2700 North', @city= 'Clinton', @state='UT', @zip='84015', @cellPhoneNumber='8016087507', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'larryhill@gmail.com' , @lastName = 'Hill' , @firstName = 'Larry', @streetAddress='372 Whisperwood Cove', @city= 'Kaysville', @state='UT', @zip='84037', @cellPhoneNumber='8016496922', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'dennish@msn.com' , @lastName = 'Hooper' , @firstName = 'Dennis', @streetAddress='1941 S 1350 W', @city= 'Syracuse', @state='UT', @zip='84075', @cellPhoneNumber='8017325739', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'connor.hoopes@aggiemail.usu.edu' , @lastName = 'Hoopes' , @firstName = 'Cannor', @streetAddress='454 Sharon St.', @city= 'Morgan', @state='UT', @zip='84050', @cellPhoneNumber='8018286178', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'garrett.horsley@gmail.com' , @lastName = 'Horsley' , @firstName = 'Garrett', @streetAddress='2451 West 700 North', @city= 'Layton', @state='UT', @zip='84041', @cellPhoneNumber='8016082581', @homePhoneNumber= '8015442233', @workPhoneNumber='8012226728',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'jeffrey.hoskins@hotmail.com' , @lastName = 'Hoskins' , @firstName = 'Jeffrey', @streetAddress='4285 S 2900 W Unit C', @city= 'Roy', @state='UT', @zip='84067', @cellPhoneNumber='8016286861', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'heyvern@gmail.com' , @lastName = 'Hunnel' , @firstName = 'Vern', @streetAddress='648 S. Douglas Dr.', @city= 'Brigham City', @state='UT', @zip='84302', @cellPhoneNumber='4357308764', @homePhoneNumber= '4357236760', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'alan.hunsaker@hsc.utah.edu' , @lastName = 'Hunsaker' , @firstName = 'Alan', @streetAddress='1589 W Gentile Street', @city= 'Layton', @state='UT', @zip='84041', @cellPhoneNumber='8016033402', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'kfh@comcast.net' , @lastName = 'Hunter' , @firstName = 'Kevin', @streetAddress='3318 Adams Avenue', @city= 'Ogden', @state='UT', @zip='84401', @cellPhoneNumber='8018043275', @homePhoneNumber= NULL, @workPhoneNumber='8017017393',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'jeff.jackson1@gmail.com' , @lastName = 'Jackson' , @firstName = 'Jeffrey', @streetAddress='840 East 1000 North', @city= 'Logan', @state='UT', @zip='84321', @cellPhoneNumber='4357302126', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'caseyjack@gmail.com' , @lastName = 'Jackson' , @firstName = 'Casey', @streetAddress='2758 North 465 West', @city= 'West Bountiful', @state='UT', @zip='84087', @cellPhoneNumber='8015643875', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'bwj9999@hotmail.com' , @lastName = 'Jeffs' , @firstName = 'Bryce', @streetAddress='1785 E. SHERWOOD DRIVE', @city= 'Kaysville', @state='UT', @zip='84037', @cellPhoneNumber='8017259017', @homePhoneNumber= '8015445692', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'larryjensen@syracuseut.com' , @lastName = 'Jensen' , @firstName = 'Larry', @streetAddress='1945 s 1285 w', @city= 'Syracuse', @state='UT', @zip='84075', @cellPhoneNumber='8018073535', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'terryjensen209@hotmail.com' , @lastName = 'Jensen' , @firstName = 'Terry', @streetAddress='3475 North 450 East', @city= 'North Ogden', @state='UT', @zip='84414', @cellPhoneNumber='8013758774', @homePhoneNumber= '8017829870', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'scottjohnson0909@hotmail.com' , @lastName = 'Johnson' , @firstName = 'Scott', @streetAddress='555 NORTH 3500 WEST', @city= 'Clearfield', @state='UT', @zip='84015', @cellPhoneNumber='8016081129', @homePhoneNumber= '8017734420', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'mattjones@gpi.com' , @lastName = 'Jones' , @firstName = 'Matthew', @streetAddress='4012 W 4900 S', @city= 'Roy', @state='UT', @zip='84067', @cellPhoneNumber='8016902020', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'ronaldkennedy1@yahoo.com' , @lastName = 'Kennedy' , @firstName = 'Ronald', @streetAddress='1203 w 3475 n', @city= 'Clinton', @state='UT', @zip='84015', @cellPhoneNumber='8018044338', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'stevenkibler@gmail.com' , @lastName = 'Kibler' , @firstName = 'Steven', @streetAddress='507 North 1620 West', @city= 'Clinton', @state='UT', @zip='84015', @cellPhoneNumber='8014073667', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'blainkilburn@yahoo.com' , @lastName = 'Kilburn' , @firstName = 'Blaine', @streetAddress='1538 S 1050 W', @city= 'Clearfield', @state='UT', @zip='84015', @cellPhoneNumber='8018044209', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'jonathankilburn@aol.com' , @lastName = 'Kilburn' , @firstName = 'Jonathan', @streetAddress='1280 EAST CANYON DR.', @city= 'South Weber', @state='UT', @zip='84405', @cellPhoneNumber='8019205980', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'calvinking@gmail.com' , @lastName = 'King' , @firstName = 'Calvin', @streetAddress='108 Bamberger Way', @city= 'Centerville', @state='UT', @zip='84014', @cellPhoneNumber='8014090863', @homePhoneNumber= NULL, @workPhoneNumber='8013056989',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'sking@munnsmfg.com' , @lastName = 'King' , @firstName = 'Scott', @streetAddress='10235 North 4400 West', @city= 'Garland', @state='UT', @zip='84312', @cellPhoneNumber='4354024768', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'trevorking@gmail.com' , @lastName = 'King' , @firstName = 'Trevor', @streetAddress='1942 S 350 E', @city= 'Bountiful', @state='UT', @zip='84010', @cellPhoneNumber='8014051319', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'craig.larsen@usu.edu' , @lastName = 'Larsen' , @firstName = 'Craig', @streetAddress='658 South 1000 East', @city= 'Logan', @state='UT', @zip='84321', @cellPhoneNumber='4357604268', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'clifflaw99@yahoo.com' , @lastName = 'Law' , @firstName = 'Cliff', @streetAddress='126 north 500 west', @city= 'Smithfield', @state='UT', @zip='84335', @cellPhoneNumber='4359041970', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'coreylayton98@hotmail.com' , @lastName = 'Layton' , @firstName = 'Corey', @streetAddress='459 N. Country Way', @city= 'Fruit Heights', @state='UT', @zip='84037', @cellPhoneNumber='8018978632', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'randy_leetham@keybank.com' , @lastName = 'Leetham' , @firstName = 'Randy', @streetAddress='PO Box 104', @city= 'Hyrum', @state='UT', @zip='84319', @cellPhoneNumber='4357209071', @homePhoneNumber= '4352555627', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'paulleonard234@yahoo.com' , @lastName = 'Leonard' , @firstName = 'Paul', @streetAddress='537 Leonard Lane', @city= 'Farmington', @state='UT', @zip='84025', @cellPhoneNumber='8012092366', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'adammarietti@hotmail.com' , @lastName = 'Marietti' , @firstName = 'Adam', @streetAddress='2082 w 3495 n', @city= 'Clinton', @state='UT', @zip='84015', @cellPhoneNumber='8016056874', @homePhoneNumber= '8012093822', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'ddmartin2020@msn.com' , @lastName = 'Martin' , @firstName = 'Dennis', @streetAddress='278 W 2330 N', @city= 'Logan', @state='UT', @zip='84341', @cellPhoneNumber='4357074359', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'marcusmaxey@gmail.com' , @lastName = 'Maxey' , @firstName = 'Marcus', @streetAddress='340 Canyon Cove', @city= 'Logan', @state='UT', @zip='84321', @cellPhoneNumber='8013129889', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'msmcd9853@gmail.com' , @lastName = 'McDonald' , @firstName = 'Matt', @streetAddress='1290 South 250 West', @city= 'Bountiful', @state='UT', @zip='84010', @cellPhoneNumber='8014075542', @homePhoneNumber= '8012983020', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'meffmckenney12@yahoo.com' , @lastName = 'McKenney' , @firstName = 'Jeff', @streetAddress='2456 South 1850 West', @city= 'Nibley', @state='UT', @zip='84321', @cellPhoneNumber='4353607701', @homePhoneNumber= '4357674209', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'mark.mills94@gmail.com' , @lastName = 'Mills' , @firstName = 'Mark', @streetAddress='331 E 1850 S', @city= 'Kaysville', @state='UT', @zip='84037', @cellPhoneNumber='8016940304', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'KyleMitchell1990@gmail.com' , @lastName = 'Mitchell' , @firstName = 'Kyle', @streetAddress='349 EAST 900 NORTH', @city= 'Logan', @state='UT', @zip='84321', @cellPhoneNumber='4357535466', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'johnqnelson@dsdmail.net' , @lastName = 'Nelson' , @firstName = 'John', @streetAddress='533 s 1500 e', @city= 'Kaysville', @state='UT', @zip='84037', @cellPhoneNumber='8015402233', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'boomer3685@yahoo.com' , @lastName = 'Neuteboom' , @firstName = 'Charles', @streetAddress='787 E 500 N', @city= 'Kaysville', @state='UT', @zip='840372005', @cellPhoneNumber='8016032353', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'kevin.norman@aggiemail.usu.edu' , @lastName = 'Norman' , @firstName = 'Kevin', @streetAddress='4578 W 4950 S', @city= 'West Haven', @state='UT', @zip='84401', @cellPhoneNumber='8016900214', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'kirk.osborne.ko@gmail.com' , @lastName = 'Osborne' , @firstName = 'kirk', @streetAddress='781 w 200 n', @city= 'clearfield', @state='UT', @zip='84015', @cellPhoneNumber='8015080676', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'ottleybradley@msn.com' , @lastName = 'Ottley' , @firstName = 'Bradley', @streetAddress='301 E 730 N', @city= 'Smithfield', @state='UT', @zip='84335', @cellPhoneNumber='4358017449', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'jeremywoverton1@gmail.com' , @lastName = 'Overton' , @firstName = 'Jeremy', @streetAddress='5278 S 2375 W', @city= 'Roy', @state='UT', @zip='84067', @cellPhoneNumber='8016483448', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'pagejerod1976@gmail.com' , @lastName = 'Page' , @firstName = 'Jerod', @streetAddress='1437 BLACK LN', @city= 'FARMINGTON', @state='UT', @zip='84025', @cellPhoneNumber='8019743488', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'johnmpage@gmail.com' , @lastName = 'Page' , @firstName = 'John', @streetAddress='1437 Black Ln.', @city= 'Farmington', @state='UT', @zip='84025', @cellPhoneNumber='8019560278', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'refwalter@yahoo.com' , @lastName = 'Pead' , @firstName = 'Walter', @streetAddress='678 South 300 East', @city= 'Layton', @state='UT', @zip='84041', @cellPhoneNumber='8016089655', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'sampeisley@comcast.net' , @lastName = 'Peisley' , @firstName = 'Samuel', @streetAddress='1544 SOUTH MAIN ST', @city= 'Bountiful', @state='UT', @zip='84010', @cellPhoneNumber='8014515913', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'lesterpetersen1@gmail.com' , @lastName = 'Petersen' , @firstName = 'Lester', @streetAddress='539 West 1300 South', @city= 'Bountiful', @state='UT', @zip='84010', @cellPhoneNumber='8014058518', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'peterson98657@comcast.net' , @lastName = 'Peterson' , @firstName = 'Dennis', @streetAddress='1533 East Canyon Drive', @city= 'South Weber', @state='UT', @zip='84405', @cellPhoneNumber='8014182217', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'joshuapeterson@live.com' , @lastName = 'Peterson' , @firstName = 'Joshua', @streetAddress='997 North 4200 West', @city= 'West Point', @state='UT', @zip='84015', @cellPhoneNumber='4355503184', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'pilewicz.marvin@hotmail.com' , @lastName = 'Pilewicz' , @firstName = 'Marvin', @streetAddress='2406 W. 3275 So', @city= 'West Haven', @state='UT', @zip='84401', @cellPhoneNumber='8014522329', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'normanplaizier@gmail.com' , @lastName = 'Plaizier' , @firstName = 'Norman', @streetAddress='110 w 1800 s', @city= 'Bountiful', @state='UT', @zip='84010', @cellPhoneNumber='8015404331', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'bradpoll@wsd.net' , @lastName = 'Poll' , @firstName = 'Brad', @streetAddress='1275 S. 2200 W.', @city= 'Syracuse', @state='UT', @zip='84075', @cellPhoneNumber='8017094790', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'thadporter@yahoo.com' , @lastName = 'Porter' , @firstName = 'Thad', @streetAddress='446 E 1375 N', @city= 'North Ogden', @state='UT', @zip='84414', @cellPhoneNumber='8016044138', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'jonathanquist@aerotechmfg.com' , @lastName = 'Quist' , @firstName = 'Jonathan', @streetAddress='797 West 1325 South', @city= 'Bountiful', @state='UT', @zip='84010', @cellPhoneNumber='8015334988', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'tylerrasmussen@msn.com' , @lastName = 'Rasmussen' , @firstName = 'Tyler', @streetAddress='1902 w 4750 s', @city= 'Riverdale', @state='UT', @zip='84405', @cellPhoneNumber='8015260347', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'reidcarlos23@gmail.com' , @lastName = 'Reid' , @firstName = 'Carlos', @streetAddress='2709 NORTH 1330 WEST', @city= 'Clinton', @state='UT', @zip='84015', @cellPhoneNumber='8013986255', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'mitch.reimer@comcast.net' , @lastName = 'Reimer' , @firstName = 'Mitch', @streetAddress='4194 S 2175 W', @city= 'Roy', @state='UT', @zip='84067', @cellPhoneNumber='8013939801', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'richjeff@gmail.com' , @lastName = 'Rich' , @firstName = 'Jeff', @streetAddress='366 north Tierra Vista court', @city= 'Bountiful', @state='UT', @zip='84010', @cellPhoneNumber='8015035625', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'chad.richins@gmail.com' , @lastName = 'Richins' , @firstName = 'Chad', @streetAddress='1089 South 450 East', @city= 'Bountiful', @state='UT', @zip='84010', @cellPhoneNumber='8014885554', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'scott.riley88@gmail.com' , @lastName = 'Riley' , @firstName = 'Scott', @streetAddress='2727 West 200 South', @city= 'Syracuse', @state='UT', @zip='84075', @cellPhoneNumber='8016384526', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'Robinson.David@gmail.com' , @lastName = 'Robinson' , @firstName = 'David', @streetAddress='561 W 300 N', @city= 'Brigham', @state='UT', @zip='84302', @cellPhoneNumber='4357204001', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'karl.robinson56@yahoo.com' , @lastName = 'Robinson' , @firstName = 'Karl', @streetAddress='350 West 650 North', @city= 'Logan', @state='UT', @zip='84321', @cellPhoneNumber='4357244884', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'mariofurm@comcast.net' , @lastName = 'Roger' , @firstName = 'Mario', @streetAddress='236 North 300 East', @city= 'Providence', @state='UT', @zip='84332', @cellPhoneNumber='4357654477', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'bjross33@netzero.com' , @lastName = 'Ross' , @firstName = 'Bruce', @streetAddress='453 South Morgan Valley Drive', @city= 'Morgan', @state='UT', @zip='84050', @cellPhoneNumber='8014552388', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'football98@gmail.com' , @lastName = 'Rowland' , @firstName = 'Tyson', @streetAddress='782 West 400 South', @city= 'Woods Cross', @state='UT', @zip='84087', @cellPhoneNumber='8016187543', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'danielrudolph@hotmail.com' , @lastName = 'Rudolph' , @firstName = 'Daniel', @streetAddress='1833 Carston Court', @city= 'Farmington', @state='UT', @zip='84025', @cellPhoneNumber='8017153612', @homePhoneNumber= NULL, @workPhoneNumber='8013223412',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'sadlerterrance@msn.com' , @lastName = 'Sadler' , @firstName = 'Terrance', @streetAddress='1724 East Sunset Hollow Dr', @city= 'Bountiful', @state='UT', @zip='84010', @cellPhoneNumber='8017883425', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'markschofield34@gmail.com' , @lastName = 'Schofield' , @firstName = 'Mark', @streetAddress='1295 South 2600 West', @city= 'Syracuse', @state='UT', @zip='84075', @cellPhoneNumber='8018022959', @homePhoneNumber= '8017746888', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'schryversteve@live.com' , @lastName = 'Schryver' , @firstName = 'Steve', @streetAddress='171 East 450 South', @city= 'Kaysville', @state='UT', @zip='84037', @cellPhoneNumber='8017065664', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'randy.shapiro@gmail.com' , @lastName = 'Shapiro' , @firstName = 'Randy', @streetAddress='383 S 950 E', @city= 'Kaysville', @state='UT', @zip='84037', @cellPhoneNumber='8017063867', @homePhoneNumber= '8015466921', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'vshurtliff909@gmail.com' , @lastName = 'Shurtliff' , @firstName = 'Vaughn', @streetAddress='410 North 300 west', @city= 'Centerville', @state='UT', @zip='84014', @cellPhoneNumber='8014142912', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'rogtaylor@hotmail.com' , @lastName = 'Taylor' , @firstName = 'Roger', @streetAddress='42 WEST 800 NORTH', @city= 'Kaysville', @state='UT', @zip='84037', @cellPhoneNumber='8015044236', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'tommytaylor88@hotmail.com' , @lastName = 'Taylor' , @firstName = 'Tommy', @streetAddress='42 WEST 800 NORTH', @city= 'Kaysville', @state='UT', @zip='84037', @cellPhoneNumber='8015408756', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'jacksonthomas@yahoo.com' , @lastName = 'Thomas' , @firstName = 'Jackson', @streetAddress='1923 n 200 e', @city= 'Layton', @state='UT', @zip='84041', @cellPhoneNumber='8015097934', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'tannerthursday@gmail.com' , @lastName = 'Thursday' , @firstName = 'Tanner', @streetAddress='1389 EASTRIDGE CIRCLE', @city= 'Logan', @state='UT', @zip='84321', @cellPhoneNumber='4357505536', @homePhoneNumber= '4357169667', @workPhoneNumber='4359940494',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'kevin.tracy@yahoo.com' , @lastName = 'Tracy' , @firstName = 'Kevin', @streetAddress='4305A Appomattox Cir.', @city= 'HAFB', @state='UT', @zip='84056', @cellPhoneNumber='2084042259', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'darrintreegold@yahoo.com' , @lastName = 'Treegold' , @firstName = 'Darrin', @streetAddress='3449 Porter Avenue', @city= 'Ogden', @state='UT', @zip='84403', @cellPhoneNumber='8016216391', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'matt.troy@gmail.com' , @lastName = 'Troy' , @firstName = 'Matt', @streetAddress='307 Homestead Crt.', @city= 'Providence', @state='UT', @zip='84332', @cellPhoneNumber='4358113495', @homePhoneNumber= '4352133959', @workPhoneNumber='4357132680',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'matt.tucker9@gmail.com' , @lastName = 'Tucker' , @firstName = 'Matt', @streetAddress='504 East 2590 South', @city= 'Bountiful', @state='UT', @zip='84010', @cellPhoneNumber='4355084520', @homePhoneNumber= NULL, @workPhoneNumber='8018152350',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'trueandtrue@gmail.com' , @lastName = 'Turner' , @firstName = 'Davis', @streetAddress='1149 South 620 West', @city= 'Tremonton', @state='UT', @zip='84337', @cellPhoneNumber='4352303019', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'andrewunitoa@mail.weber.edu' , @lastName = 'Unitoa' , @firstName = 'Andrew', @streetAddress='3477 Eccles Ave', @city= 'Ogden', @state='UT', @zip='84403', @cellPhoneNumber='8019407854', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'cveibell@netzero.net' , @lastName = 'Veibell' , @firstName = 'Charles', @streetAddress='3321 South 1200 West', @city= 'Riverdale', @state='UT', @zip='84405', @cellPhoneNumber='8013024234', @homePhoneNumber= '8017163685', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'randell.waddington@aggiemail.usu.edu' , @lastName = 'Waddington' , @firstName = 'Randell', @streetAddress='455 e 200 n apartment 1c', @city= 'Logan', @state='UT', @zip='84321', @cellPhoneNumber='8014156325', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'lester.walker@yahoo.com' , @lastName = 'Walker' , @firstName = 'Lester', @streetAddress='308 Pear Lane', @city= 'Bountiful', @state='UT', @zip='84010', @cellPhoneNumber='8016234958', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'jeff.wall76@gmail.com' , @lastName = 'Wall' , @firstName = 'Jeff', @streetAddress='1586 W 1210 N', @city= 'Farmington', @state='UT', @zip='84025', @cellPhoneNumber='8015241670', @homePhoneNumber= '8014523949', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'dannywallace@wsd.net' , @lastName = 'Wallace' , @firstName = 'Danny', @streetAddress='346 E. 1275 North', @city= 'North Ogden', @state='UT', @zip='84414', @cellPhoneNumber='8014101472', @homePhoneNumber= '8017479446', @workPhoneNumber='8014524239',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'wallingtonscott@hotmail.com' , @lastName = 'Wallington' , @firstName = 'Scott', @streetAddress='2971 Grandview Dr.', @city= 'Ogden', @state='UT', @zip='84403', @cellPhoneNumber='8016103612', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'brett.ward@gmail.com' , @lastName = 'Ward' , @firstName = 'Brett', @streetAddress='345 W. 360 N.', @city= 'Smithfield', @state='UT', @zip='84335', @cellPhoneNumber='4355023694', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'davidwarren22@hotmail.com' , @lastName = 'Warren' , @firstName = 'David', @streetAddress='2261 W 6025 S', @city= 'Roy', @state='UT', @zip='84067', @cellPhoneNumber='8015184330', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'micah.w@aggiemail.usu.edu' , @lastName = 'Watkins' , @firstName = 'Micah', @streetAddress='2351 N 500 E APT 211', @city= 'Logan', @state='UT', @zip='84341', @cellPhoneNumber='8018072832', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'mark.welch90@gmail.com' , @lastName = 'Welch' , @firstName = 'Mark', @streetAddress='2320 West 5680 South', @city= 'Roy', @state='UT', @zip='84067', @cellPhoneNumber='8014032468', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'mathew.willey@hotmail.com' , @lastName = 'Willey' , @firstName = 'Mathew', @streetAddress='486 North 320 East', @city= 'Centerville', @state='UT', @zip='84014', @cellPhoneNumber='8015409980', @homePhoneNumber= '8012950366', @workPhoneNumber='8015608033',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'corey.williams93@hotmail.com' , @lastName = 'Williams' , @firstName = 'Corey', @streetAddress='836 W. 250 N.', @city= 'Morgan', @state='UT', @zip='84050', @cellPhoneNumber='8016902801', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'kdwilliams@gmail.com' , @lastName = 'Williams' , @firstName = 'Kyle', @streetAddress='2448 W 1475 S', @city= 'Syracuse', @state='UT', @zip='84075', @cellPhoneNumber='8015033692', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'winter.andrew35@gmail.com' , @lastName = 'Winter' , @firstName = 'Andrew', @streetAddress='1296 Millcreek Drive #10', @city= 'Ogden', @state='UT', @zip='84404', @cellPhoneNumber='8013092397', @homePhoneNumber= '8014382815', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'zachwinter23@msn.com' , @lastName = 'Winter' , @firstName = 'Zachary', @streetAddress='1236 E 2250 N', @city= 'Layton', @state='UT', @zip='84040', @cellPhoneNumber='8013033409', @homePhoneNumber= '8015476059', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'twood9020@gmail.com' , @lastName = 'Wood' , @firstName = 'Thomas', @streetAddress='355 wasatch blvd', @city= 'smithfield', @state='UT', @zip='84335', @cellPhoneNumber='4353023191', @homePhoneNumber= '4354934205', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'tom@relaianet.com' , @lastName = 'Wright' , @firstName = 'Trevor', @streetAddress='5518 N 2700 W', @city= 'morgan', @state='UT', @zip='84050', @cellPhoneNumber='8014080173', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'jason.younger@gmail.com' , @lastName = 'Younger' , @firstName = 'Jason', @streetAddress='239 S. Lincolnshire Way', @city= 'Kaysville', @state='UT', @zip='84037', @cellPhoneNumber='8019083001', @homePhoneNumber= '8019333490', @workPhoneNumber='8016283526',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'brandon@petro.com' , @lastName = 'Atkinson' , @firstName = 'Braydon', @streetAddress='2233 S. 1500 W.', @city= 'Woods Cross', @state='UT', @zip='84087', @cellPhoneNumber='8015093487', @homePhoneNumber= '8012942798', @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'karlbeckstrom@msn.com' , @lastName = 'Beckstrom' , @firstName = 'Karl', @streetAddress='2889 West 1125 North', @city= 'Layton', @state='UT', @zip='84010', @cellPhoneNumber='8016787948', @homePhoneNumber= '8018395679', @workPhoneNumber='8012044546',@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'georgeeverett@hotmail.com' , @lastName = 'Everett' , @firstName = 'George', @streetAddress='1372 NORTH 3450 EAST', @city= 'Layton', @state='UT', @zip='84040', @cellPhoneNumber='8017215872', @homePhoneNumber= NULL, @workPhoneNumber=NULL,@feesAccumulated=0, @password='Temppass1'; 
EXECUTE usp_addUser @emailAddress= 'thomascnoker@hotmail.com' , @lastName = 'Noker' , @firstName = 'Thomas', @streetAddress='985 Miller Way', @city= 'Farmington', @state='UT', @zip='84025', @cellPhoneNumber='8015093230', @homePhoneNumber= NULL, @workPhoneNumber='8015092861',@feesAccumulated=0, @password='Temppass1'; 

--Execute addSecurityQuestion
EXECUTE usp_addSecurityQuestion @question= 'What was your childhood nickname?';
EXECUTE usp_addSecurityQuestion @question= 'In what city did you meet your spouse/significant other?';
EXECUTE usp_addSecurityQuestion @question= 'What is the name of your favorite childhood friend?';
EXECUTE usp_addSecurityQuestion @question= 'What street did you live on in third grade?';
EXECUTE usp_addSecurityQuestion @question= 'What is your oldest sibling''s birthday month and year? (e.g., January 1900)';
EXECUTE usp_addSecurityQuestion @question= 'What is the middle name of your youngest child?';
EXECUTE usp_addSecurityQuestion @question= 'What is your oldest sibling''s middle name?';
EXECUTE usp_addSecurityQuestion @question= 'What school did you attend for sixth grade?';
EXECUTE usp_addSecurityQuestion @question= 'What was your childhood phone number including area code? (e.g., 000-000-0000)';
EXECUTE usp_addSecurityQuestion @question= 'What is your oldest cousin''s first and last name?';
EXECUTE usp_addSecurityQuestion @question= 'What was the name of your first stuffed animal?';
EXECUTE usp_addSecurityQuestion @question= 'In what city or town did your mother and father meet?';
EXECUTE usp_addSecurityQuestion @question= 'Where were you when you had your first kiss?';
EXECUTE usp_addSecurityQuestion @question= 'What is the first name of the boy or girl that you first kissed?';
EXECUTE usp_addSecurityQuestion @question= 'What was the last name of your third grade teacher?';
EXECUTE usp_addSecurityQuestion @question= 'In what city does your nearest sibling live?';

--Execute addSecurityAnswer
EXECUTE usp_addSecurityAnswer @emailAddress= 'ack.devin@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'refchrisadams@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'bga78@msn.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'grukmuk@msn.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'tybar14@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'adambaxter@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'Sheldonb@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'mikeb@aspen.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'paul.bernier@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'lbirdland@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'ldjbon@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'jeffbraun8@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'ronbrenk@q.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'brownfgary@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'davidbueller@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'burnettdan@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'bryanburningham@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'kamburny@mstar.net', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'cartercarl_358@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'bobcarre@live.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'dfc99@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'jon34131.jc@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'nickcole@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'wcole@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'trevorcondie@comcast.net', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'kconnersUtah@comcast.net', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'randall.crowell@autoliv.net', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'kevinc987@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'kraigculli@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'konnorcullimore@live.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'cactuscutler89@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'braddavies50@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'evandavis@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'mdavis345@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'tomdeelstra@utah.gov', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'freddenucci@comcast.net', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'marvdeyoung@outlook.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'david.dickson@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'devindom@msn.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'jeffdowns@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'brettdyer@live.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'brevindyer29@live.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'kevindyer36@digis.net', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'sportsref20@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'john.eliason@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'matt_elkins@msn.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'brfootball67@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'michaelengledow@comcast.net', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'thomas.evans49@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'steven.farnsworth@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'marcus.federer@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'shawnf@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'francis.morgan@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'galbraith98@comcast.net', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'gangwerroger@aol.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'gardner1@comcast.net', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'cgermany@comcast.net', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'graycurtis39@aol.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'tomgriff@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'shadley@juno.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'keith.hales@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'johnhancock@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'markhaney@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'david.hansen0000@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'dannyghansen@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'anthonyharris@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'carsonharry@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'barronhatfield@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'thomashellstrom@wsd.net', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'hill_dennis@outlook.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'larryhill@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'dennish@msn.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'connor.hoopes@aggiemail.usu.edu', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'garrett.horsley@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'jeffrey.hoskins@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'heyvern@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'alan.hunsaker@hsc.utah.edu', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'kfh@comcast.net', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'jeff.jackson1@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'caseyjack@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'bwj9999@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'larryjensen@syracuseut.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'terryjensen209@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'scottjohnson0909@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'mattjones@gpi.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'ronaldkennedy1@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'stevenkibler@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'blainkilburn@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'jonathankilburn@aol.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'calvinking@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'sking@munnsmfg.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'trevorking@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'craig.larsen@usu.edu', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'clifflaw99@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'coreylayton98@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'randy_leetham@keybank.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'paulleonard234@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'adammarietti@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'ddmartin2020@msn.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'marcusmaxey@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'msmcd9853@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'meffmckenney12@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'mark.mills94@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'KyleMitchell1990@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'johnqnelson@dsdmail.net', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'boomer3685@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'kevin.norman@aggiemail.usu.edu', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'kirk.osborne.ko@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'ottleybradley@msn.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'jeremywoverton1@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'pagejerod1976@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'johnmpage@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'refwalter@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'sampeisley@comcast.net', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'lesterpetersen1@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'peterson98657@comcast.net', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'joshuapeterson@live.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'pilewicz.marvin@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'normanplaizier@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'bradpoll@wsd.net', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'thadporter@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'jonathanquist@aerotechmfg.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'tylerrasmussen@msn.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'reidcarlos23@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'mitch.reimer@comcast.net', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'richjeff@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'chad.richins@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'scott.riley88@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'Robinson.David@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'karl.robinson56@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'mariofurm@comcast.net', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'bjross33@netzero.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'football98@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'danielrudolph@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'sadlerterrance@msn.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'markschofield34@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'schryversteve@live.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'randy.shapiro@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'vshurtliff909@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'rogtaylor@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'tommytaylor88@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'jacksonthomas@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'tannerthursday@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'kevin.tracy@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'darrintreegold@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'matt.troy@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'matt.tucker9@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'trueandtrue@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'andrewunitoa@mail.weber.edu', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'cveibell@netzero.net', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'randell.waddington@aggiemail.usu.edu', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'lester.walker@yahoo.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'jeff.wall76@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'dannywallace@wsd.net', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'wallingtonscott@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'brett.ward@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'davidwarren22@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'micah.w@aggiemail.usu.edu', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'mark.welch90@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'mathew.willey@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'corey.williams93@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'kdwilliams@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'winter.andrew35@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'zachwinter23@msn.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'twood9020@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'tom@relaianet.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'jason.younger@gmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'brandon@petro.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'karlbeckstrom@msn.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'georgeeverett@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;
EXECUTE usp_addSecurityAnswer @emailAddress= 'thomascnoker@hotmail.com', @question= 'What was your childhood nickname?', @Answer=TempAnswer;

-- Execute addSportLevel
EXECUTE usp_addSportLevel @Sport= 'Football', @Level= 'Varsity', @Pay=74.00;
EXECUTE usp_addSportLevel @Sport= 'Football', @Level= 'Junior Varsity', @Pay=59.00;
EXECUTE usp_addSportLevel @Sport= 'Football', @Level= 'Sophomore', @Pay=59.00;
EXECUTE usp_addSportLevel @Sport= 'Football', @Level= 'Freshman', @Pay=59.00;
EXECUTE usp_addSportLevel @Sport= 'Volleyball', @Level= 'Varsity', @Pay=59.00;
EXECUTE usp_addSportLevel @Sport= 'Volleyball', @Level= 'Junior Varsity', @Pay=49.00;
EXECUTE usp_addSportLevel @Sport= 'Volleyball', @Level= 'Sophomore', @Pay=49.00;
EXECUTE usp_addSportLevel @Sport= 'Volleyball', @Level= 'Freshman', @Pay=49.00;
EXECUTE usp_addSportLevel @Sport= 'Basketball Men', @Level= 'Varsity', @Pay=69.00;
EXECUTE usp_addSportLevel @Sport= 'Basketball Men', @Level= 'Junior Varsity', @Pay=59.00;
EXECUTE usp_addSportLevel @Sport= 'Basketball Men', @Level= 'Sophomore', @Pay=59.00;
EXECUTE usp_addSportLevel @Sport= 'Basketball Men', @Level= 'Freshman', @Pay=59.00;
EXECUTE usp_addSportLevel @Sport= 'Basketball Women', @Level= 'Varsity', @Pay=69.00;
EXECUTE usp_addSportLevel @Sport= 'Basketball Women', @Level= 'Junior Varsity', @Pay=59.00;
EXECUTE usp_addSportLevel @Sport= 'Basketball Women', @Level= 'Sophomore', @Pay=59.00;
EXECUTE usp_addSportLevel @Sport= 'Basketball Women', @Level= 'Freshman', @Pay=59.00;
EXECUTE usp_addSportLevel @Sport= 'Baseball', @Level= 'Varsity', @Pay=59.00;
EXECUTE usp_addSportLevel @Sport= 'Baseball', @Level= 'Junior Varsity', @Pay=59.00;
EXECUTE usp_addSportLevel @Sport= 'Baseball', @Level= 'Sophomore', @Pay=59.00;
EXECUTE usp_addSportLevel @Sport= 'Baseball', @Level= 'Freshman', @Pay=59.00;
EXECUTE usp_addSportLevel @Sport= 'Softball', @Level= 'Varsity', @Pay=59.00;
EXECUTE usp_addSportLevel @Sport= 'Softball', @Level= 'Junior Varsity', @Pay=49.00;
EXECUTE usp_addSportLevel @Sport= 'Softball', @Level= 'Sophomore', @Pay=49.00;
EXECUTE usp_addSportLevel @Sport= 'Softball', @Level= 'Freshman', @Pay=49.00;
EXECUTE usp_addSportLevel @Sport= 'Soccer Men', @Level= 'Varsity', @Pay=69.00;
EXECUTE usp_addSportLevel @Sport= 'Soccer Men', @Level= 'Junior Varsity', @Pay=49.00;
EXECUTE usp_addSportLevel @Sport= 'Soccer Men', @Level= 'Sophomore', @Pay=49.00;
EXECUTE usp_addSportLevel @Sport= 'Soccer Men', @Level= 'Freshman', @Pay=49.00;
EXECUTE usp_addSportLevel @Sport= 'Soccer Women', @Level= 'Varsity', @Pay=69.00;
EXECUTE usp_addSportLevel @Sport= 'Soccer Women', @Level= 'Junior Varsity', @Pay=49.00;
EXECUTE usp_addSportLevel @Sport= 'Soccer Women', @Level= 'Sophomore', @Pay=49.00;
EXECUTE usp_addSportLevel @Sport= 'Soccer Women', @Level= 'Freshman', @Pay=49.00;

-- Execute addArbiter
EXECUTE usp_addArbiter @emailAddress= 'calvinking@gmail.com', @Sport= 'Football', @Level= 'Varsity';
EXECUTE usp_addArbiter @emailAddress= 'calvinking@gmail.com', @Sport= 'Football', @Level= 'Junior Varsity';
EXECUTE usp_addArbiter @emailAddress= 'calvinking@gmail.com', @Sport= 'Football', @Level= 'Sophomore';
EXECUTE usp_addArbiter @emailAddress= 'calvinking@gmail.com', @Sport= 'Football', @Level= 'Freshman';
EXECUTE usp_addArbiter @emailAddress= 'jeffbraun8@gmail.com', @Sport= 'Football', @Level= 'Varsity';
EXECUTE usp_addArbiter @emailAddress= 'jonathankilburn@aol.com', @Sport= 'Football', @Level= 'Junior Varsity';
EXECUTE usp_addArbiter @emailAddress= 'paulleonard234@yahoo.com', @Sport= 'Baseball', @Level= 'Varsity';
EXECUTE usp_addArbiter @emailAddress= 'paulleonard234@yahoo.com', @Sport= 'Baseball', @Level= 'Junior Varsity';
EXECUTE usp_addArbiter @emailAddress= 'paulleonard234@yahoo.com', @Sport= 'Baseball', @Level= 'Sophomore';
EXECUTE usp_addArbiter @emailAddress= 'paulleonard234@yahoo.com', @Sport= 'Baseball', @Level= 'Freshman';
EXECUTE usp_addArbiter @emailAddress= 'Sheldonb@hotmail.com', @Sport= 'Volleyball', @Level= 'Varsity';
EXECUTE usp_addArbiter @emailAddress= 'Sheldonb@hotmail.com', @Sport= 'Volleyball', @Level= 'Junior Varsity';
EXECUTE usp_addArbiter @emailAddress= 'Sheldonb@hotmail.com', @Sport= 'Volleyball', @Level= 'Sophomore';
EXECUTE usp_addArbiter @emailAddress= 'Sheldonb@hotmail.com', @Sport= 'Volleyball', @Level= 'Freshman';

-- Execute addSite
EXECUTE usp_addSite @SiteName='Bear River High School', @workPhoneNumber='4352572500', @streetAddress='1450 S Main St', @city= 'Garland', @state='UT', @zip='843129797'; 
EXECUTE usp_addSite @SiteName='Clearfield High School', @workPhoneNumber='8014023900', @streetAddress='931  S Falcon Drive', @city= 'Clearfield', @state='UT', @zip='84015'; 
EXECUTE usp_addSite @SiteName='Dee Event Center', @workPhoneNumber='4357344840', @streetAddress='4400 Harrison Blvd', @city= 'Ogden', @state='UT', @zip='84403'; 
EXECUTE usp_addSite @SiteName='Farmington High School', @workPhoneNumber='8014028200', @streetAddress='548 Glovers Ln', @city= 'Farmington', @state='UT', @zip='840250588'; 
EXECUTE usp_addSite @SiteName='Fremont High School', @workPhoneNumber='8014028800', @streetAddress='1900 N 4700 W', @city= 'Ogden', @state='UT', @zip='84404'; 
EXECUTE usp_addSite @SiteName='Layton High School', @workPhoneNumber='8014029050', @streetAddress='440 Wasatch Dr', @city= 'Layton', @state='UT', @zip='840413272'; 
EXECUTE usp_addSite @SiteName='Morgan High School', @workPhoneNumber='8014524000', @streetAddress='55 Trojan Blvd', @city= 'Morgan', @state='UT', @zip='840500917'; 
EXECUTE usp_addSite @SiteName='Mountain Crest High School', @workPhoneNumber='8014024800', @streetAddress='255 South 800 East', @city= 'Hyrum', @state='UT', @zip='84319'; 
EXECUTE usp_addSite @SiteName='Northridge High School', @workPhoneNumber='4357552380', @streetAddress='2430 N Hillfield Rd', @city= 'Layton', @state='UT', @zip='84041'; 
EXECUTE usp_addSite @SiteName='Roy High School', @workPhoneNumber='8018293418', @streetAddress='2150 W 4800 S', @city= 'Roy', @state='UT', @zip='840671899'; 
EXECUTE usp_addSite @SiteName='Sky View High School', @workPhoneNumber='4357927765', @streetAddress='520 South 250 East', @city= 'Smithfield', @state='UT', @zip='84335'; 
EXECUTE usp_addSite @SiteName='Ben Lomond High School', @workPhoneNumber='8014028500', @streetAddress='800 Scots Ln', @city= 'Ogden', @state='UT', @zip='844045199'; 
EXECUTE usp_addSite @SiteName='Bonneville High School', @workPhoneNumber='8017744922', @streetAddress='251 E 4800 S', @city= 'Ogden', @state='UT', @zip='844056199'; 
EXECUTE usp_addSite @SiteName='Bountiful High School', @workPhoneNumber='4355636273', @streetAddress='695 Orchard Dr', @city= 'Bountiful', @state='UT', @zip='84010'; 
EXECUTE usp_addSite @SiteName='Box Elder High School', @workPhoneNumber='8014027900', @streetAddress='380 S 600 W', @city= 'Brigham City', @state='UT', @zip='843022442'; 
EXECUTE usp_addSite @SiteName='Davis High School', @workPhoneNumber='8017463700', @streetAddress='325 S Main St', @city= 'Kaysville', @state='UT', @zip='840372598'; 
EXECUTE usp_addSite @SiteName='Green Canyon High School', @workPhoneNumber='8017377965', @streetAddress='2960 N Wolfpack Way', @city= 'North Logan', @state='UT', @zip='84341'; 
EXECUTE usp_addSite @SiteName='Logan High School', @workPhoneNumber='8014524050', @streetAddress='162 W 100 S', @city= 'Logan', @state='UT', @zip='843215298'; 
EXECUTE usp_addSite @SiteName='Ogden High School', @workPhoneNumber='4357929300', @streetAddress='2828 Harrison Blvd', @city= 'Ogden', @state='UT', @zip='844030398'; 
EXECUTE usp_addSite @SiteName='Ridgeline High School', @workPhoneNumber='8017378700', @streetAddress='180 North 300 West', @city= 'Millville', @state='UT', @zip='84326'; 
EXECUTE usp_addSite @SiteName='Syracuse High School', @workPhoneNumber='4357927780', @streetAddress='665 S 2000 W', @city= 'Syracuse', @state='UT', @zip='84075'; 
EXECUTE usp_addSite @SiteName='Viewmont High School', @workPhoneNumber='8014024200', @streetAddress='120 W 1000 N', @city= 'Bountiful', @state='UT', @zip='84010'; 
EXECUTE usp_addSite @SiteName='Weber High School', @workPhoneNumber='8014024500', @streetAddress='3650 N 500 W', @city= 'Ogden', @state='UT', @zip='844141455'; 
EXECUTE usp_addSite @SiteName='Woods Cross High School' , @workPhoneNumber='8014024500', @streetAddress='600 W 2200 S', @city= 'Woods Cross', @state='UT', @zip='84087'; 
EXECUTE usp_addSite @SiteName='USU Maverik Stadium', @workPhoneNumber='4357970453', @streetAddress='1000 North 800 East', @city= 'Logan', @state='UT', @zip='84341'; 
EXECUTE usp_addSite @SiteName='WSU Stewart Stadium', @workPhoneNumber='8016268500', @streetAddress='3848 Harrison Blvd', @city= 'Ogden', @state='UT', @zip='84408'; 

-- Execute AddSchool
EXECUTE usp_addSchool @SchoolName= 'Bear River High School', @workPhoneNumber='4352572500', @streetAddress='1450 S Main St', @city= 'Garland', @state='UT', @zip='843129797', @athleticDirector='Van Park'; 
EXECUTE usp_addSchool @SchoolName= 'Bountiful High School', @workPhoneNumber='8014023900', @streetAddress='695 Orchard Dr', @city= 'Bountiful', @state='UT', @zip='84010', @athleticDirector='Clark Stringfellow'; 
EXECUTE usp_addSchool @SchoolName= 'Box Elder High School', @workPhoneNumber='4357344840', @streetAddress='380 S 600 W', @city= 'Brigham City', @state='UT', @zip='843022442', @athleticDirector='Kim Peterson'; 
EXECUTE usp_addSchool @SchoolName= 'Clearfield High School', @workPhoneNumber='8014028200', @streetAddress='931 S Falcon Drive', @city= 'Clearfield', @state='UT', @zip='84015', @athleticDirector='Curtis Hulse'; 
EXECUTE usp_addSchool @SchoolName= 'Davis High School', @workPhoneNumber='8014028800', @streetAddress='325 S Main St', @city= 'Kaysville', @state='UT', @zip='840372598', @athleticDirector='Mitch Arquete'; 
EXECUTE usp_addSchool @SchoolName= 'Farmington High School', @workPhoneNumber='8014029050', @streetAddress='548 Glovers Ln', @city= 'Farmington', @state='UT', @zip='840250588', @athleticDirector='Kasey Walkenhurst'; 
EXECUTE usp_addSchool @SchoolName= 'Fremont High School', @workPhoneNumber='8014524000', @streetAddress='1900 N 4700 W', @city= 'Ogden', @state='UT', @zip='84404', @athleticDirector='Corey Melaney'; 
EXECUTE usp_addSchool @SchoolName= 'Layton High School', @workPhoneNumber='8014024800', @streetAddress='440 Wasatch Dr', @city= 'Layton', @state='UT', @zip='840413272', @athleticDirector='Jim Batchelor'; 
EXECUTE usp_addSchool @SchoolName= 'Logan High School', @workPhoneNumber='4357552380', @streetAddress='162 W 100 S', @city= 'Logan', @state='UT', @zip='843215298', @athleticDirector='Clair Anderson'; 
EXECUTE usp_addSchool @SchoolName= 'Morgan High School', @workPhoneNumber='8018293418', @streetAddress='55 Trojan Blvd', @city= 'Morgan', @state='UT', @zip='840500917', @athleticDirector='Tyrel Mikesell'; 
EXECUTE usp_addSchool @SchoolName= 'Mountain Crest High School', @workPhoneNumber='4357927765', @streetAddress='255 South 800 East', @city= 'Hyrum', @state='UT', @zip='84319', @athleticDirector='Kevin Anderson'; 
EXECUTE usp_addSchool @SchoolName= 'Northridge High School', @workPhoneNumber='8014028500', @streetAddress='2430 N Hillfield Rd', @city= 'Layton', @state='UT', @zip='84041', @athleticDirector='Jason Duckworth'; 
EXECUTE usp_addSchool @SchoolName= 'Roy High School', @workPhoneNumber='8017744922', @streetAddress='2150 W 4800 S', @city= 'Roy', @state='UT', @zip='840671899', @athleticDirector='Mike Puzey'; 
EXECUTE usp_addSchool @SchoolName= 'Sky View High School', @workPhoneNumber='4355636273', @streetAddress='520 S 250 E', @city= 'Smithfield', @state='UT', @zip='843351699', @athleticDirector='Ryan Grunig'; 
EXECUTE usp_addSchool @SchoolName= 'Syracuse High School', @workPhoneNumber='8014027900', @streetAddress='665 S 2000 W', @city= 'Syracuse', @state='UT', @zip='84075', @athleticDirector='Kelly Anderson'; 
EXECUTE usp_addSchool @SchoolName= 'Weber High School', @workPhoneNumber='8017463700', @streetAddress='3650 N 500 W', @city= 'Ogden', @state='UT', @zip='844141455', @athleticDirector='Ted Peterson'; 
EXECUTE usp_addSchool @SchoolName= 'Ben Lomond High School', @workPhoneNumber='8017377965', @streetAddress='800 Scots Ln', @city= 'Ogden', @state='UT', @zip='844045199', @athleticDirector='Dirk Barber'; 
EXECUTE usp_addSchool @SchoolName= 'Bonneville High School', @workPhoneNumber='8014524050', @streetAddress='251 E 4800 S', @city= 'Ogden', @state='UT', @zip='844056199', @athleticDirector='Lance Minmaugh'; 
EXECUTE usp_addSchool @SchoolName= 'Green Canyon High School', @workPhoneNumber='4357929300', @streetAddress='2960 N Wolfpack Way', @city= 'North Logan', @state='UT', @zip='84341', @athleticDirector='Missy Stuart'; 
EXECUTE usp_addSchool @SchoolName= 'Ogden High School', @workPhoneNumber='8017378700', @streetAddress='2828 Harrison Blvd', @city= 'Ogden', @state='UT', @zip='844030398', @athleticDirector='Shawn MacQueen'; 
EXECUTE usp_addSchool @SchoolName= 'Ridgeline High School', @workPhoneNumber='4357927780', @streetAddress='180 North 300 West', @city= 'Millville', @state='UT', @zip='84326', @athleticDirector='Jim Crosbie'; 
EXECUTE usp_addSchool @SchoolName= 'Viewmont High School', @workPhoneNumber='8014024200', @streetAddress='120 W 1000 N', @city= 'Bountiful', @state='UT', @zip='84010', @athleticDirector='Jeff Emery'; 
EXECUTE usp_addSchool @SchoolName= 'Woods Cross High School', @workPhoneNumber='8014024500', @streetAddress='600 W 2200 S', @city= 'Woods Cross', @state='UT', @zip='84087', @athleticDirector='Donna Tippetts'; 

-- Execute addGame
EXECUTE usp_addGame @homeTeam= 'Northridge High School', @visitingTeam='Davis High School', @siteName='Northridge High School', @Sport='Football', @Level='Varsity', @gameDateTime='Aug 26 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Fremont High School', @visitingTeam='Roy High School', @siteName='Fremont High School', @Sport='Football', @Level='Varsity', @gameDateTime='Aug 26 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Layton High School', @visitingTeam='Syracuse High School', @siteName='Layton High School', @Sport='Football', @Level='Varsity', @gameDateTime='Aug 26 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Clearfield High School', @visitingTeam='Weber High School', @siteName='Clearfield High School', @Sport='Football', @Level='Varsity', @gameDateTime='Aug 26 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Morgan High School', @visitingTeam='Bountiful High School', @siteName='Morgan High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Aug 25 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Sky View High School', @visitingTeam='Box Elder High School', @siteName='Sky View High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Aug 25 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Farmington High School', @visitingTeam='Logan High School', @siteName='Farmington High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Aug 25 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Bear River High School', @visitingTeam='Layton High School', @siteName='Bear River High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Aug 25 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Morgan High School', @visitingTeam='Bountiful High School', @siteName='Morgan High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Aug 25 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Sky View High School', @visitingTeam='Box Elder High School', @siteName='Sky View High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Aug 25 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Farmington High School', @visitingTeam='Logan High School', @siteName='Farmington High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Aug 25 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Bear River High School', @visitingTeam='Layton High School', @siteName='Bear River High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Aug 25 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Morgan High School', @visitingTeam='Bountiful High School', @siteName='Morgan High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Aug 25 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Sky View High School', @visitingTeam='Box Elder High School', @siteName='Sky View High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Aug 25 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Farmington High School', @visitingTeam='Logan High School', @siteName='Farmington High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Aug 25 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Bear River High School', @visitingTeam='Layton High School', @siteName='Bear River High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Aug 25 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Clearfield High School', @visitingTeam='Davis High School', @siteName='Clearfield High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 2 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Farmington High School', @visitingTeam='Northridge High School', @siteName='Farmington High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 2 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Roy High School', @visitingTeam='Layton High School', @siteName='Roy High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 2 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Syracuse High School', @visitingTeam='Weber High School', @siteName='Syracuse High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 2 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Bear River High School', @visitingTeam='Box Elder High School', @siteName='Bear River High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 2 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Mountain Crest High School', @visitingTeam='Bonneville High School', @siteName='Mountain Crest High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 2 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Green Canyon High School', @visitingTeam='Morgan High School', @siteName='Green Canyon High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 2 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Ridgeline High School', @visitingTeam='Woods Cross High School', @siteName='Ridgeline High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 2 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Bonneville High School', @visitingTeam='Mountain Crest High School', @siteName='Bonneville High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 2 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Viewmont High School', @visitingTeam='Bonneville High School', @siteName='Viewmont High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 9 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Farmington High School', @visitingTeam='Box Elder High School', @siteName='Farmington High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 9 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Davis High School', @visitingTeam='Layton High School', @siteName='Davis High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 9 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Clearfield High School', @visitingTeam='Fremont High School', @siteName='Clearfield High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 9 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Syracuse High School', @visitingTeam='Roy High School', @siteName='Syracuse High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 9 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Weber High School', @visitingTeam='Northridge High School', @siteName='Weber High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 9 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Bear River High School', @visitingTeam='Ridgeline High School', @siteName='Bear River High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 9 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Green Canyon High School', @visitingTeam='Sky View High School', @siteName='Green Canyon High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 9 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Bountiful High School', @visitingTeam='Woods Cross High School', @siteName='Bountiful High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 9 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Logan High School', @visitingTeam='Mountain Crest High School', @siteName='Logan High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 9 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Northridge High School', @visitingTeam='Clearfield High School', @siteName='Northridge High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 16 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Fremont High School', @visitingTeam='Syracuse High School', @siteName='Fremont High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 16 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Layton High School', @visitingTeam='Weber High School', @siteName='Layton High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 16 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Davis High School', @visitingTeam='Roy High School', @siteName='Davis High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 16 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Bonneville High School', @visitingTeam='Bountiful High School', @siteName='Bonneville High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 16 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Box Elder High School', @visitingTeam='Viewmont High School', @siteName='Box Elder High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 16 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Farmington High School', @visitingTeam='Woods Cross High School', @siteName='Farmington High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 16 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Mountain Crest High School', @visitingTeam='Green Canyon High School', @siteName='Mountain Crest High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 16 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Logan High School', @visitingTeam='Bear River High School', @siteName='Logan High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 16 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Syracuse High School', @visitingTeam='Davis High School', @siteName='Syracuse High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 23 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Roy High School', @visitingTeam='Northridge High School', @siteName='Roy High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 23 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Weber High School', @visitingTeam='Fremont High School', @siteName='Weber High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 23 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Bonneville High School', @visitingTeam='Woods Cross High School', @siteName='Bonneville High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 23 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Bountiful High School', @visitingTeam='Box Elder High School', @siteName='Bountiful High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 23 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Bear River High School', @visitingTeam='Green Canyon High School', @siteName='Bear River High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 23 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Ridgeline High School', @visitingTeam='Logan High School', @siteName='Ridgeline High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 23 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Sky View High School', @visitingTeam='Mountain Crest High School', @siteName='Sky View High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 23 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Clearfield High School', @visitingTeam='Farmington High School', @siteName='Clearfield High School', @Sport='Football', @Level='Varsity', @gameDateTime='Sep 23 2022 7:00 PM';
EXECUTE usp_addGame @homeTeam= 'Northridge High School', @visitingTeam='Fremont High School', @siteName='Northridge High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Aug 30 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Weber High School', @visitingTeam='Layton High School', @siteName='Weber High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Aug 30 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Clearfield High School', @visitingTeam='Syracuse High School', @siteName='Clearfield High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Aug 30 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Sky View High School', @visitingTeam='Box Elder High School', @siteName='Sky View High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Aug 30 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Roy High School', @visitingTeam='Davis High School', @siteName='Roy High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Aug 30 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Northridge High School', @visitingTeam='Fremont High School', @siteName='Northridge High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Aug 30 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Weber High School', @visitingTeam='Layton High School', @siteName='Weber High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Aug 30 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Clearfield High School', @visitingTeam='Syracuse High School', @siteName='Clearfield High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Aug 30 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Sky View High School', @visitingTeam='Box Elder High School', @siteName='Sky View High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Aug 30 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Roy High School', @visitingTeam='Davis High School', @siteName='Roy High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Aug 30 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Northridge High School', @visitingTeam='Fremont High School', @siteName='Northridge High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Aug 30 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Weber High School', @visitingTeam='Layton High School', @siteName='Weber High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Aug 30 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Clearfield High School', @visitingTeam='Syracuse High School', @siteName='Clearfield High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Aug 30 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Sky View High School', @visitingTeam='Box Elder High School', @siteName='Sky View High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Aug 30 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Roy High School', @visitingTeam='Davis High School', @siteName='Roy High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Aug 30 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Davis High School', @visitingTeam='Fremont High School', @siteName='Davis High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 01 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Roy High School', @visitingTeam='Layton High School', @siteName='Roy High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 01 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Northridge High School', @visitingTeam='Syracuse High School', @siteName='Northridge High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 01 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Green Canyon High School', @visitingTeam='Farmington High School', @siteName='Green Canyon High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 01 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Davis High School', @visitingTeam='Fremont High School', @siteName='Davis High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 01 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Roy High School', @visitingTeam='Layton High School', @siteName='Roy High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 01 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Northridge High School', @visitingTeam='Syracuse High School', @siteName='Northridge High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 01 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Green Canyon High School', @visitingTeam='Farmington High School', @siteName='Green Canyon High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 01 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Davis High School', @visitingTeam='Fremont High School', @siteName='Davis High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 01 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Roy High School', @visitingTeam='Layton High School', @siteName='Roy High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 01 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Northridge High School', @visitingTeam='Syracuse High School', @siteName='Northridge High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 01 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Green Canyon High School', @visitingTeam='Farmington High School', @siteName='Green Canyon High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 01 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Layton High School', @visitingTeam='Davis High School', @siteName='Layton High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 08 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Syracuse High School', @visitingTeam='Fremont High School', @siteName='Syracuse High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 08 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Weber High School', @visitingTeam='Northridge High School', @siteName='Weber High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 08 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Bear River High School', @visitingTeam='Box Elder High School', @siteName='Bear River High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 08 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Layton High School', @visitingTeam='Davis High School', @siteName='Layton High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 08 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Syracuse High School', @visitingTeam='Fremont High School', @siteName='Syracuse High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 08 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Weber High School', @visitingTeam='Northridge High School', @siteName='Weber High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 08 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Bear River High School', @visitingTeam='Box Elder High School', @siteName='Bear River High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 08 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Layton High School', @visitingTeam='Davis High School', @siteName='Layton High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 08 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Syracuse High School', @visitingTeam='Fremont High School', @siteName='Syracuse High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 08 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Weber High School', @visitingTeam='Northridge High School', @siteName='Weber High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 08 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Bear River High School', @visitingTeam='Box Elder High School', @siteName='Bear River High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 08 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Clearfield High School', @visitingTeam='Layton High School', @siteName='Clearfield High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 13 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Roy High School', @visitingTeam='Northridge High School', @siteName='Roy High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 13 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Davis High School', @visitingTeam='Syracuse High School', @siteName='Davis High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 13 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Bear River High School', @visitingTeam='Mountain Crest High School', @siteName='Bear River High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 13 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Logan High School', @visitingTeam='Sky View High School', @siteName='Logan High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 13 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Clearfield High School', @visitingTeam='Layton High School', @siteName='Clearfield High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 13 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Roy High School', @visitingTeam='Northridge High School', @siteName='Roy High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 13 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Davis High School', @visitingTeam='Syracuse High School', @siteName='Davis High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 13 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Bear River High School', @visitingTeam='Mountain Crest High School', @siteName='Bear River High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 13 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Logan High School', @visitingTeam='Sky View High School', @siteName='Logan High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 13 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Clearfield High School', @visitingTeam='Layton High School', @siteName='Clearfield High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 13 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Roy High School', @visitingTeam='Northridge High School', @siteName='Roy High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 13 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Davis High School', @visitingTeam='Syracuse High School', @siteName='Davis High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 13 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Bear River High School', @visitingTeam='Mountain Crest High School', @siteName='Bear River High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 13 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Logan High School', @visitingTeam='Sky View High School', @siteName='Logan High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 13 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Clearfield High School', @visitingTeam='Davis High School', @siteName='Clearfield High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 15 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Roy High School', @visitingTeam='Fremont High School', @siteName='Roy High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 15 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Layton High School', @visitingTeam='Northridge High School', @siteName='Layton High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 15 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Weber High School', @visitingTeam='Syracuse High School', @siteName='Weber High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 15 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Bonneville High School', @visitingTeam='Farmington High School', @siteName='Bonneville High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 15 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Ridgeline High School', @visitingTeam='Bear River High School', @siteName='Ridgeline High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 15 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Mountain Crest High School', @visitingTeam='Sky View High School', @siteName='Mountain Crest High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 15 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Clearfield High School', @visitingTeam='Davis High School', @siteName='Clearfield High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 15 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Roy High School', @visitingTeam='Fremont High School', @siteName='Roy High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 15 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Layton High School', @visitingTeam='Northridge High School', @siteName='Layton High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 15 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Weber High School', @visitingTeam='Syracuse High School', @siteName='Weber High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 15 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Bonneville High School', @visitingTeam='Farmington High School', @siteName='Bonneville High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 15 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Ridgeline High School', @visitingTeam='Bear River High School', @siteName='Ridgeline High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 15 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Mountain Crest High School', @visitingTeam='Sky View High School', @siteName='Mountain Crest High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 15 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Clearfield High School', @visitingTeam='Davis High School', @siteName='Clearfield High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 15 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Roy High School', @visitingTeam='Fremont High School', @siteName='Roy High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 15 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Layton High School', @visitingTeam='Northridge High School', @siteName='Layton High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 15 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Weber High School', @visitingTeam='Syracuse High School', @siteName='Weber High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 15 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Bonneville High School', @visitingTeam='Farmington High School', @siteName='Bonneville High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 15 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Ridgeline High School', @visitingTeam='Bear River High School', @siteName='Ridgeline High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 15 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Mountain Crest High School', @visitingTeam='Sky View High School', @siteName='Mountain Crest High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 15 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Davis High School', @visitingTeam='Weber High School', @siteName='Davis High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 20 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Layton High School', @visitingTeam='Fremont High School', @siteName='Layton High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 20 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Syracuse High School', @visitingTeam='Roy High School', @siteName='Syracuse High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 20 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Green Canyon High School', @visitingTeam='Mountain Crest High School', @siteName='Green Canyon High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 20 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Bear River High School', @visitingTeam='Sky View High School', @siteName='Bear River High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 20 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Davis High School', @visitingTeam='Weber High School', @siteName='Davis High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 20 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Layton High School', @visitingTeam='Fremont High School', @siteName='Layton High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 20 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Syracuse High School', @visitingTeam='Roy High School', @siteName='Syracuse High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 20 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Green Canyon High School', @visitingTeam='Mountain Crest High School', @siteName='Green Canyon High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 20 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Bear River High School', @visitingTeam='Sky View High School', @siteName='Bear River High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 20 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Davis High School', @visitingTeam='Weber High School', @siteName='Davis High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 20 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Layton High School', @visitingTeam='Fremont High School', @siteName='Layton High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 20 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Syracuse High School', @visitingTeam='Roy High School', @siteName='Syracuse High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 20 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Green Canyon High School', @visitingTeam='Mountain Crest High School', @siteName='Green Canyon High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 20 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Bear River High School', @visitingTeam='Sky View High School', @siteName='Bear River High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 20 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Northridge High School', @visitingTeam='Davis High School', @siteName='Northridge High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 22 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Syracuse High School', @visitingTeam='Layton High School', @siteName='Syracuse High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 22 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Box Elder High School', @visitingTeam='Woods Cross High School', @siteName='Box Elder High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 22 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Mountain Crest High School', @visitingTeam='Logan High School', @siteName='Mountain Crest High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 22 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Sky View High School', @visitingTeam='Ridgeline High School', @siteName='Sky View High School', @Sport='Volleyball', @Level='Varsity', @gameDateTime='Sep 22 2022 6:30 PM';
EXECUTE usp_addGame @homeTeam= 'Northridge High School', @visitingTeam='Davis High School', @siteName='Northridge High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 22 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Syracuse High School', @visitingTeam='Layton High School', @siteName='Syracuse High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 22 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Box Elder High School', @visitingTeam='Woods Cross High School', @siteName='Box Elder High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 22 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Mountain Crest High School', @visitingTeam='Logan High School', @siteName='Mountain Crest High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 22 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Sky View High School', @visitingTeam='Ridgeline High School', @siteName='Sky View High School', @Sport='Volleyball', @Level='Junior Varsity', @gameDateTime='Sep 22 2022 5:00 PM';
EXECUTE usp_addGame @homeTeam= 'Northridge High School', @visitingTeam='Davis High School', @siteName='Northridge High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 22 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Syracuse High School', @visitingTeam='Layton High School', @siteName='Syracuse High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 22 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Box Elder High School', @visitingTeam='Woods Cross High School', @siteName='Box Elder High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 22 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Mountain Crest High School', @visitingTeam='Logan High School', @siteName='Mountain Crest High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 22 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Sky View High School', @visitingTeam='Ridgeline High School', @siteName='Sky View High School', @Sport='Volleyball', @Level='Sophomore', @gameDateTime='Sep 22 2022 3:30 PM';
EXECUTE usp_addGame @homeTeam= 'Northridge High School', @visitingTeam='Layton High School', @siteName='Northridge High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 23 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Davis High School', @visitingTeam='Roy High School', @siteName='Davis High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 23 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Farmington High School', @visitingTeam='Viewmont High School', @siteName='Farmington High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 23 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Fremont High School', @visitingTeam='Weber High School', @siteName='Fremont High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 23 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Woods Cross High School', @visitingTeam='Bonneville High School', @siteName='Woods Cross High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 23 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Clearfield High School', @visitingTeam='Syracuse High School', @siteName='Clearfield High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 23 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Bountiful High School', @visitingTeam='Box Elder High School', @siteName='Bountiful High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 23 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Box Elder High School', @visitingTeam='Woods Cross High School', @siteName='Box Elder High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 25 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Fremont High School', @visitingTeam='Clearfield High School', @siteName='Fremont High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 25 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Weber High School', @visitingTeam='Northridge High School', @siteName='Weber High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 25 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Syracuse High School', @visitingTeam='Roy High School', @siteName='Syracuse High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 25 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Bountiful High School', @visitingTeam='Viewmont High School', @siteName='Bountiful High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 25 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Bonneville High School', @visitingTeam='Farmington High School', @siteName='Bonneville High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 25 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Layton High School', @visitingTeam='Davis High School', @siteName='Layton High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 25 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Viewmont High School', @visitingTeam='Box Elder High School', @siteName='Viewmont High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 30 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Clearfield High School', @visitingTeam='Layton High School', @siteName='Clearfield High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 30 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Woods Cross High School', @visitingTeam='Farmington High School', @siteName='Woods Cross High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 30 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Roy High School', @visitingTeam='Weber High School', @siteName='Roy High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 30 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Bountiful High School', @visitingTeam='Bonneville High School', @siteName='Bountiful High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 30 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Northridge High School', @visitingTeam='Syracuse High School', @siteName='Northridge High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 30 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Bear River High School', @visitingTeam='Ridgeline High School', @siteName='Bear River High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 30 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Sky View High School', @visitingTeam='Green Canyon High School', @siteName='Sky View High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 30 2022 3:00 PM';
EXECUTE usp_addGame @homeTeam= 'Logan High School', @visitingTeam='Mountain Crest High School', @siteName='Logan High School', @Sport='Soccer Women', @Level='Varsity', @gameDateTime='Aug 30 2022 3:00 PM';

-- Execute addOfficiatingPosition
EXECUTE usp_addOfficiatingPosition @PositionName='Referee';
EXECUTE usp_addOfficiatingPosition @PositionName='Umpire';
EXECUTE usp_addOfficiatingPosition @PositionName='Head Linesman';
EXECUTE usp_addOfficiatingPosition @PositionName='Line Judge';
EXECUTE usp_addOfficiatingPosition @PositionName='Back Judge';
EXECUTE usp_addOfficiatingPosition @PositionName='Assistant Referee Left';
EXECUTE usp_addOfficiatingPosition @PositionName='Assistant Referee Right';
EXECUTE usp_addOfficiatingPosition @PositionName='Plate Umpire';
EXECUTE usp_addOfficiatingPosition @PositionName='Base Umpire';


-- Execute usp_addOfficialQualification
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='ack.devin@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='ack.devin@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='adambaxter@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='adambaxter@yahoo.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='adambaxter@yahoo.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='adambaxter@yahoo.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='adammarietti@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='alan.hunsaker@hsc.utah.edu', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='andrewunitoa@mail.weber.edu', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='andrewunitoa@mail.weber.edu', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='andrewunitoa@mail.weber.edu', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='andrewunitoa@mail.weber.edu', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='anthonyharris@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='barronhatfield@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='bga78@msn.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='bga78@msn.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='bjross33@netzero.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='blainkilburn@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='bobcarre@live.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='bobcarre@live.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='bobcarre@live.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='bobcarre@live.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='boomer3685@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='braddavies50@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='bradpoll@wsd.net', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='brandon@petro.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='brandon@petro.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='brett.ward@gmail.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='brett.ward@gmail.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='brett.ward@gmail.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='brettdyer@live.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='brevindyer29@live.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='brfootball67@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='brownfgary@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='bryanburningham@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='bryanburningham@hotmail.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='bryanburningham@hotmail.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='bryanburningham@hotmail.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='burnettdan@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='burnettdan@hotmail.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='burnettdan@hotmail.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='burnettdan@hotmail.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='bwj9999@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='cactuscutler89@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='calvinking@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='carsonharry@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='cartercarl_358@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='cartercarl_358@hotmail.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='cartercarl_358@hotmail.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='cartercarl_358@hotmail.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='caseyjack@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='cgermany@comcast.net', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='chad.richins@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='clifflaw99@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='connor.hoopes@aggiemail.usu.edu', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='corey.williams93@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='coreylayton98@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='coreylayton98@hotmail.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='coreylayton98@hotmail.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='coreylayton98@hotmail.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='craig.larsen@usu.edu', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='cveibell@netzero.net', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='cveibell@netzero.net', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='cveibell@netzero.net', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='cveibell@netzero.net', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='danielrudolph@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='danielrudolph@hotmail.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='danielrudolph@hotmail.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='danielrudolph@hotmail.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='dannyghansen@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='dannywallace@wsd.net', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='dannywallace@wsd.net', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='dannywallace@wsd.net', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='darrintreegold@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='david.dickson@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='david.hansen0000@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='davidbueller@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='davidwarren22@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='davidwarren22@hotmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='ddmartin2020@msn.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='dennish@msn.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='devindom@msn.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='dfc99@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='dfc99@yahoo.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='dfc99@yahoo.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='dfc99@yahoo.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='evandavis@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='football98@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='football98@gmail.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='football98@gmail.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='football98@gmail.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='francis.morgan@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='francis.morgan@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='freddenucci@comcast.net', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='galbraith98@comcast.net', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='gangwerroger@aol.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='gardner1@comcast.net', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='gardner1@comcast.net', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='garrett.horsley@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='georgeeverett@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='graycurtis39@aol.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='grukmuk@msn.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='grukmuk@msn.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='heyvern@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='hill_dennis@outlook.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='jacksonthomas@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='jason.younger@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='jason.younger@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='jeff.jackson1@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='jeff.wall76@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='jeff.wall76@gmail.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='jeff.wall76@gmail.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='jeff.wall76@gmail.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='jeffbraun8@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='jeffdowns@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='jeffrey.hoskins@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='jeremywoverton1@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='john.eliason@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='johnhancock@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='johnmpage@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='johnqnelson@dsdmail.net', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='jon34131.jc@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='jon34131.jc@gmail.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='jon34131.jc@gmail.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='jon34131.jc@gmail.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='jonathankilburn@aol.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='jonathanquist@aerotechmfg.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='joshuapeterson@live.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='kamburny@mstar.net', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='kamburny@mstar.net', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='kamburny@mstar.net', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='kamburny@mstar.net', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='karl.robinson56@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='karlbeckstrom@msn.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='karlbeckstrom@msn.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='karlbeckstrom@msn.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='kconnersUtah@comcast.net', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='kdwilliams@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='kdwilliams@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='keith.hales@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='kevin.norman@aggiemail.usu.edu', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='kevin.tracy@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='kevinc987@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='kevindyer36@digis.net', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='kfh@comcast.net', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='kirk.osborne.ko@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='konnorcullimore@live.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='kraigculli@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='KyleMitchell1990@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='larryhill@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='larryjensen@syracuseut.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='lbirdland@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='ldjbon@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='lester.walker@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='lester.walker@yahoo.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='lester.walker@yahoo.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='lester.walker@yahoo.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='lesterpetersen1@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='marcus.federer@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='marcusmaxey@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='mariofurm@comcast.net', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='mark.mills94@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='mark.welch90@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='mark.welch90@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='markhaney@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='markschofield34@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='marvdeyoung@outlook.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='mathew.willey@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='mathew.willey@hotmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='matt.troy@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='matt.tucker9@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='matt_elkins@msn.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='mattjones@gpi.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='mdavis345@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='meffmckenney12@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='micah.w@aggiemail.usu.edu', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='micah.w@aggiemail.usu.edu', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='michaelengledow@comcast.net', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='mikeb@aspen.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='mikeb@aspen.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='mikeb@aspen.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='mitch.reimer@comcast.net', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='msmcd9853@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='nickcole@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='nickcole@gmail.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='nickcole@gmail.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='nickcole@gmail.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='normanplaizier@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='ottleybradley@msn.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='pagejerod1976@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='paul.bernier@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='paul.bernier@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='paulleonard234@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='peterson98657@comcast.net', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='pilewicz.marvin@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='randall.crowell@autoliv.net', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='randell.waddington@aggiemail.usu.edu', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='randell.waddington@aggiemail.usu.edu', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='randell.waddington@aggiemail.usu.edu', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='randell.waddington@aggiemail.usu.edu', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='randy.shapiro@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='randy_leetham@keybank.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='randy_leetham@keybank.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='randy_leetham@keybank.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='randy_leetham@keybank.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='refchrisadams@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='refchrisadams@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='refwalter@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='reidcarlos23@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='richjeff@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='Robinson.David@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='rogtaylor@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='rogtaylor@hotmail.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='rogtaylor@hotmail.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='rogtaylor@hotmail.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='ronaldkennedy1@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='ronbrenk@q.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='sadlerterrance@msn.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='sampeisley@comcast.net', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='schryversteve@live.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='scott.riley88@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='scottjohnson0909@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='shadley@juno.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='shadley@juno.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='shadley@juno.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='shadley@juno.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='shawnf@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='shawnf@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='Sheldonb@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='Sheldonb@hotmail.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='Sheldonb@hotmail.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='Sheldonb@hotmail.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='sking@munnsmfg.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='sportsref20@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='steven.farnsworth@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='stevenkibler@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='tannerthursday@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='terryjensen209@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='thadporter@yahoo.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='thomas.evans49@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='thomascnoker@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='thomashellstrom@wsd.net', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='tom@relaianet.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='tom@relaianet.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='tom@relaianet.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='tom@relaianet.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='tom@relaianet.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='tomdeelstra@utah.gov', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='tomgriff@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='tomgriff@gmail.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='tomgriff@gmail.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='tomgriff@gmail.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='tommytaylor88@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='tommytaylor88@hotmail.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='tommytaylor88@hotmail.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='tommytaylor88@hotmail.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='trevorcondie@comcast.net', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='trevorcondie@comcast.net', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='trevorcondie@comcast.net', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='trevorcondie@comcast.net', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='trevorking@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Back Judge', @emailAddress='trueandtrue@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='twood9020@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='twood9020@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='twood9020@gmail.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='twood9020@gmail.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='twood9020@gmail.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='tybar14@hotmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='tybar14@hotmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='tybar14@hotmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='tylerrasmussen@msn.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='vshurtliff909@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='wallingtonscott@hotmail.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='wallingtonscott@hotmail.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='wallingtonscott@hotmail.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Line Judge', @emailAddress='wcole@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='wcole@gmail.com', @Sport='Volleyball', @Level='Junior Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='wcole@gmail.com', @Sport='Volleyball', @Level='Sophomore';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='wcole@gmail.com', @Sport='Volleyball', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Umpire', @emailAddress='winter.andrew35@gmail.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='winter.andrew35@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Head Linesman', @emailAddress='zachwinter23@msn.com', @Sport='Football', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='zachwinter23@msn.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='johnqnelson@dsdmail.net', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='boomer3685@yahoo.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='thomascnoker@hotmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='kevin.norman@aggiemail.usu.edu', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='kirk.osborne.ko@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='ottleybradley@msn.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='jeremywoverton1@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='pagejerod1976@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='johnmpage@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='refwalter@yahoo.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='sampeisley@comcast.net', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='lesterpetersen1@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='peterson98657@comcast.net', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='joshuapeterson@live.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='pilewicz.marvin@hotmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='normanplaizier@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='bradpoll@wsd.net', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='thadporter@yahoo.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='jonathanquist@aerotechmfg.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='tylerrasmussen@msn.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='reidcarlos23@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='mitch.reimer@comcast.net', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='richjeff@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='chad.richins@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='scott.riley88@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='Robinson.David@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='karl.robinson56@yahoo.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='zachwinter23@msn.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='johnqnelson@dsdmail.net', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='boomer3685@yahoo.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='thomascnoker@hotmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='kevin.norman@aggiemail.usu.edu', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='kirk.osborne.ko@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='ottleybradley@msn.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='jeremywoverton1@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='pagejerod1976@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='johnmpage@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='refwalter@yahoo.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='sampeisley@comcast.net', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='lesterpetersen1@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='peterson98657@comcast.net', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='joshuapeterson@live.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='pilewicz.marvin@hotmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='normanplaizier@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='bradpoll@wsd.net', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='thadporter@yahoo.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='jonathanquist@aerotechmfg.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='tylerrasmussen@msn.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='reidcarlos23@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='mitch.reimer@comcast.net', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='richjeff@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='chad.richins@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='scott.riley88@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='Robinson.David@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Assistant Referee Right', @emailAddress='karl.robinson56@yahoo.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='zachwinter23@msn.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='johnqnelson@dsdmail.net', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='boomer3685@yahoo.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='thomascnoker@hotmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='kevin.norman@aggiemail.usu.edu', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='kirk.osborne.ko@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='ottleybradley@msn.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='jeremywoverton1@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='pagejerod1976@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='johnmpage@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='refwalter@yahoo.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='sampeisley@comcast.net', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='lesterpetersen1@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='peterson98657@comcast.net', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='joshuapeterson@live.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='pilewicz.marvin@hotmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='normanplaizier@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='bradpoll@wsd.net', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='thadporter@yahoo.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='jonathanquist@aerotechmfg.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='tylerrasmussen@msn.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='reidcarlos23@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='mitch.reimer@comcast.net', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='richjeff@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='chad.richins@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='scott.riley88@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='Robinson.David@gmail.com', @Sport='Soccer Women', @Level='Varsity';
Execute usp_addOfficialQualification @PositionName='Referee', @emailAddress='karl.robinson56@yahoo.com', @Sport='Soccer Women', @Level='Varsity';


-- Execute addGameOfficial
EXECUTE usp_addGameOfficial @emailAddress = 'adambaxter@yahoo.com', @gameDateTime ='Aug 26 2022 7:00 PM', @siteName ='Northridge High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'adammarietti@hotmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Fremont High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'adambaxter@yahoo.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Syracuse High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'adambaxter@yahoo.com', @gameDateTime ='Sep 15 2022 6:30 PM', @siteName ='Weber High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'adambaxter@yahoo.com', @gameDateTime ='Sep 15 2022 5:00 PM', @siteName ='Weber High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'adambaxter@yahoo.com', @gameDateTime ='Sep 15 2022 3:30 PM', @siteName ='Weber High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'adambaxter@yahoo.com', @gameDateTime ='Sep 20 2022 6:30 PM', @siteName ='Layton High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'adambaxter@yahoo.com', @gameDateTime ='Sep 20 2022 5:00 PM', @siteName ='Layton High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'adambaxter@yahoo.com', @gameDateTime ='Sep 20 2022 3:30 PM', @siteName ='Layton High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'adambaxter@yahoo.com', @gameDateTime ='Sep 22 2022 6:30 PM', @siteName ='Northridge High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'adambaxter@yahoo.com', @gameDateTime ='Sep 22 2022 5:00 PM', @siteName ='Northridge High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'adambaxter@yahoo.com', @gameDateTime ='Sep 22 2022 3:30 PM', @siteName ='Northridge High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'alan.hunsaker@hsc.utah.edu', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Green Canyon High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'andrewunitoa@mail.weber.edu', @gameDateTime ='Aug 25 2022 6:30 PM', @siteName ='Morgan High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'andrewunitoa@mail.weber.edu', @gameDateTime ='Aug 25 2022 5:00 PM', @siteName ='Morgan High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'andrewunitoa@mail.weber.edu', @gameDateTime ='Aug 25 2022 3:30 PM', @siteName ='Morgan High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'winter.andrew35@gmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Farmington High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'winter.andrew35@gmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Bear River High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'andrewunitoa@mail.weber.edu', @gameDateTime ='Sep 1 2022 6:30 PM', @siteName ='Davis High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'andrewunitoa@mail.weber.edu', @gameDateTime ='Sep 1 2022 5:00 PM', @siteName ='Davis High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'andrewunitoa@mail.weber.edu', @gameDateTime ='Sep 1 2022 3:30 PM', @siteName ='Davis High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'andrewunitoa@mail.weber.edu', @gameDateTime ='Sep 8 2022 6:30 PM', @siteName ='Layton High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'andrewunitoa@mail.weber.edu', @gameDateTime ='Sep 8 2022 5:00 PM', @siteName ='Layton High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'andrewunitoa@mail.weber.edu', @gameDateTime ='Sep 8 2022 3:30 PM', @siteName ='Layton High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'winter.andrew35@gmail.com', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Fremont High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'winter.andrew35@gmail.com', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Bonneville High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'winter.andrew35@gmail.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Bountiful High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'anthonyharris@gmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Weber High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'barronhatfield@yahoo.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Weber High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'blainkilburn@yahoo.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Logan High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'bobcarre@live.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Mountain Crest High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'bobcarre@live.com', @gameDateTime ='Aug 30 2022 6:30 PM', @siteName ='Clearfield High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'bobcarre@live.com', @gameDateTime ='Aug 30 2022 5:00 PM', @siteName ='Clearfield High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'bobcarre@live.com', @gameDateTime ='Aug 30 2022 3:30 PM', @siteName ='Clearfield High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'bobcarre@live.com', @gameDateTime ='Sep 13 2022 6:30 PM', @siteName ='Davis High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'bobcarre@live.com', @gameDateTime ='Sep 13 2022 5:00 PM', @siteName ='Davis High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'bobcarre@live.com', @gameDateTime ='Sep 13 2022 3:30 PM', @siteName ='Davis High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'bradpoll@wsd.net', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Box Elder High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'braddavies50@hotmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Bonneville High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'ottleybradley@msn.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Davis High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'brandon@petro.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Syracuse High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'brandon@petro.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName='Sky View High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'brandon@petro.com', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Bountiful High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'brett.ward@gmail.com', @gameDateTime ='Aug 25 2022 6:30 PM', @siteName ='Bear River High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'brett.ward@gmail.com', @gameDateTime ='Aug 25 2022 5:00 PM', @siteName ='Bear River High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'brett.ward@gmail.com', @gameDateTime ='Aug 25 2022 3:30 PM', @siteName ='Bear River High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'brettdyer@live.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Viewmont High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'brett.ward@gmail.com', @gameDateTime ='Sep 1 2022 6:30 PM', @siteName ='Green Canyon High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'brett.ward@gmail.com', @gameDateTime ='Sep 1 2022 5:00 PM', @siteName ='Green Canyon High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'brett.ward@gmail.com', @gameDateTime ='Sep 1 2022 3:30 PM', @siteName ='Green Canyon High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'brett.ward@gmail.com', @gameDateTime ='Sep 8 2022 6:30 PM', @siteName ='Bear River High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'brett.ward@gmail.com', @gameDateTime ='Sep 8 2022 5:00 PM', @siteName ='Bear River High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'brett.ward@gmail.com', @gameDateTime ='Sep 8 2022 3:30 PM', @siteName ='Bear River High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'brevindyer29@live.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Farmington High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'bjross33@netzero.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Logan High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'bryanburningham@hotmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Mountain Crest High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'bryanburningham@hotmail.com', @gameDateTime ='Aug 30 2022 6:30 PM', @siteName ='Northridge High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'bryanburningham@hotmail.com', @gameDateTime ='Aug 30 2022 5:00 PM', @siteName ='Northridge High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'bryanburningham@hotmail.com', @gameDateTime ='Aug 30 2022 3:30 PM', @siteName ='Northridge High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'bryanburningham@hotmail.com', @gameDateTime ='Sep 13 2022 6:30 PM', @siteName ='Clearfield High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'bryanburningham@hotmail.com', @gameDateTime ='Sep 13 2022 5:00 PM', @siteName ='Clearfield High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'bryanburningham@hotmail.com', @gameDateTime ='Sep 13 2022 3:30 PM', @siteName ='Clearfield High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'bga78@msn.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Roy High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'bwj9999@hotmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Green Canyon High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'bga78@msn.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Ridgeline High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'bga78@msn.com', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Clearfield High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';


EXECUTE usp_addGameOfficial @emailAddress = 'bga78@msn.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Viewmont High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'bga78@msn.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Bear River High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'calvinking@gmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Logan High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'connor.hoopes@aggiemail.usu.edu', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Bear River High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'cartercarl_358@hotmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Mountain Crest High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'cartercarl_358@hotmail.com', @gameDateTime ='Aug 30 2022 6:30 PM', @siteName ='Weber High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'cartercarl_358@hotmail.com', @gameDateTime ='Aug 30 2022 5:00 PM', @siteName ='Weber High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'cartercarl_358@hotmail.com', @gameDateTime ='Aug 30 2022 3:30 PM', @siteName ='Weber High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'cartercarl_358@hotmail.com', @gameDateTime ='Sep 13 2022 6:30 PM', @siteName ='Roy High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'cartercarl_358@hotmail.com', @gameDateTime ='Sep 13 2022 5:00 PM', @siteName ='Roy High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'cartercarl_358@hotmail.com', @gameDateTime ='Sep 13 2022 3:30 PM', @siteName ='Roy High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'reidcarlos23@gmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Farmington High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'carsonharry@gmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Weber High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'caseyjack@gmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Green Canyon High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'chad.richins@gmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Mountain Crest High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'cveibell@netzero.net', @gameDateTime ='Aug 25 2022 6:30 PM', @siteName ='Morgan High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'cveibell@netzero.net', @gameDateTime ='Aug 25 2022 5:00 PM', @siteName ='Morgan High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'cveibell@netzero.net', @gameDateTime ='Aug 25 2022 3:30 PM', @siteName ='Morgan High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'brfootball67@gmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Farmington High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'boomer3685@yahoo.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Layton High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'cveibell@netzero.net', @gameDateTime ='Sep 1 2022 6:30 PM', @siteName ='Davis High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'cveibell@netzero.net', @gameDateTime ='Sep 1 2022 5:00 PM', @siteName ='Davis High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'cveibell@netzero.net', @gameDateTime ='Sep 1 2022 3:30 PM', @siteName ='Davis High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'cveibell@netzero.net', @gameDateTime ='Sep 8 2022 6:30 PM', @siteName ='Layton High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'cveibell@netzero.net', @gameDateTime ='Sep 8 2022 5:00 PM', @siteName ='Layton High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'cveibell@netzero.net', @gameDateTime ='Sep 8 2022 3:30 PM', @siteName ='Layton High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'refchrisadams@gmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Roy High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'cgermany@comcast.net', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Clearfield High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'refchrisadams@gmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Ridgeline High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'refchrisadams@gmail.com', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Clearfield High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'refchrisadams@gmail.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Viewmont High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'refchrisadams@gmail.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Bear River High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'clifflaw99@yahoo.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Northridge High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'corey.williams93@hotmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Clearfield High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'coreylayton98@hotmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Northridge High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jeff.wall76@gmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Bountiful High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'coreylayton98@hotmail.com', @gameDateTime ='Sep 15 2022 6:30 PM', @siteName ='Bonneville High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'coreylayton98@hotmail.com', @gameDateTime ='Sep 15 2022 5:00 PM', @siteName ='Bonneville High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'coreylayton98@hotmail.com', @gameDateTime ='Sep 15 2022 3:30 PM', @siteName ='Bonneville High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'coreylayton98@hotmail.com', @gameDateTime ='Sep 20 2022 6:30 PM', @siteName ='Green Canyon High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'coreylayton98@hotmail.com', @gameDateTime ='Sep 20 2022 5:00 PM', @siteName ='Green Canyon High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'coreylayton98@hotmail.com', @gameDateTime ='Sep 20 2022 3:30 PM', @siteName ='Green Canyon High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'coreylayton98@hotmail.com', @gameDateTime ='Sep 22 2022 6:30 PM', @siteName ='Box Elder High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'coreylayton98@hotmail.com', @gameDateTime ='Sep 22 2022 5:00 PM', @siteName ='Box Elder High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'coreylayton98@hotmail.com', @gameDateTime ='Sep 22 2022 3:30 PM', @siteName ='Box Elder High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'corey.williams93@hotmail.com', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Farmington High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'corey.williams93@hotmail.com', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Fremont High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'corey.williams93@hotmail.com', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Bountiful High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'corey.williams93@hotmail.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Roy High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'craig.larsen@usu.edu', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Northridge High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'graycurtis39@aol.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Clearfield High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'burnettdan@hotmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Mountain Crest High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'dannyghansen@gmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Weber High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'danielrudolph@hotmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Logan High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'burnettdan@hotmail.com', @gameDateTime ='Aug 30 2022 6:30 PM', @siteName ='Northridge High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'burnettdan@hotmail.com', @gameDateTime ='Aug 30 2022 5:00 PM', @siteName ='Northridge High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'burnettdan@hotmail.com', @gameDateTime ='Aug 30 2022 3:30 PM', @siteName ='Northridge High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'burnettdan@hotmail.com', @gameDateTime ='Sep 13 2022 6:30 PM', @siteName ='Clearfield High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'burnettdan@hotmail.com', @gameDateTime ='Sep 13 2022 5:00 PM', @siteName ='Clearfield High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'burnettdan@hotmail.com', @gameDateTime ='Sep 13 2022 3:30 PM', @siteName ='Clearfield High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'danielrudolph@hotmail.com', @gameDateTime ='Sep 15 2022 6:30 PM', @siteName ='Ridgeline High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'danielrudolph@hotmail.com', @gameDateTime ='Sep 15 2022 5:00 PM', @siteName ='Ridgeline High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'danielrudolph@hotmail.com', @gameDateTime ='Sep 15 2022 3:30 PM', @siteName ='Ridgeline High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'danielrudolph@hotmail.com', @gameDateTime ='Sep 22 2022 6:30 PM', @siteName='Sky View High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'danielrudolph@hotmail.com', @gameDateTime ='Sep 22 2022 5:00 PM', @siteName='Sky View High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'danielrudolph@hotmail.com', @gameDateTime ='Sep 22 2022 3:30 PM', @siteName='Sky View High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'dannywallace@wsd.net', @gameDateTime ='Aug 25 2022 6:30 PM', @siteName ='Farmington High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'dannywallace@wsd.net', @gameDateTime ='Aug 25 2022 5:00 PM', @siteName ='Farmington High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'dannywallace@wsd.net', @gameDateTime ='Aug 25 2022 3:30 PM', @siteName ='Farmington High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'dannywallace@wsd.net', @gameDateTime ='Sep 1 2022 6:30 PM', @siteName ='Northridge High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'dannywallace@wsd.net', @gameDateTime ='Sep 1 2022 5:00 PM', @siteName ='Northridge High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'dannywallace@wsd.net', @gameDateTime ='Sep 1 2022 3:30 PM', @siteName ='Northridge High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'dannywallace@wsd.net', @gameDateTime ='Sep 8 2022 6:30 PM', @siteName ='Weber High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'dannywallace@wsd.net', @gameDateTime ='Sep 8 2022 5:00 PM', @siteName ='Weber High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'dannywallace@wsd.net', @gameDateTime ='Sep 8 2022 3:30 PM', @siteName ='Weber High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'darrintreegold@yahoo.com', @gameDateTime ='Aug 26 2022 7:00 PM', @siteName ='Layton High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'darrintreegold@yahoo.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Weber High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'david.hansen0000@hotmail.com', @gameDateTime ='Aug 26 2022 7:00 PM', @siteName ='Fremont High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'davidwarren22@hotmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Clearfield High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'davidbueller@yahoo.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Bear River High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'david.dickson@gmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Viewmont High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'Robinson.David@gmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Mountain Crest High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'david.hansen0000@hotmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Roy High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'andrewunitoa@mail.weber.edu', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Bountiful High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'davidbueller@yahoo.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Clearfield High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'davidwarren22@hotmail.com', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Davis High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'davidwarren22@hotmail.com', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Syracuse High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'davidwarren22@hotmail.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Woods Cross High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'trueandtrue@gmail.com', @gameDateTime ='Aug 26 2022 7:00 PM', @siteName ='Clearfield High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'trueandtrue@gmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Bonneville High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'dennish@msn.com', @gameDateTime ='Aug 26 2022 7:00 PM', @siteName ='Fremont High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'hill_dennis@outlook.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Bear River High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'ddmartin2020@msn.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Fremont High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'peterson98657@comcast.net', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Box Elder High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'dennish@msn.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Roy High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'ack.devin@gmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Roy High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'dfc99@yahoo.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Green Canyon High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'devindom@msn.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Viewmont High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'ack.devin@gmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Ridgeline High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'dfc99@yahoo.com', @gameDateTime ='Aug 30 2022 6:30 PM', @siteName ='Clearfield High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'dfc99@yahoo.com', @gameDateTime ='Aug 30 2022 5:00 PM', @siteName ='Clearfield High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'dfc99@yahoo.com', @gameDateTime ='Aug 30 2022 3:30 PM', @siteName ='Clearfield High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'dfc99@yahoo.com', @gameDateTime ='Sep 13 2022 6:30 PM', @siteName ='Davis High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'dfc99@yahoo.com', @gameDateTime ='Sep 13 2022 5:00 PM', @siteName ='Davis High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'dfc99@yahoo.com', @gameDateTime ='Sep 13 2022 3:30 PM', @siteName ='Davis High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'ack.devin@gmail.com', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Woods Cross High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'ack.devin@gmail.com', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Box Elder High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'ack.devin@gmail.com', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Layton High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'ack.devin@gmail.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Northridge High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'evandavis@gmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Bonneville High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'freddenucci@comcast.net', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Viewmont High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'garrett.horsley@gmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Bear River High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'brownfgary@yahoo.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Bear River High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'brownfgary@yahoo.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Clearfield High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'georgeeverett@hotmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Davis High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jacksonthomas@yahoo.com', @gameDateTime ='Aug 26 2022 7:00 PM', @siteName ='Layton High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jacksonthomas@yahoo.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Weber High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jason.younger@gmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Roy High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jason.younger@gmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Ridgeline High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jason.younger@gmail.com', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Woods Cross High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jason.younger@gmail.com', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Layton High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jason.younger@gmail.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Northridge High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jeff.wall76@gmail.com', @gameDateTime ='Aug 25 2022 6:30 PM', @siteName ='Farmington High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jeff.wall76@gmail.com', @gameDateTime ='Aug 25 2022 5:00 PM', @siteName ='Farmington High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jeff.wall76@gmail.com', @gameDateTime ='Aug 25 2022 3:30 PM', @siteName ='Farmington High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'jeffbraun8@gmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Bear River High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jeffdowns@gmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Viewmont High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'meffmckenney12@yahoo.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Layton High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'richjeff@gmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Mountain Crest High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jeffbraun8@gmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Clearfield High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jeff.wall76@gmail.com', @gameDateTime ='Sep 1 2022 6:30 PM', @siteName ='Northridge High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jeff.wall76@gmail.com', @gameDateTime ='Sep 1 2022 5:00 PM', @siteName ='Northridge High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jeff.wall76@gmail.com', @gameDateTime ='Sep 1 2022 3:30 PM', @siteName ='Northridge High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'jeff.wall76@gmail.com', @gameDateTime ='Sep 8 2022 6:30 PM', @siteName ='Weber High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jeff.wall76@gmail.com', @gameDateTime ='Sep 8 2022 5:00 PM', @siteName ='Weber High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jeff.wall76@gmail.com', @gameDateTime ='Sep 8 2022 3:30 PM', @siteName ='Weber High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'jeff.jackson1@gmail.com', @gameDateTime ='Aug 26 2022 7:00 PM', @siteName ='Layton High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jeffrey.hoskins@hotmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Bear River High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jeff.jackson1@gmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Weber High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jeremywoverton1@gmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Davis High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'pagejerod1976@gmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Bonneville High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'john.eliason@gmail.com', @gameDateTime ='Aug 26 2022 7:00 PM', @siteName ='Northridge High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'johnhancock@yahoo.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Syracuse High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'johnqnelson@dsdmail.net', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Layton High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'johnmpage@gmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Bonneville High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'john.eliason@gmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Syracuse High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jon34131.jc@gmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Green Canyon High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jonathankilburn@aol.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Logan High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jonathanquist@aerotechmfg.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Farmington High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jon34131.jc@gmail.com', @gameDateTime ='Aug 30 2022 6:30 PM', @siteName='Sky View High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jon34131.jc@gmail.com', @gameDateTime ='Aug 30 2022 5:00 PM', @siteName='Sky View High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jon34131.jc@gmail.com', @gameDateTime ='Aug 30 2022 3:30 PM', @siteName='Sky View High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'jon34131.jc@gmail.com', @gameDateTime ='Sep 13 2022 6:30 PM', @siteName ='Bear River High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jon34131.jc@gmail.com', @gameDateTime ='Sep 13 2022 5:00 PM', @siteName ='Bear River High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jon34131.jc@gmail.com', @gameDateTime ='Sep 13 2022 3:30 PM', @siteName ='Bear River High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'jon34131.jc@gmail.com', @gameDateTime ='Sep 15 2022 6:30 PM', @siteName ='Mountain Crest High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jon34131.jc@gmail.com', @gameDateTime ='Sep 15 2022 5:00 PM', @siteName ='Mountain Crest High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jon34131.jc@gmail.com', @gameDateTime ='Sep 15 2022 3:30 PM', @siteName ='Mountain Crest High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'joshuapeterson@live.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Box Elder High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kamburny@mstar.net', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Mountain Crest High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kamburny@mstar.net', @gameDateTime ='Aug 30 2022 6:30 PM', @siteName ='Weber High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kamburny@mstar.net', @gameDateTime ='Aug 30 2022 5:00 PM', @siteName ='Weber High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kamburny@mstar.net', @gameDateTime ='Aug 30 2022 3:30 PM', @siteName ='Weber High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'kamburny@mstar.net', @gameDateTime ='Sep 13 2022 6:30 PM', @siteName ='Roy High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kamburny@mstar.net', @gameDateTime ='Sep 13 2022 5:00 PM', @siteName ='Roy High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kamburny@mstar.net', @gameDateTime ='Sep 13 2022 3:30 PM', @siteName ='Roy High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'karlbeckstrom@msn.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Syracuse High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'karl.robinson56@yahoo.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Mountain Crest High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'karlbeckstrom@msn.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName='Sky View High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'karlbeckstrom@msn.com', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Bountiful High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'karlbeckstrom@msn.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName='Sky View High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'keith.hales@yahoo.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Syracuse High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kevin.tracy@yahoo.com', @gameDateTime ='Aug 26 2022 7:00 PM', @siteName ='Clearfield High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kconnersUtah@comcast.net', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Ridgeline High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kevinc987@yahoo.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Ridgeline High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kevindyer36@digis.net', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Farmington High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kfh@comcast.net', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Green Canyon High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kevin.norman@aggiemail.usu.edu', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Davis High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kevin.tracy@yahoo.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Bonneville High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kirk.osborne.ko@gmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Davis High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'konnorcullimore@live.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Ridgeline High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kraigculli@hotmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Ridgeline High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kdwilliams@gmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Farmington High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'KyleMitchell1990@gmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Layton High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kdwilliams@gmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Bear River High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kdwilliams@gmail.com', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Farmington High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kdwilliams@gmail.com', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Fremont High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kdwilliams@gmail.com', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Bountiful High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'kdwilliams@gmail.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Roy High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'ldjbon@gmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Bear River High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'larryhill@gmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Bear River High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'larryjensen@syracuseut.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Bountiful High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'ldjbon@gmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Clearfield High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'lbirdland@gmail.com', @gameDateTime ='Aug 26 2022 7:00 PM', @siteName ='Northridge High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'lbirdland@gmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Syracuse High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'lester.walker@yahoo.com', @gameDateTime ='Aug 25 2022 6:30 PM', @siteName='Sky View High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'lester.walker@yahoo.com', @gameDateTime ='Aug 25 2022 5:00 PM', @siteName='Sky View High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'lester.walker@yahoo.com', @gameDateTime ='Aug 25 2022 3:30 PM', @siteName='Sky View High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'lesterpetersen1@gmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Bonneville High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'lester.walker@yahoo.com', @gameDateTime ='Sep 1 2022 6:30 PM', @siteName ='Roy High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'lester.walker@yahoo.com', @gameDateTime ='Sep 1 2022 5:00 PM', @siteName ='Roy High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'lester.walker@yahoo.com', @gameDateTime ='Sep 1 2022 3:30 PM', @siteName ='Roy High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'lester.walker@yahoo.com', @gameDateTime ='Sep 8 2022 6:30 PM', @siteName ='Syracuse High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'lester.walker@yahoo.com', @gameDateTime ='Sep 8 2022 5:00 PM', @siteName ='Syracuse High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'lester.walker@yahoo.com', @gameDateTime ='Sep 8 2022 3:30 PM', @siteName ='Syracuse High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'marcus.federer@yahoo.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Davis High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'marcusmaxey@gmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Fremont High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'mariofurm@comcast.net', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Clearfield High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'mark.welch90@gmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Clearfield High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'cactuscutler89@yahoo.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Bonneville High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'mdavis345@gmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Bonneville High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'markhaney@hotmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Syracuse High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'mark.mills94@gmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Layton High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'markschofield34@gmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Logan High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'randell.waddington@aggiemail.usu.edu', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Bountiful High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'mark.welch90@gmail.com', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Davis High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'mark.welch90@gmail.com', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Syracuse High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'mark.welch90@gmail.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Woods Cross High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'marvdeyoung@outlook.com', @gameDateTime ='Aug 26 2022 7:00 PM', @siteName ='Northridge High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'marvdeyoung@outlook.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Syracuse High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'pilewicz.marvin@hotmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Box Elder High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'mathew.willey@hotmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Clearfield High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'lester.walker@yahoo.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Bountiful High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'mathew.willey@hotmail.com', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Farmington High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'mathew.willey@hotmail.com', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Fremont High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'mathew.willey@hotmail.com', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Bountiful High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'mathew.willey@hotmail.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Roy High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'matt.troy@gmail.com', @gameDateTime ='Aug 26 2022 7:00 PM', @siteName ='Clearfield High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'matt.tucker9@gmail.com', @gameDateTime ='Aug 26 2022 7:00 PM', @siteName ='Clearfield High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'matt_elkins@msn.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Farmington High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'msmcd9853@gmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Fremont High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'matt.troy@gmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Bonneville High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'matt.tucker9@gmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Bonneville High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'mattjones@gpi.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Bountiful High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'micah.w@aggiemail.usu.edu', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Clearfield High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'micah.w@aggiemail.usu.edu', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Bountiful High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'micah.w@aggiemail.usu.edu', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Davis High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'micah.w@aggiemail.usu.edu', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Syracuse High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'micah.w@aggiemail.usu.edu', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Woods Cross High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'michaelengledow@comcast.net', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Davis High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'mikeb@aspen.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Syracuse High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'mikeb@aspen.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName='Sky View High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'mikeb@aspen.com', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Box Elder High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'mikeb@aspen.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName='Sky View High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'mitch.reimer@comcast.net', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Farmington High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'francis.morgan@gmail.com', @gameDateTime ='Aug 26 2022 7:00 PM', @siteName ='Fremont High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'francis.morgan@gmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Roy High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'francis.morgan@gmail.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Logan High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'nickcole@gmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Green Canyon High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'nickcole@gmail.com', @gameDateTime ='Aug 30 2022 6:30 PM', @siteName='Sky View High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'nickcole@gmail.com', @gameDateTime ='Aug 30 2022 5:00 PM', @siteName='Sky View High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'nickcole@gmail.com', @gameDateTime ='Aug 30 2022 3:30 PM', @siteName='Sky View High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'nickcole@gmail.com', @gameDateTime ='Sep 13 2022 6:30 PM', @siteName ='Bear River High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'nickcole@gmail.com', @gameDateTime ='Sep 13 2022 5:00 PM', @siteName ='Bear River High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'nickcole@gmail.com', @gameDateTime ='Sep 13 2022 3:30 PM', @siteName ='Bear River High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'nickcole@gmail.com', @gameDateTime ='Sep 15 2022 6:30 PM', @siteName ='Mountain Crest High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'nickcole@gmail.com', @gameDateTime ='Sep 15 2022 5:00 PM', @siteName ='Mountain Crest High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'nickcole@gmail.com', @gameDateTime ='Sep 15 2022 3:30 PM', @siteName ='Mountain Crest High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'normanplaizier@gmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Box Elder High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'paul.bernier@gmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Syracuse High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'paulleonard234@yahoo.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Fremont High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'paul.bernier@gmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName='Sky View High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'paul.bernier@gmail.com', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Box Elder High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'randall.crowell@autoliv.net', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Ridgeline High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'randell.waddington@aggiemail.usu.edu', @gameDateTime ='Aug 25 2022 6:30 PM', @siteName='Sky View High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'randell.waddington@aggiemail.usu.edu', @gameDateTime ='Aug 25 2022 5:00 PM', @siteName='Sky View High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'randell.waddington@aggiemail.usu.edu', @gameDateTime ='Aug 25 2022 3:30 PM', @siteName='Sky View High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'randell.waddington@aggiemail.usu.edu', @gameDateTime ='Sep 1 2022 6:30 PM', @siteName ='Roy High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'randell.waddington@aggiemail.usu.edu', @gameDateTime ='Sep 1 2022 5:00 PM', @siteName ='Roy High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'randell.waddington@aggiemail.usu.edu', @gameDateTime ='Sep 1 2022 3:30 PM', @siteName ='Roy High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'randell.waddington@aggiemail.usu.edu', @gameDateTime ='Sep 8 2022 6:30 PM', @siteName ='Syracuse High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'randell.waddington@aggiemail.usu.edu', @gameDateTime ='Sep 8 2022 5:00 PM', @siteName ='Syracuse High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'randell.waddington@aggiemail.usu.edu', @gameDateTime ='Sep 8 2022 3:30 PM', @siteName ='Syracuse High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'gardner1@comcast.net', @gameDateTime ='Aug 26 2022 7:00 PM', @siteName ='Fremont High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'grukmuk@msn.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Roy High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'randy_leetham@keybank.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Northridge High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'gardner1@comcast.net', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Roy High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'grukmuk@msn.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Ridgeline High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'randy_leetham@keybank.com', @gameDateTime ='Sep 15 2022 6:30 PM', @siteName ='Bonneville High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'randy_leetham@keybank.com', @gameDateTime ='Sep 15 2022 5:00 PM', @siteName ='Bonneville High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'randy_leetham@keybank.com', @gameDateTime ='Sep 15 2022 3:30 PM', @siteName ='Bonneville High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'randy_leetham@keybank.com', @gameDateTime ='Sep 20 2022 6:30 PM', @siteName ='Green Canyon High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'randy_leetham@keybank.com', @gameDateTime ='Sep 20 2022 5:00 PM', @siteName ='Green Canyon High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'randy_leetham@keybank.com', @gameDateTime ='Sep 20 2022 3:30 PM', @siteName ='Green Canyon High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'randy_leetham@keybank.com', @gameDateTime ='Sep 22 2022 6:30 PM', @siteName ='Box Elder High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'randy_leetham@keybank.com', @gameDateTime ='Sep 22 2022 5:00 PM', @siteName ='Box Elder High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'randy_leetham@keybank.com', @gameDateTime ='Sep 22 2022 3:30 PM', @siteName ='Box Elder High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'randy.shapiro@gmail.com', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Northridge High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'grukmuk@msn.com', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Clearfield High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'randy.shapiro@gmail.com', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Weber High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'grukmuk@msn.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Viewmont High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'randy.shapiro@gmail.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Clearfield High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'grukmuk@msn.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Bear River High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'gardner1@comcast.net', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Logan High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'galbraith98@comcast.net', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Clearfield High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'rogtaylor@hotmail.com', @gameDateTime ='Aug 26 2022 7:00 PM', @siteName ='Layton High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'gangwerroger@aol.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Clearfield High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'rogtaylor@hotmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Weber High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'rogtaylor@hotmail.com', @gameDateTime ='Sep 15 2022 6:30 PM', @siteName ='Roy High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'rogtaylor@hotmail.com', @gameDateTime ='Sep 15 2022 5:00 PM', @siteName ='Roy High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'rogtaylor@hotmail.com', @gameDateTime ='Sep 15 2022 3:30 PM', @siteName ='Roy High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'rogtaylor@hotmail.com', @gameDateTime ='Sep 20 2022 6:30 PM', @siteName ='Bear River High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'rogtaylor@hotmail.com', @gameDateTime ='Sep 20 2022 5:00 PM', @siteName ='Bear River High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'rogtaylor@hotmail.com', @gameDateTime ='Sep 20 2022 3:30 PM', @siteName ='Bear River High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'rogtaylor@hotmail.com', @gameDateTime ='Sep 22 2022 6:30 PM', @siteName ='Mountain Crest High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'rogtaylor@hotmail.com', @gameDateTime ='Sep 22 2022 5:00 PM', @siteName ='Mountain Crest High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'rogtaylor@hotmail.com', @gameDateTime ='Sep 22 2022 3:30 PM', @siteName ='Mountain Crest High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'ronbrenk@q.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Bear River High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'ronbrenk@q.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Clearfield High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'sportsref20@yahoo.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Farmington High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'ronaldkennedy1@yahoo.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Bountiful High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'sampeisley@comcast.net', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Bonneville High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'wallingtonscott@hotmail.com', @gameDateTime ='Aug 25 2022 6:30 PM', @siteName ='Bear River High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'wallingtonscott@hotmail.com', @gameDateTime ='Aug 25 2022 5:00 PM', @siteName ='Bear River High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'wallingtonscott@hotmail.com', @gameDateTime ='Aug 25 2022 3:30 PM', @siteName ='Bear River High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'scottjohnson0909@hotmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Bountiful High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'sking@munnsmfg.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Logan High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'scott.riley88@gmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Mountain Crest High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'wallingtonscott@hotmail.com', @gameDateTime ='Sep 1 2022 6:30 PM', @siteName ='Green Canyon High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'wallingtonscott@hotmail.com', @gameDateTime ='Sep 1 2022 5:00 PM', @siteName ='Green Canyon High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'wallingtonscott@hotmail.com', @gameDateTime ='Sep 1 2022 3:30 PM', @siteName ='Green Canyon High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'wallingtonscott@hotmail.com', @gameDateTime ='Sep 8 2022 6:30 PM', @siteName ='Bear River High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'wallingtonscott@hotmail.com', @gameDateTime ='Sep 8 2022 5:00 PM', @siteName ='Bear River High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'wallingtonscott@hotmail.com', @gameDateTime ='Sep 8 2022 3:30 PM', @siteName ='Bear River High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'shawnf@gmail.com', @gameDateTime ='Aug 26 2022 7:00 PM', @siteName ='Fremont High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'shawnf@gmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Roy High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'shawnf@gmail.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Logan High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'Sheldonb@hotmail.com', @gameDateTime ='Aug 26 2022 7:00 PM', @siteName ='Northridge High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'Sheldonb@hotmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Syracuse High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'Sheldonb@hotmail.com', @gameDateTime ='Sep 15 2022 6:30 PM', @siteName ='Weber High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'Sheldonb@hotmail.com', @gameDateTime ='Sep 15 2022 5:00 PM', @siteName ='Weber High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'Sheldonb@hotmail.com', @gameDateTime ='Sep 15 2022 3:30 PM', @siteName ='Weber High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'Sheldonb@hotmail.com', @gameDateTime ='Sep 20 2022 6:30 PM', @siteName ='Layton High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'Sheldonb@hotmail.com', @gameDateTime ='Sep 20 2022 5:00 PM', @siteName ='Layton High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'Sheldonb@hotmail.com', @gameDateTime ='Sep 20 2022 3:30 PM', @siteName ='Layton High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'Sheldonb@hotmail.com', @gameDateTime ='Sep 22 2022 6:30 PM', @siteName ='Northridge High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'Sheldonb@hotmail.com', @gameDateTime ='Sep 22 2022 5:00 PM', @siteName ='Northridge High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'Sheldonb@hotmail.com', @gameDateTime ='Sep 22 2022 3:30 PM', @siteName ='Northridge High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'schryversteve@live.com', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Northridge High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'schryversteve@live.com', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Weber High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'schryversteve@live.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Clearfield High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'steven.farnsworth@gmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Davis High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'shadley@juno.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Syracuse High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'stevenkibler@gmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Logan High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'shadley@juno.com', @gameDateTime ='Sep 15 2022 6:30 PM', @siteName ='Clearfield High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'shadley@juno.com', @gameDateTime ='Sep 15 2022 5:00 PM', @siteName ='Clearfield High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'shadley@juno.com', @gameDateTime ='Sep 15 2022 3:30 PM', @siteName ='Clearfield High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'shadley@juno.com', @gameDateTime ='Sep 20 2022 6:30 PM', @siteName ='Syracuse High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'shadley@juno.com', @gameDateTime ='Sep 20 2022 5:00 PM', @siteName ='Syracuse High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'shadley@juno.com', @gameDateTime ='Sep 20 2022 3:30 PM', @siteName ='Syracuse High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'tannerthursday@gmail.com', @gameDateTime ='Aug 26 2022 7:00 PM', @siteName ='Clearfield High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tannerthursday@gmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Bonneville High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'sadlerterrance@msn.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Logan High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'terryjensen209@hotmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Bountiful High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'thadporter@yahoo.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Farmington High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'twood9020@gmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Farmington High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'thomas.evans49@gmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Davis High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tomgriff@gmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Syracuse High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'thomashellstrom@wsd.net', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Weber High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'thomascnoker@hotmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Davis High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'twood9020@gmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Bear River High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tomgriff@gmail.com', @gameDateTime ='Sep 15 2022 6:30 PM', @siteName ='Clearfield High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'twood9020@gmail.com', @gameDateTime ='Sep 15 2022 6:30 PM', @siteName ='Layton High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tomgriff@gmail.com', @gameDateTime ='Sep 15 2022 5:00 PM', @siteName ='Clearfield High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'twood9020@gmail.com', @gameDateTime ='Sep 15 2022 5:00 PM', @siteName ='Layton High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tomgriff@gmail.com', @gameDateTime ='Sep 15 2022 3:30 PM', @siteName ='Clearfield High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'twood9020@gmail.com', @gameDateTime ='Sep 15 2022 3:30 PM', @siteName ='Layton High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'twood9020@gmail.com', @gameDateTime ='Sep 20 2022 6:30 PM', @siteName ='Davis High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tomgriff@gmail.com', @gameDateTime ='Sep 20 2022 6:30 PM', @siteName ='Syracuse High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'twood9020@gmail.com', @gameDateTime ='Sep 20 2022 5:00 PM', @siteName ='Davis High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tomgriff@gmail.com', @gameDateTime ='Sep 20 2022 5:00 PM', @siteName ='Syracuse High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'twood9020@gmail.com', @gameDateTime ='Sep 20 2022 3:30 PM', @siteName ='Davis High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'tomgriff@gmail.com', @gameDateTime ='Sep 20 2022 3:30 PM', @siteName ='Syracuse High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'twood9020@gmail.com', @gameDateTime ='Sep 22 2022 6:30 PM', @siteName ='Syracuse High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'twood9020@gmail.com', @gameDateTime ='Sep 22 2022 5:00 PM', @siteName ='Syracuse High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'twood9020@gmail.com', @gameDateTime ='Sep 22 2022 3:30 PM', @siteName ='Syracuse High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'twood9020@gmail.com', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Fremont High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'twood9020@gmail.com', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Bonneville High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'twood9020@gmail.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Bountiful High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tomdeelstra@utah.gov', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Bonneville High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tommytaylor88@hotmail.com', @gameDateTime ='Aug 26 2022 7:00 PM', @siteName ='Layton High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tommytaylor88@hotmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Weber High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tommytaylor88@hotmail.com', @gameDateTime ='Sep 15 2022 6:30 PM', @siteName ='Roy High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tommytaylor88@hotmail.com', @gameDateTime ='Sep 15 2022 5:00 PM', @siteName ='Roy High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tommytaylor88@hotmail.com', @gameDateTime ='Sep 15 2022 3:30 PM', @siteName ='Roy High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'tommytaylor88@hotmail.com', @gameDateTime ='Sep 20 2022 6:30 PM', @siteName ='Bear River High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tommytaylor88@hotmail.com', @gameDateTime ='Sep 20 2022 5:00 PM', @siteName ='Bear River High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tommytaylor88@hotmail.com', @gameDateTime ='Sep 20 2022 3:30 PM', @siteName ='Bear River High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'tommytaylor88@hotmail.com', @gameDateTime ='Sep 22 2022 6:30 PM', @siteName ='Mountain Crest High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tommytaylor88@hotmail.com', @gameDateTime ='Sep 22 2022 5:00 PM', @siteName ='Mountain Crest High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tommytaylor88@hotmail.com', @gameDateTime ='Sep 22 2022 3:30 PM', @siteName ='Mountain Crest High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'tom@relaianet.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Farmington High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'trevorcondie@comcast.net', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Green Canyon High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'trevorking@gmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Northridge High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tom@relaianet.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Bear River High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'trevorcondie@comcast.net', @gameDateTime ='Aug 30 2022 6:30 PM', @siteName ='Roy High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'trevorcondie@comcast.net', @gameDateTime ='Aug 30 2022 5:00 PM', @siteName ='Roy High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'trevorcondie@comcast.net', @gameDateTime ='Aug 30 2022 3:30 PM', @siteName ='Roy High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'trevorcondie@comcast.net', @gameDateTime ='Sep 13 2022 6:30 PM', @siteName ='Logan High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'trevorcondie@comcast.net', @gameDateTime ='Sep 13 2022 5:00 PM', @siteName ='Logan High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'trevorcondie@comcast.net', @gameDateTime ='Sep 13 2022 3:30 PM', @siteName ='Logan High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'tom@relaianet.com', @gameDateTime ='Sep 15 2022 6:30 PM', @siteName ='Layton High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tom@relaianet.com', @gameDateTime ='Sep 15 2022 5:00 PM', @siteName ='Layton High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tom@relaianet.com', @gameDateTime ='Sep 15 2022 3:30 PM', @siteName ='Layton High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'tom@relaianet.com', @gameDateTime ='Sep 20 2022 6:30 PM', @siteName ='Davis High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tom@relaianet.com', @gameDateTime ='Sep 20 2022 5:00 PM', @siteName ='Davis High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tom@relaianet.com', @gameDateTime ='Sep 20 2022 3:30 PM', @siteName ='Davis High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'tom@relaianet.com', @gameDateTime ='Sep 22 2022 6:30 PM', @siteName ='Syracuse High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tom@relaianet.com', @gameDateTime ='Sep 22 2022 5:00 PM', @siteName ='Syracuse High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tom@relaianet.com', @gameDateTime ='Sep 22 2022 3:30 PM', @siteName ='Syracuse High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'tom@relaianet.com', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Woods Cross High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tom@relaianet.com', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Layton High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tom@relaianet.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Northridge High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tylerrasmussen@msn.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Farmington High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tybar14@hotmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Syracuse High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'football98@gmail.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Logan High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tybar14@hotmail.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName='Sky View High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'football98@gmail.com', @gameDateTime ='Sep 15 2022 6:30 PM', @siteName ='Ridgeline High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'football98@gmail.com', @gameDateTime ='Sep 15 2022 5:00 PM', @siteName ='Ridgeline High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'football98@gmail.com', @gameDateTime ='Sep 15 2022 3:30 PM', @siteName ='Ridgeline High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'football98@gmail.com', @gameDateTime ='Sep 22 2022 6:30 PM', @siteName='Sky View High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'football98@gmail.com', @gameDateTime ='Sep 22 2022 5:00 PM', @siteName='Sky View High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'football98@gmail.com', @gameDateTime ='Sep 22 2022 3:30 PM', @siteName='Sky View High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'tybar14@hotmail.com', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Bountiful High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tybar14@hotmail.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName='Sky View High School', @positionName ='Referee', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'vshurtliff909@gmail.com', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Northridge High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'vshurtliff909@gmail.com', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Weber High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'vshurtliff909@gmail.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Clearfield High School', @positionName ='Assistant Referee Right', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'heyvern@gmail.com', @gameDateTime ='Sep 9 2022 7:00 PM', @siteName ='Green Canyon High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'refwalter@yahoo.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Bonneville High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'wcole@gmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Green Canyon High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'wcole@gmail.com', @gameDateTime ='Aug 30 2022 6:30 PM', @siteName ='Roy High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'wcole@gmail.com', @gameDateTime ='Aug 30 2022 5:00 PM', @siteName ='Roy High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'wcole@gmail.com', @gameDateTime ='Aug 30 2022 3:30 PM', @siteName ='Roy High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'wcole@gmail.com', @gameDateTime ='Sep 13 2022 6:30 PM', @siteName ='Logan High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'wcole@gmail.com', @gameDateTime ='Sep 13 2022 5:00 PM', @siteName ='Logan High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'wcole@gmail.com', @gameDateTime ='Sep 13 2022 3:30 PM', @siteName ='Logan High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_addGameOfficial @emailAddress = 'zachwinter23@msn.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Farmington High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'zachwinter23@msn.com', @gameDateTime ='Sep 23 2022 7:00 PM', @siteName ='Bear River High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'zachwinter23@msn.com', @gameDateTime ='Aug 23 2022 3:00 PM', @siteName ='Fremont High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'zachwinter23@msn.com', @gameDateTime ='Aug 25 2022 3:00 PM', @siteName ='Bonneville High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'zachwinter23@msn.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Bountiful High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';

-- Add Playoff Games
EXECUTE usp_addGame @homeTeam= 'Ridgeline High School', @visitingTeam='Sky View High School', @siteName='USU Maverik Stadium', @Sport='Football', @Level='Varsity', @gameDateTime='Oct 21 2022 4:00 PM';
EXECUTE usp_addGame @homeTeam= 'Box Elder High School', @visitingTeam='Farmington High School', @siteName='WSU Stewart Stadium', @Sport='Football', @Level='Varsity', @gameDateTime='Oct 21 2022 4:00 PM';
EXECUTE usp_addGame @homeTeam= 'Bear River High School', @visitingTeam='Morgan High School', @siteName='Fremont High School', @Sport='Football', @Level='Varsity', @gameDateTime='Oct 21 2022 4:00 PM';

-- Assign Officials to Playoff Games
EXECUTE usp_addGameOfficial @emailAddress = 'adambaxter@yahoo.com', @gameDateTime ='Oct 21 2022 4:00 PM', @siteName ='USU Maverik Stadium', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'bryanburningham@hotmail.com', @gameDateTime ='Oct 21 2022 4:00 PM', @siteName ='USU Maverik Stadium', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'dfc99@yahoo.com', @gameDateTime ='Oct 21 2022 4:00 PM', @siteName ='WSU Stewart Stadium', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'lbirdland@gmail.com', @gameDateTime ='Oct 21 2022 4:00 PM', @siteName ='WSU Stewart Stadium', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'mathew.willey@hotmail.com', @gameDateTime ='Oct 21 2022 4:00 PM', @siteName ='USU Maverik Stadium', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'reidcarlos23@gmail.com', @gameDateTime ='Oct 21 2022 4:00 PM', @siteName ='WSU Stewart Stadium', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'ronbrenk@q.com', @gameDateTime ='Oct 21 2022 4:00 PM', @siteName ='USU Maverik Stadium', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'Sheldonb@hotmail.com', @gameDateTime ='Oct 21 2022 4:00 PM', @siteName ='WSU Stewart Stadium', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'burnettdan@hotmail.com', @gameDateTime ='Oct 21 2022 4:00 PM', @siteName ='Fremont High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'football98@gmail.com', @gameDateTime ='Oct 21 2022 4:00 PM', @siteName ='Fremont High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jacksonthomas@yahoo.com', @gameDateTime ='Oct 21 2022 4:00 PM', @siteName ='Fremont High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'jonathankilburn@aol.com', @gameDateTime ='Oct 21 2022 4:00 PM', @siteName ='Fremont High School', @positionName ='Head Linesman', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'tomdeelstra@utah.gov', @gameDateTime ='Oct 21 2022 4:00 PM', @siteName ='WSU Stewart Stadium', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'bobcarre@live.com', @gameDateTime ='Oct 21 2022 4:00 PM', @siteName ='USU Maverik Stadium', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'brfootball67@gmail.com', @gameDateTime ='Oct 21 2022 4:00 PM', @siteName ='Fremont High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_addGameOfficial @emailAddress = 'brfootball67@gmail.com', @gameDateTime ='Oct 21 2022 4:00 PM', @siteName ='USA Maverik Stadium', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';


-- Pays Officials For Games
EXECUTE usp_GameOfficialPayment @emailAddress = 'adambaxter@yahoo.com', @gameDateTime ='Oct 21 2022 4:00 PM', @siteName ='USU Maverik Stadium', @positionName ='Referee', @sport = 'Football', @level ='Varsity';

-- Create View for GameOfficialPaymentHistory
IF EXISTS (SELECT * FROM sysobjects WHERE id=OBJECT_ID('udv_GameOfficialPaymentHistory'))
DROP VIEW udv_GameOfficialPaymentHistory;
GO

CREATE VIEW udv_GameOfficialPaymentHistory
AS
	SELECT u.firstName, u.lastName, g.gameDateTime, s.schoolName AS visitingTeam, st.siteName AS homeTeam, sl.Sport, sl.[Level], op.positionName, ph.paymentAmount
	FROM gosGameOfficialPaymentHistory ph INNER JOIN gosUser u
	ON ph.odUser_id = u.odUser_id
	INNER JOIN gosGame g
	ON ph.odGame_id = g.odGame_id
	INNER JOIN gosSchool s
	ON g.visitingTeam = s.odSiteName_id
	INNER JOIN gosSite st
	ON g.homeTeam = st.odSiteName_id
	INNER JOIN gosSportLevel sl
	ON g.odSportLevel_id = sl.odSportLevel_id
	INNER JOIN gosOfficiatingPosition op
	ON ph.odOfficiatingPosition_id = op.odOfficiatingPosition_id;
GO

-- Create View for OfficialGameView
IF EXISTS (SELECT * FROM sysobjects WHERE id=OBJECT_ID('udv_OfficialGameView'))
DROP VIEW udv_OfficialGameView;
GO

CREATE VIEW udv_OfficialGameView
AS
	SELECT u.firstName, u.lastName, g.gameDateTime, s.schoolName AS visitingTeam, st.siteName AS homeTeam, op.positionName
	FROM gosGame g INNER JOIN gosGameOfficial gof
	ON g.odGame_id = gof.odGame_id
	INNER JOIN gosUser u
	ON gof.odUser_id = u.odUser_id
	INNER JOIN gosSchool s
	ON g.visitingTeam = s.odSiteName_id
	INNER JOIN gosSite st
	ON g.homeTeam = st.odSiteName_id
	INNER JOIN gosSportLevel sl
	ON g.odSportLevel_id = sl.odSportLevel_id
	INNER JOIN gosOfficiatingPosition op
	ON gof.odOfficiatingPosition_id = op.odOfficiatingPosition_id;
GO

-- Testing new conditions for addGameOfficial
SELECT '@PositionName=Assistant Referee Left, @emailAddress=corey.williams93@hotmail.com, @Sport=Soccer Women, @Level=Varsit' AS 'These are Valid Conditions'
Execute usp_addOfficialQualification @PositionName='Assistant Referee Left', @emailAddress='corey.williams93@hotmail.com', @Sport='Soccer Women', @Level='Varsity';

SELECT '@emailAddress = jason.younger@gmail.com, @gameDateTime =Aug 30 2022 3:00 PM, @siteName =Northridge High School, @positionName =Assistant Referee Left, @sport = Soccer Women, @level =Varsity' AS 'These are Invalid Conditions'
EXECUTE usp_addGameOfficial @emailAddress = 'jason.younger@gmail.com', @gameDateTime ='Aug 30 2022 3:00 PM', @siteName ='Northridge High School', @positionName ='Assistant Referee Left', @sport = 'Soccer Women', @level ='Varsity';


SELECT * FROM udv_GameOfficialPaymentHistory;

-- Excecute gameOfficialPayment
EXECUTE usp_GameOfficialPayment @emailAddress = 'francis.Morgan@gmail.com', @gameDateTime ='Aug 25 2022 05:00:00 PM', @siteName ='Bear River High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_GameOfficialPayment @emailAddress = 'gardner1@comcast.net', @gameDateTime ='Aug 25 2022 06:30:00 PM', @siteName ='Bear River High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_GameOfficialPayment @emailAddress = 'gardner1@comcast.net', @gameDateTime ='Aug 25 2022 05:00:00 PM', @siteName ='Bear River High School', @positionName ='Umpire', @sport = 'Volleyball', @level ='Junior Varsity';
EXECUTE usp_GameOfficialPayment @emailAddress = 'bobcarre@live.com', @gameDateTime ='Sep 13 2022 3:30 PM', @siteName ='Davis High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Sophomore';
EXECUTE usp_GameOfficialPayment @emailAddress = 'bradpoll@wsd.net', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Box Elder High School', @positionName ='Back Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_GameOfficialPayment @emailAddress = 'braddavies50@hotmail.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Bonneville High School', @positionName ='Umpire', @sport = 'Football', @level ='Varsity';
EXECUTE usp_GameOfficialPayment @emailAddress = 'ottleybradley@msn.com', @gameDateTime ='Sep 16 2022 7:00 PM', @siteName ='Davis High School', @positionName ='Line Judge', @sport = 'Football', @level ='Varsity';
EXECUTE usp_GameOfficialPayment @emailAddress = 'brandon@petro.com', @gameDateTime ='Sep 2 2022 7:00 PM', @siteName ='Syracuse High School', @positionName ='Referee', @sport = 'Football', @level ='Varsity';
EXECUTE usp_GameOfficialPayment @emailAddress = 'tomgriff@gmail.com', @gameDateTime ='Sep 20 2022 6:30 PM', @siteName ='Syracuse High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';
EXECUTE usp_GameOfficialPayment @emailAddress = 'tomgriff@gmail.com', @gameDateTime ='Sep 20 2022 6:30 PM', @siteName ='Syracuse High School', @positionName ='Referee', @sport = 'Volleyball', @level ='Varsity';


SELECT 'These are Payments to officials';
SELECT * FROM gosUser u INNER JOIN gosGameOfficial goff
ON u.odUser_id = goff.odUser_id;

SELECT 'These are records from the History view';
SELECT * FROM udv_GameOfficialPaymentHistory goph;

SELECT 'These are records from the GameOfficial view';
SELECT * FROM udv_OfficialGameView;
