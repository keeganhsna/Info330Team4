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
