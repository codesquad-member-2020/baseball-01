DROP TABLE IF EXISTS hitter, pitcher, logo, user, matches, team;

CREATE TABLE team
(
    team_id   int auto_increment primary key,
    team_name varchar(64),
    team_type varchar(64),
    user_name varchar(64) DEFAULT 'none',
    logo_id int REFERENCES logo(logo_id) ON UPDATE CASCADE,
    match_id int REFERENCES matches(match_id) ON UPDATE CASCADE,
    pitcher_id int REFERENCES pitcher(pitcher_id) ON UPDATE CASCADE
);

CREATE TABLE logo
(
    logo_id int auto_increment primary key,
    url varchar(255)
);

CREATE TABLE user
(
    user_id int auto_increment primary key,
    name varchar(64)
);

CREATE TABLE matches
(
    match_id int auto_increment primary key,
    home_team varchar (64),
    away_team varchar (64)
);

CREATE TABLE pitcher
(
    pitcher_id      int auto_increment primary key,
    pitcher_name    varchar(64)
);

CREATE TABLE hitter
(
    hitter_id      int auto_increment primary key,
    hitter_name    varchar(64),
    hitter_number int,
    average float,
    team_id int REFERENCES team (id) ON UPDATE CASCADE
);
