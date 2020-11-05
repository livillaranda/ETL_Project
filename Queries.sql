-- Link city information to MLB teams
SELECT c.id, c.city_name, mlb.id, mlb.team_name, mlb.win, mlb.loss, mlb.tie, mlb.win_percent
FROM cities as c
JOIN mlb ON mlb.city_id = c.id;

-- Link city information to NBA teams
SELECT c.id, c.city_name, nba.id, nba.team_name, nba.win, nba.loss, nba.tie, nba.win_percent
FROM cities as c
JOIN nba ON nba.city_id = c.id;

-- Link city information to NFL teams
SELECT c.id, c.city_name, nfl.id, nfl.team_name, nfl.win, nfl.loss, nfl.tie, nfl.win_percent
FROM cities as c
JOIN nfl ON nfl.city_id = c.id;

-- Link city information to NHL teams
SELECT c.id, c.city_name, nhl.id, nhl.team_name, nhl.win, nhl.loss, nhl.tie, nhl.win_percent
FROM cities as c
JOIN nhl ON nhl.city_id = c.id;

-- Rank cities by best win percentage
SELECT 
	c.id, c.city_name, 
	mlb_avg.avg as mlb_pct, 
	nba_avg.avg as nba_pct, 
	nfl_avg.avg as nfl_pct,
	nhl_avg.avg as nhl_pct,
	4-num_nulls(mlb_avg.avg, nba_avg.avg, nfl_avg.avg, nhl_avg.avg) AS total_non_nulls,
	(COALESCE(mlb_avg.avg, 0) + COALESCE(nba_avg.avg, 0) + COALESCE(nfl_avg.avg, 0) + COALESCE(nhl_avg.avg, 0))/
		(4-num_nulls(mlb_avg.avg, nba_avg.avg, nfl_avg.avg, nhl_avg.avg)) as cum_win_percent
FROM cities as c
	LEFT JOIN mlb_avg
		ON c.id = mlb_avg.id
	LEFT JOIN nba_avg
		ON c.id = nba_avg.id
	LEFT JOIN nfl_avg
		ON c.id = nfl_avg.id
	LEFT JOIN nhl_avg
	 	ON c.id = nhl_avg.id
WHERE c.id NOT IN (41)
	AND 4-num_nulls(mlb_avg.avg, nba_avg.avg, nfl_avg.avg, nhl_avg.avg) > 0
ORDER BY cum_win_percent DESC

-- Rank cities by best win percentage with teams in all 4 leagues
SELECT 
	c.id, c.city_name, 
	mlb_avg.avg as mlb_pct, 
	nba_avg.avg as nba_pct, 
	nfl_avg.avg as nfl_pct,
	nhl_avg.avg as nhl_pct,
	4-num_nulls(mlb_avg.avg, nba_avg.avg, nfl_avg.avg, nhl_avg.avg) AS total_non_nulls,
	(COALESCE(mlb_avg.avg, 0) + COALESCE(nba_avg.avg, 0) + COALESCE(nfl_avg.avg, 0) + COALESCE(nhl_avg.avg, 0))/
		(4-num_nulls(mlb_avg.avg, nba_avg.avg, nfl_avg.avg, nhl_avg.avg)) as cum_win_percent
FROM cities as c
	LEFT JOIN mlb_avg
		ON c.id = mlb_avg.id
	LEFT JOIN nba_avg
		ON c.id = nba_avg.id
	LEFT JOIN nfl_avg
		ON c.id = nfl_avg.id
	LEFT JOIN nhl_avg
	 	ON c.id = nhl_avg.id
WHERE c.id NOT IN (41)
	AND 4-num_nulls(mlb_avg.avg, nba_avg.avg, nfl_avg.avg, nhl_avg.avg) = 4
ORDER BY cum_win_percent DESC