# ETL_Project - Pro Sports by City 

## Proposal 

We decided to investigate the wins, losses, ties, and win percentage for the four major sport leagues: NBA, NFL, NHL, and MBA.  We also gather information from the US Census on the population of major cities in 2010, the last year of the census.  We gathered data on all the sport leagues for 2010 as well, to combine information on the cities the teams are in.  

## Data 

After deciding to use city population data along with the sports data, we picked 2010 as that is the last year of the US Census with information on all cities.  Then, we found data for the sport leagues for the same year.  Here are links to the data sources we used: 
https://www.sports-reference.com/ 	
https://www.baseball-reference.com/leagues/MLB/2010.shtml 
https://www.hockey-reference.com/leagues/NHL_2010.html 
https://www.basketball-reference.com/leagues/NBA_2010.html
https://www.pro-football-reference.com/years/2009/
https://www.census.gov/programs-surveys/decennial-census/data/datasets.2010.html

## Cleaning the Data 
Each data set had to be formatted into a usable format and Excel and Python were used to clean the data, complete necessary calculations, and generate the foreign keys necessary for the relational database, explained below. 

### Census Data 
Using the Census data as a base, we extracted the city name, state name, and population of the city.  Then, we added a column to create a unique identify/primary key for the cities.  This will be later used as a foreign key to connect each sports team to the city it resides in. 

### NBA Data

### MLB Data 
MLB data was extracted from the website to include the sports name, city, wins, losses, and ties.  Then the win-percentage was calculated for each team.  From there, the Census data and MLB data were loaded into a Jupyter notebook.  We created an incremental row to add a primary key to the MLB data. We created a dictionary in which the city name was the key and the primary key in the city table was the value.  Then, going row by row, the foreign key was added to the dataframe.  We dropped the city column so that the only connected to the city was through the primary/foreign key connection.  This was then extracted as a CSV to use later in loading the data to PostgreSQL. 

### NFL Data 

### NHL Data 
NHL data followed the exact pattern as the MLB data listed above.  To summarize, the win percentage was calculated, a primary key was added, and the city was connected to the primary key in the city table to use as a foreign key in the NHL table.  Lastly, it was extracted as a CSV to use in the database. 


## Database Work - PostgreSQL 
As mentioned above, the city table has a primary key that is used as a foreign key in the sports teams tables.  After seeing the data columns, we generated an ERD to use in creation of the schema in PostgreSQL.  This ERD photo is located in the repo.  This ERD shows columns of each table and the foreign key reference to the city table. 


This ERD was used in creation of the schema in PostgreSQL.  The schema creation for the database and tables and the connection of the foreign key is located in the repo. 


After creating the schema, we loaded the data into the tables.  The city data had to be entered FIRST because of the foreign key connection to it in the other tables. 

## Successful Database - Tested by Queries 
We tested our database by completing queries to connect sports teams information with the city information.  The connection of the keys was successful and the success is showcased by queries included in the repo. 

## Conclusions, Key Findings, and Insights to our ETL Project 
We enjoyed working on the ETL project to see the completion of finding data, cleaning data, updating data columns, and loading this data into a useable database to complete analysis.  It was cool to see a full picture and combine different elements of the program. 
