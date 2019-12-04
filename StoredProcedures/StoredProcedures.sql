CREATE PROCEDURE AddNewGameRow
@HomeTeamName VARCHAR(100),
@AwayTeamName VARCHAR(100),
@DateOf DATETIME,
@ArenaName VARCHAR(100),
@HomeScore INT,
@AwayScore INT
AS
    DECLARE @HomeID INT, @AwayID INT, @ArenaID INT
    SET @HomeID = (SELECT T.TeamID
                    FROM TEAMS T
                    WHERE T.Name = @HomeTeamName)
    SET @AwayID = (SELECT T.TeamID
                    FROM TEAMS T
                    WHERE T.Name = @AwayTeamName)
    SET @ArenaID = (SELECT A.ArenaID
                    FROM ARENAS A
                    WHERE A.ArenaName = @ArenaName)
    BEGIN TRANSACTION AddNewGame
    INSERT INTO GAMES(HomeTeamID, AwayTeamID, DateOf, ArenaID, HomeScore, AwayScore)
    VALUES(@HomeID, @AwayID, @DateOf, @ArenaID, @HomeScore, @AwayScore)
    COMMIT TRANSACTION AddNewGame
GO





create procedure insertNewConference
@CName varchar(7),
@CDesc varchar(500)
as
insert into CONFERENCES(ConferenceName, ConferenceDesc)
values(@CName, @CDesc)

create procedure insertNewDivision
@DName varchar(20),
@DDesc varchar(500)
as
insert into DIVISIONS(DivisionName, DivisionDesc)
values(@DName, @DDesc)



CREATE PROCEDURE AddNew

ALTER 