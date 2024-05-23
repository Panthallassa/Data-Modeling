\c postgres

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE Teams (
    team_id SERIAL PRIMARY KEY,
    team_name VARCHAR(15), 
);

CREATE TABLE Players (
    player_id SERIAL PRIMARY KEY, 
    team_id INT, 
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Goals (
    goal_id SERIAL PRIMARY KEY, 
    player_id INT, 
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
);

CREATE TABLE Matches (
    match_id SERIAL PRIMARY KEY, 
);

CREATE TABLE Matches_Teams (
    match_id INT, 
    FOREIGN KEY (match_id) REFERENCES Matches(match_id), 
    team_id INT, 
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Referees (
    referee_id SERIAL PRIMARY KEY, 
    match_id INT, 
    FOREIGN KEY (match_id) REFERENCES Matches(match_id)
);

CREATE TABLE Seasons (
    season_id SERIAL PRIMARY KEY, 
    start_date DATE, 
    end_date DATE
);

-- FAKE DATA 

INSERT INTO Teams (team_name) VALUES ('Rockets'), ('Malonois'), ('Cheetahs');

INSERT INTO Players (team_id) VALUES (1), (1), (1), (2), (2), (2), (3), (3), (3);

INSERT INTO Goals (player_id) VALUES (1), (2), (3);

INSERT INTO Matches DEFAULT VALUES;

INSERT INTO Matches_Teams (match_id, team_id) VALUES (1, 1), (1, 2);

INSERT INTO Referees (match_id) VALUES (1);

INSERT INTO Seasons (start_date, end_date) VALUES ('2024-01-01', '2024-12-31');