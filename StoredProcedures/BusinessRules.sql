-- No Player can have multiple teams, but can be in a status as 'free agent'

-- No player magnet order can have two people in the same row

-- No one team can have multiple arenas

-- Home team Id can not be the same as the away team ID

CREATE FUNCTION NoSameTeamsInGame()
RETURNS INT
AS
BEGIN
    DECLARE @RET INT = 0
    IF EXISTS(
        SELECT *
        FROM GAMES G
        WHERE G.HomeTeamID = G.AwayTeamID
    )
    BEGIN 
        SET @RET = 1
    END
    RETURN @RET
END
GO

ALTER TABLE GAMES
ADD CONSTRAINT CK_NoSameTeamsInGame
CHECK(dbo.NoSameTeamsInGame() = 0)