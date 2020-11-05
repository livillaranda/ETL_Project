-- MLB AVERAGE
CREATE VIEW mlb_avg AS
SELECT cities.id, cities.city_name, AVG(mlb.win_percent)
FROM mlb
JOIN cities ON cities.id = mlb.city_id
GROUP BY cities.id

-- NBA AVERAGE
CREATE VIEW nba_avg AS
SELECT cities.id, cities.city_name, AVG(nba.win_percent)
FROM nba
JOIN cities ON cities.id = nba.city_id
GROUP BY cities.id

-- NFL AVERAGE
CREATE VIEW nfl_avg AS
SELECT cities.id, cities.city_name, AVG(nfl.win_percent)
FROM nfl
JOIN cities ON cities.id = nfl.city_id
GROUP BY cities.id

-- NHL AVERAGE
CREATE VIEW nhl_avg AS
SELECT cities.id, cities.city_name, AVG(nhl.win_percent)
FROM nhl
JOIN cities ON cities.id = nhl.city_id
GROUP BY cities.id