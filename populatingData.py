import pyodbc, json, datetime, requests

def connectDB():
    print("Checking Connection from")
    server = 'IS-HAY04.ischool.uw.edu'
    database = 'Proj_C4'
    username = 'Info330'
    password = 'Pac12Champs!'
    driver= '{ODBC Driver 17 for SQL Server}'
    cnxn = pyodbc.connect('DRIVER='+driver+';SERVER='+server+',1433;DATABASE='+database+';UID='+username+';PWD='+ password)
    return cnxn

def getData():
    conn = connectDB()
    cursor = conn.cursor()
    # cursor.execute("SELECT * FROM DIVISIONS")
    row = cursor.fetchall()
    for row in cursor.fetchall():
        print(row)

def getPlayersFromTeam(TeamID):
    baseURL = "https://stats.nba.com/stats/" # stats.nba.com/stats/{endpoint}/?{params}
    commonTeamRoster = str(baseURL) + "commonteamroster/?Season=2018-19&TeamID=" + str(TeamID)
    r = requests.get(url = commonTeamRoster) 
    # extracting data in json format 
    print(r)
    # data = r.json() 
    # print(data)

def addTeam(Name, City, State, Country, DivisionID, NBAID):
    conn = connectDB()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO TEAMS (Name, City, State, Country, DivisionID, NBAID) VALUES (?, ?, ?, ?, ?, ?)", Name, City, State, Country, DivisionID, NBAID)
    cursor.commit()

def getAllTeamsFromConf(Conf):
    url = "https://api-nba-v1.p.rapidapi.com/teams/confName/" + Conf
    headers = {
        'x-rapidapi-host': "api-nba-v1.p.rapidapi.com",
        'x-rapidapi-key': "d3097d2fd2msh05ccd67fab58eddp15f031jsn3ee90b53e448"
        }
    response = requests.request("GET", url, headers=headers)
    jsonResponse = json.loads(response.text)
    teams = jsonResponse["api"]["teams"]
    for team in teams:
        teamName = team["fullName"]
        teamCity = team["city"]
        teamState = "Not Available"
        teamCountry = "USA"
        teamID = team["teamId"]
        addTeam(teamName, teamCity, teamState, teamCountry, 3, teamID)
        print(teamName + ", " + teamCity + ", " + teamID)
# getAllTeamsFromConf("East")
# getAllTeamsFromConf("West")

def addPlayer(FirstName, LastName, DateOfBirth, EnteredLeague, LeftLeague, NBAID):
    conn = connectDB()
    cursor = conn.cursor()
    LeftLeague = datetime.datetime.now()
    cursor.execute("INSERT INTO PLAYERS (FirstName, LastName, DateOfBirth, EnteredLeague, LeftLeague, NBAID) VALUES (?, ?, ?, ?, ?, ?)", FirstName, LastName, DateOfBirth, EnteredLeague, LeftLeague, NBAID)
    print("added " + FirstName)
    cursor.commit()

def addPlayerTraits():
    print("adding player traits")

def getAllPlayersFromTeams(teamId):
    url = "https://api-nba-v1.p.rapidapi.com/players/teamId/" + str(teamId)
    headers = {
        'x-rapidapi-host': "api-nba-v1.p.rapidapi.com",
        'x-rapidapi-key': "d3097d2fd2msh05ccd67fab58eddp15f031jsn3ee90b53e448"
        }
    response = requests.request("GET", url, headers=headers)
    jsonResponse = json.loads(response.text)
    players = jsonResponse["api"]["players"]
    for player in players:
        birth = player['dateOfBirth']
        firstName = player["firstName"]
        lastName = player["lastName"]
        startYear = player["startNba"]
        endYear = 'null'
        playerID = player["playerId"]
        print(firstName + ", " + lastName + ", " + birth + ", " + startYear + ", " + playerID)
        # addPlayer(firstName, lastName, birth, datetime.datetime.now(), datetime.datetime.now(), playerID)
        addPlayerTraits()

def populateAllPlayers():
    teamIDS = [1,2,4,5,6,7,8,9,10,11,14,15,16,17,19,20,21,22,23,24,25,26,27,28,29,30,31,34,35,36,37,38,39,41,42]
    for i in range(0,len(teamIDS)):
        getAllPlayersFromTeams(teamIDS[i])

populateAllPlayers()
# getAllPlayersFromTeams()




