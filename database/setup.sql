DROP TABLE updatedBy;
DROP TABLE matchesPlayedByTeams;
DROP TABLE leagues;
DROP TABLE teamsInLeague;
DROP TABLE playersInTeam;
DROP TABLE managers;
DROP TABLE coaches;
DROP TABLE staffInTeam;


CREATE TABLE staffInTeam (
staffID char(5),
name char(20),
teamID int NOT NULL,
PRIMARY KEY (staffID),
FOREIGN KEY (teamID) references Teams
	ON DELETE NO ACTION
	ON UPDATE CASCADE
);

CREATE TABLE coaches (
staffID int,
title char(20),
PRIMARY KEY (staffID),
FOREIGN KEY (staffID) references Staff
);

CREATE TABLE managers (
staffID int,
PRIMARY KEY (staffID),
FOREIGN KEY (staffID) references Staff
);


CREATE TABLE playersInTeam (
name char(20),
Jersey# int,
position char(3),
ratings double(1, 2),
fouls int,
onGoal% int,
goals int,
assists int,
teamID int NOT NULL,
PRIMARY KEY (name, Jersey#),
FOREIGN KEY (teamID) references teamsInLeague
);

CREATE TABLE teamsInLeague (
 	tName char(20),
	teamID int,
	wins int,
	losses int,
	draws int,
ratings double(1, 2),
goals int,
totalYellowCards int,
totalRedCards int,
standing int,
lName char(20) NOT NULL,
 	country char(20) NOT NULL,
PRIMARY KEY (tName),
FOREIGN KEY (lName, country) references leagues
);


CREATE TABLE leagues (
 	name char(20),
 	country char(20),
#Teams int,
PRIMARY KEY (name, country),
ON DELETE CASCADE
);

CREATE TABLE matchesPlayedByTeams(
 	matchID int,
 	location char(20),
	teamID int
result char(4) NOT NULL,
 	time int,
	date date,
 	goals int,
	#yellowCards int,
	#redCards int,
	PRIMARY KEY (teamID, matchID)
FOREIGN KEY (teamID) references teamsInLeague
	ON DELETE CASCADE
);

CREATE TABLE updatedBy (
 	staffID int,
 	name char (20) NOT NULL,
 	Jersey# int NOT NULL,
PRIMARY KEY (staffID, name, Jersey#)
FOREIGN KEY (staffID) references managers,
FOREIGN KEY (name, Jersey#) references PlayersInLeague
);

-- TODO create dummy data to initialize tables below here