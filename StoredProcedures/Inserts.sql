-- Insert new everything

create procedure insertNewTeam
@TName varchar(20),
@City varchar(20),
@State varchar(20),
@Country varchar(20),
@DName varchar(20)
as
declare @DID int = (select d.DivisionID
                    from DIVISIONS d
                    where d.DivisionName = @DName)
insert into TEAMS(Name, City, State, Country, DivisionID)
values(@TName, @City, @State, @Country, @DID)

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

create procedure insertNewArena
@AName varchar(20),
@ANickname varchar(20),
@Address varchar(20),
@Capacity int,
@City varchar(20),
@State varchar(20),
@Country varchar(20)
as
insert into ARENAS(ArenaName, ArenaNickname, Address, Capacity, City, State, Country)
values(@AName, @ANickname, @Address, @Capacity, @City, @State, @Country)

-- Contract Type
-- https://cbabreakdown.com/contract-types
CREATE PROCEDURE NEW_CONTRACT_TYPE
    @ContractName varchar(100),
    @ContractDesc text
    AS
    INSERT INTO PLAYER_CONTRACT_TYPES(ContractName, ContractDesc)
    VALUES(@ContractName, @ContractDesc)
GO;

INSERT INTO PLAYER_CONTRACT_TYPES(ContractName, ContractDesc)
VALUES('Uniform Player Contract', 'Standard contract template')

INSERT INTO PLAYER_CONTRACT_TYPES(ContractName, ContractDesc)
VALUES('Standard NBA Contract', 'A Standard NBA Contract is simply any Uniform Player Contract that is not a Two-Way Contract.  Every Two-Way Contract must include a team option to convert the contract to a Standard NBA Contract.  This conversion option is called a Standard NBA Contract Conversion Option (and matters for two-way players because it’s the mechanism that gets them on an NBA roster full-time at an NBA salary). ')

INSERT INTO PLAYER_CONTRACT_TYPES(ContractName, ContractDesc)
VALUES('Rookie Scale Contract', 'A Rookie Scale Contract is the initial Uniform Player Contract between a team and its first round draft pick.  The contract must be for 2 years, with a team option for both the 3rd and 4th years.  A player’s compensation under a Rookie Scale Contract is determined by the rookie salary scale. The team option for the player’s 3rd and 4th years can be exercised from the day after the applicable season ends through the next October 31.')

INSERT INTO PLAYER_CONTRACT_TYPES(ContractName, ContractDesc)
VALUES('Designate Veteran Player', 'A Designated Veteran Player Contract is a contract between a team and a free agent with 8 or 9 years of service in the league that covers 5 seasons.  Once signed, the player may not be traded for one year. To be eligible for this contract, the veteran must (i) have played his entire career for the same team (or if he changed teams, did so only by trade during one of his first four seasons in the league), and (ii) met at least one of the max performance-based criteria. The player’s salary in the first year of the contract must be at least 30% and no more than 35% of that year’s salary cap.  The potential for a player with less than 10 years of service to earn 35% of the salary cap is what makes this a “super max” contract.  More details about the maximum player salary for these players are available here. No team may have more than two players under a Designated Veteran Player Contract (or a Designated Veteran Player Extension). ')

