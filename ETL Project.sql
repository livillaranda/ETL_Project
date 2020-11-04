CREATE TABLE "cities" (
  "id" int PRIMARY KEY,
  "city_name" varchar,
  "state_name" varchar,
  "population" int
);

CREATE TABLE "mlb" (
  "id" int PRIMARY KEY,
  "team_name" varchar,
  "city_name" varchar,
  "wins_in_2010" int,
  "losses_in_2010" int,
  "ties_in_2010" int,
  "winning_percent" float,
  "city_id" int
);

CREATE TABLE "nfl" (
  "id" int PRIMARY KEY,
  "team_name" varchar,
  "city_name" varchar,
  "wins_in_2010" int,
  "losses_in_2010" int,
  "ties_in_2010" int,
  "winning_percent" float,
  "city_id" int
);

CREATE TABLE "nba" (
  "id" int PRIMARY KEY,
  "team_name" varchar,
  "city_name" varchar,
  "wins_in_2010" int,
  "losses_in_2010" int,
  "ties_in_2010" int,
  "winning_percent" float,
  "city_id" int
);

CREATE TABLE "nhl" (
  "id" int PRIMARY KEY,
  "team_name" varchar,
  "city_name" varchar,
  "wins_in_2010" int,
  "losses_in_2010" int,
  "ties_in_2010" int,
  "winning_percent" float,
  "city_id" int
);

ALTER TABLE "mlb" ADD FOREIGN KEY ("city_id") REFERENCES "cities" ("id");

ALTER TABLE "nfl" ADD FOREIGN KEY ("city_id") REFERENCES "cities" ("id");

ALTER TABLE "nba" ADD FOREIGN KEY ("city_id") REFERENCES "cities" ("id");

ALTER TABLE "nhl" ADD FOREIGN KEY ("city_id") REFERENCES "cities" ("id");