INSERT INTO PLAYER_CONTRACT_TYPES(ContractName, ContractDesc)
VALUES('Renegotions', 'Renegotiations are amendments to a contract that increase (and only increase) a player’s salary during the contract’s existing term.  If a player renegotiates an increase to his salary, the salary in each remaining season of the contract must also be increased over the original salary.  Some of the important rules relating to renegotiations are: For each season of the contract after the renegotiation takes place, the player’s additional salary may increase or decrease by up to 8% (instead of 5%) of the increase in salary from the renegotiation season.  (The year-over-year decrease is possible as long as the player’s salary in each remaining season of the contract’s existing term is still higher than the original salary.)
Limitations on Renegotiations —
A contract covering 4 or more seasons may not be renegotiated until the third anniversary of the signing of the contract;
A contract that was already renegotiated to provide for a salary increase of more than 5% or that was already extended may not be renegotiated until the third anniversary of the signing of the original renegotiation or extension; and
A contract may not be renegotiated from March 1 through June 30.')

INSERT INTO PLAYER_CONTRACT_TYPES(ContractName, ContractDesc)
VALUES('Extension', 'Extensions are amendments to a contract that add seasons to the contract’s existing term.  Summarized below are some of the general rules around extensions, followed by a breakdown of four categories of extensions: (1) a “regular” extension of a rookie’s Rookie Scale Contract, (2) a Designated Rookie Scale Player Extension, (3) a “regular” extension of a veteran’s contract, and (4) a Designated Veteran Player Extension.
General Rules —
Contracts covering 1 or 2 seasons (including any option year) cannot be extended.
Contracts covering 3 or 4 seasons (including any option year) may be extended on the second anniversary of being signed.
Contracts covering 5 or 6 seasons (including any option year) may be extended on the third anniversary of being signed.
Extensions of Rookie Scale Contracts — Any Rookie Scale Contract can be extended during the off-season before the rookie’s fourth year in the league (i.e., July 1 to the day before the regular season).
Regular Extensions —
A regular extension of a Rookie Scale Contract may add up to 4 new years to the player’s contract (for a total of 5 years when the remaining year is included, as these contracts can only be extended just before the fourth year of the contract, between the end of the moratorium period in July through the day before the regular season season starts).
The player’s salary in the first year of the extended term can be any amount up to his applicable maximum annual salary.  Salary may increase (or decrease) in the extended term by up to 8% (instead of 5%) of the salary in the first year of the extension.
Designated Rookie Scale Player Extension —
A “Designated Rookie Scale Player Extension” adds 5 new years to the player’s Rookie Scale Contract (for a total of 6 years when the remaining year is included).  To sign this extension, the player must be a qualifying veteran free agent at the time his Rookie Scale Contract ends.  Players signed under this rule must have a first year salary in the extended term of at least 25% of that year’s salary cap.
More details about the maximum player salary for these players are available here.
Example — The Philadelphia 76ers signed Joel Embiid to a Designated Rookie Scale Player Extension in October of 2017.  The salary he’ll receive under that contract is discussed here.
No team may have more than two players under a Designated Rookie Scale Player Extension, and only one of these players may be acquired through a trade.  (The latter rule around trades, which does not apply to veterans, is what prevented the Boston Celtics from trading for Anthony Davis at the 2018-19 trade deadline when they already had acquired Kyrie Irving through a trade.)
Extensions of Veteran Contracts —
Regular Extensions — Unless a veteran’s contract is going to be extended during the last season of his contract, the extension can only be negotiated and entered into during the off-season (i.e., July 1 to the day before the regular season).
A regular extension of a veteran’s contract may cover 5 years (including the years remaining on the original contract when the extension is signed).
The player’s salary in the first year of the extension may be up to the greater of: (i) 120% of the player’s salary in the last year of the original contract, and (ii) 120% of the estimated average player salary in the year the extension is signed.  Salary may increase (or decrease) in the extended term by up to 8% (instead of 5%) of the salary in the first year of the extension.
Designated Veteran Player Extension — A “Designated Veteran Player Extension” may cover 6 years (including the years remaining on the original contract).  A veteran’s contract may only be extended using this rule after the third anniversary of the signing of the original contract and these extensions may only be negotiated and entered into during the off-season (i.e., July 1 to the day before the regular season).
To be eligible for this extension, the veteran must (i) have only one or two seasons remaining on his current contract, (ii) be entering his 8th or 9th season in the league, (iii) played his entire career for the same team (or if he changed teams, did so only by trade during one of his first four seasons in the league), and (iv) have met at least one of the max performance-based criteria.
If eligible for this extension, the player’s salary in the first year of the extension must be at least 30% and no more than 35% of that year’s salary cap.  The potential for a player with less than 10 years of service to earn 35% of the salary cap is what makes this a “super max” contract.  Salary may increase (or decrease) in the extended term by up to 8% (instead of 5%) of the salary in the first year of the extension.  More details about the maximum player salary for these players are available here.
Once signed to a Designated Veteran Player Extension, the player may not be traded for one year.
No team may have more than two players under a Designated Veteran Player Extension (or a Designated Veteran Player Contract).  ')
INSERT INTO PLAYER_CONTRACT_TYPES(ContractName, ContractDesc)
VALUES('Options', 'The CBA permits two types of contract options — (1) an option to extend the term and (2) an option to terminate it early.
An option is the right to extend a contract for additional seasons.  Depending on how the contract is negotiated, this option can run in favor of the team or the player.
An early termination option is the right to end a contract early.   Early termination options can only run in favor of the player.  An early termination option may only follow, at the earliest, the end of the fourth season covered by the contract.
Both an option and an early termination option must be exercised on or before the June 30 preceding the option year (or, in certain cases, by June 25 if not exercising the option would cause the player to become a restricted free agent).  ')
INSERT INTO PLAYER_CONTRACT_TYPES(ContractName, ContractDesc)
VALUES('Required Tender', 'A Required Tender is a team’s offer of a Uniform Player Contract to a draft rookie.

For a first round pick, the Required Tender must (i) be given to the player by the July 15 after the draft, (ii) give the player until at least the first day of the upcoming regular season to accept it, and (iii) and satisfy the Rookie Scale Contract requirements.  (The timing provisions are more complicated if a player does not sign with the team that drafted him, because a team can preserve its draft rights.)

For a second round pick, the Required Tender must (i) be given to the player by two weeks before the September 5 after the draft, (ii) give the player until at least the following October 15 to accept it, (iii) cover 1 season, and (iv) pay at least the applicable minimum annual salary.

If a team does not timely make a Required Tender to its draft rookie, then the draft rookie will become a rookie free agent (on July 16 for a first round pick and on September 6 for a second round pick).  Once made, a Required Tender may only be withdrawn if the player agrees to the withdrawal (and if it’s withdrawn, the player immediately becomes a rookie free agent).')

INSERT INTO PLAYER_CONTRACT_TYPES(ContractName, ContractDesc)
VALUES('Qualifying Offer', 'A Qualifying Offer is a team’s offer of a Uniform Player Contract to certain players that, once made by the team, makes those players restricted free agents.')

INSERT INTO PLAYER_CONTRACT_TYPES(ContractName, ContractDesc)
VALUES('Offer Sheet', 'An Offer Sheet is an agreement between a restricted free agent and any team that’s not his current team.  Offer Sheets are significant for free agency and are explained in more detail here.')

INSERT INTO PLAYER_CONTRACT_TYPES(ContractName, ContractDesc)
VALUES('Two-Way Contract', 'A Two-Way Contract is the contract between a two-way player and an NBA team that pays him a two-way salary.  A Two-Way Contract is mostly defined by what it cannot do and who cannot sign one:

It cannot exceed 2 seasons in length.  It cannot be extended or renegotiated.  It cannot include an option or an early termination option.  It cannot contain any bonuses.  It cannot be signed after January 15 of any season.

A Two-Way Contract cannot be signed by a player that has (or may have during its term) 4 or more years of service (for example, a player with 3 years of service cannot sign a 2-year Two-Way Contract).  Nor can a player sign a Two-Way Contract that would result in the player being under a Two-Way Contract for any part of more than 3 seasons with the same team (for example, a player that just completed a 2-year Two-Way Contract cannot then sign another 2-year Two-Way Contract with that team).

All Two-Way Contracts must include the Standard NBA Contract Conversion Option.  This option (once exercised) must provide for (i) salary equal to the player’s applicable minimum player salary, and (ii) a term that matches what’s remaining on the original Two-Way Contract.  This option may only be exercised between July 1 and the team’s last regular season game for each season covered by the Two-Way Contract.

Like a Summer Contract (discussed below), the two-way salary in a Two-Way Contract does not count towards a team’s team salary (so a team does not need to have room or a salary cap exception to sign, acquire, or convert a player to a Two-Way Contract).')


SELECT *
FROM PLAYER_CONTRACT_TYPES

-- Contract

-- Player Traits
Create Procedure insertPlayer_Traits
@Date_Taken datetime,
@height int,
@Height_Label varchar(45),
@weight int,
@Weight_Label varchar(45)

Insert into PLAYER_TRAITS(DateTaken, Height, HeightLabel, Weight, WeightLabel)
Values(@Date_Taken, @height, @Height_Label, @weight, @Weight_Label)
-- Player Status Types


-- Player Status

-- Player
SELECT *
FROM PLAYERS

ALTER TABLE PLAYERS
    ADD NBAID INT
-- Player Position
INSERT INTO PLAYER_POSITIONS(PositionName, PositionAbbreviation, PositionDesc)
VALUES('', '', '')
INSERT INTO PLAYER_POSITIONS(PositionName, PositionAbbreviation, PositionDesc)
VALUES('Point Guard', 'PG', 'The point guard (PG), also known as the one, is typically the teams best ball handler and passer. Therefore, they often lead their team in assists and are able to create shots for themselves and their teammates. They are often quick and are able to hit shots either outside the three-point line or "in the paint", largely depending on the player''s skill level. Point guards are looked upon as the "floor general" or the "coach on the floor". They should study the game and game film to be able to recognize the weaknesses of the defense, and the strengths of their own offense. They are responsible for directing plays, making the position equivalent to that of quarterback in American football, playmaker in association football (soccer), center in ice hockey, or setter in volleyball. Good point guards increase team efficiency and generally have a high number of assists. They are often referred to as dribblers or play-makers. In the NBA, point guards are usually the shortest players on the team and are mostly 6 feet 4 inches (1.93 m) or shorter.')

INSERT INTO PLAYER_POSITIONS(PositionName, PositionAbbreviation, PositionDesc)
VALUES('Shooting Guard', 'SG', 'The shooting guard (SG) is also known as the two or the off guard. Along with the small forward, a shooting guard is often referred to as a wing because of its use in common positioning tactics. As the name suggests, most shooting guards are prolific from the three-point range. Besides being able to shoot the ball, shooting guards tend to be the best defender on the team, as well as being able to move without the ball to create open looks for themselves. Some shooting guards also have good ball handling skills, often creating their own shots off the dribble. A versatile shooting guard will have good passing skills, allowing them to assume point guard responsibilities known as combo guards. Bigger shooting guards also tend to play as small forwards. In the NBA, shooting guards usually range from 6 feet 4 inches (1.93 m) to 6 feet 8 inches (2.03 m).')

INSERT INTO PLAYER_POSITIONS(PositionName, PositionAbbreviation, PositionDesc)
VALUES('Small Forward', 'SF', 'The small forward (SF), also known as the three, is considered to be the most versatile of the main five basketball positions. Versatility is key for small forwards because of the nature of their role, which resembles that of a shooting guard more often than that of a power forward. This is why the small forward and shooting guard positions are often interchangeable and referred to as wings.

Small forwards have a variety of assets, such as quickness and strength inside. One common thread among all kinds of small forwards is an ability to "get to the line" and draw fouls by aggressively attempting (post-up) plays, lay-ups, or slam dunks. As such, accurate foul shooting is a common skill for small forwards, many of whom record a large portion of their points from the foul line. Besides being able to drive to the basket, they are also good shooters from long range. Some small forwards have good passing skills, allowing them to assume point guard responsibilities as point forwards. Small forwards should be able to do a little bit of everything on the court, typically playing roles such as swing men and defensive specialists. In the NBA, small forwards usually range from 6 feet 6 inches (1.98 m) to 6 feet 10 inches (2.08 m)')

INSERT INTO PLAYER_POSITIONS(PositionName, PositionAbbreviation, PositionDesc)
VALUES('Power Forward', 'PF', 'The power forward (PF), also known as the four, often plays a role similar to that of the center, down in the "post" or "low blocks." The power forward is often the team''s most versatile scorer, being able to score close to the basket while also being able to shoot mid-range jump shots from 12 to 18 feet from the basket. Some power forwards have become known as stretch fours, since extending their shooting range to three-pointers. On defense, they are required to have the strength to guard bigger players close to the basket and to have the athleticism to guard quick players away from the basket. Most power forwards tend to be more versatile than centers since they can be part of plays and are not always in the low block. In the NBA, power forwards usually range from 6 feet 8 inches (2.03 m) to 7 feet 0 inches (2.13 m).')

INSERT INTO PLAYER_POSITIONS(PositionName, PositionAbbreviation, PositionDesc)
VALUES('Center', 'C', 'The center (C), also known as the five, usually plays near the baseline or close to the basket (the "low post"). They are usually the tallest players on the floor. The center usually scores "down low," or "in the paint" (near the basket, in the key), but some can be good perimeter shooters. They are typically skilled at gathering rebounds, contesting shots and setting screens on players. Also known as a block.

The center position has been traditionally considered one of the most important positions, if not the most important. The range of players used in the position has transitioned from relatively slower but much taller "back to the basket" players to players who would normally be classified as power forwards but can dominate the position with their defensive skills, or mismatch ability to shoot from the high post. This has been due to the scarcity of players possessing the combination of great skill, ideal height, and durability. This has been matched by the development of more fast-paced and athletic basketball play, which calls for less traditional center play and a more up-and-down the court playstyle.')

SELECT *
FROM PLAYER_POSITIONS

-- Conferences

INSERT INTO CONFERENCES(ConferenceName, ConferenceDesc)
VALUES('Eastern', 'Has three divisions called Atlantic, Central, and Southeast')

INSERT INTO CONFERENCES(ConferenceName, ConferenceDesc)
VALUES('Western', 'Has three divisions, which are the Northwest, Pacific, and Southwest.')


-- DIVISIONS

ALTER TABLE TEAMS
    ADD NBAID INT


INSERT INTO DIVISIONS(DivisionName, DivisionDesc, ConferenceID)
VALUES('Atlantic','',1) -- EASTERN Divisions
INSERT INTO DIVISIONS(DivisionName, DivisionDesc, ConferenceID)
VALUES('Central','',1) -- EASTERN Divisions
INSERT INTO DIVISIONS(DivisionName, DivisionDesc, ConferenceID)
VALUES('Southeast','',1) -- EASTERN Divisions

INSERT INTO DIVISIONS(DivisionName, DivisionDesc, ConferenceID)
VALUES('Northwest','',3) -- WESTERN Divisions
INSERT INTO DIVISIONS(DivisionName, DivisionDesc, ConferenceID)
VALUES('Pacific','',3) -- WESTERN Divisions
INSERT INTO DIVISIONS(DivisionName, DivisionDesc, ConferenceID)
VALUES('Southwest','',3) -- WESTERN Divisions

SELECT *
    FROM PLAYERS

SELECT *
FROM CONFERENCES

SELECT *
FROM DIVISIONS

SELECT *
    FROM TEAMS
    ORDER BY NBAID ASC