-- Q1. Write a code to check NULL values
	SELECT * FROM project
	WHERE PROVINCE is null
	OR COUNTRY/REGION is null
	OR  LATITUDE IS NULL
	OR LONGITUDE IS NULL
	OR DATE IS NULL
	OR CONFIRMED IS NULL
	OR DEATHS IS NULL
	OR RECOVERED IS NULL;

USE `corona virus`;

-- Q2. If NULL values are present, update them with zeros for all columns. 

UPDATE project                                                                             
SET 
Province = COALESCE(Province,0),
`Country/Region` = COALESCE(`Country/Region`,0),
Latitude = COALESCE(Latitude,0),
Longitude = COALESCE(Longitude,0),
Date = COALESCE(Date,0),
Confirmed = COALESCE(Confirmed,0),
Deaths = COALESCE(Deaths,0),
Recovered= COALESCE(Recovered,0)
WHERE 
Province IS NULL
 OR `Country/Region` IS NULL 
 OR Latitude IS NULL
 OR Longitude IS NULL
OR Date IS NULL 
OR Confirmed IS NULL
OR Deaths IS NULL
OR Recovered IS NULL;



-- Q3. check total number of rows
SELECT COUNT(*) FROM project 
AS NUMBER_OF_ROWS;


-- Q4. check total number of columns
SELECT count(*) FROM information_schema.columns
WHERE TABLE_SCHEMA='corona virus' AND TABLE_NAME='project';


-- Q5. Check what is start_date and end_date
SELECT MIN(DATE) AS START_DATE, MAX(DATE) AS END_DATE FROM project;


-- Q5. Number of month present in dataset
SELECT COUNT(DISTINCT MONTH(date)) AS num_of_months
FROM project;

-- Q6. Find monthly average for confirmed, deaths, recovered
-- Average confirmed
SELECT MONTH(Date) AS Month,
       YEAR(Date) AS Year,
       AVG(Confirmed) AS AvgConfirmed
FROM project
GROUP BY YEAR(Date), MONTH(Date);

-- Average deaths
SELECT MONTH(Date) AS Month,
       YEAR(Date) AS Year,
       AVG(Deaths) AS AvgDeaths
FROM project
GROUP BY YEAR(Date), MONTH(Date);

-- Average recovered
SELECT MONTH(Date) AS Month,
       YEAR(Date) AS Year,
       AVG(Recovered) AS AvgRecovered
FROM project
GROUP BY YEAR(Date), MONTH(Date);

-- Q7. Find most frequent value for confirmed, deaths, recovered each month 
-- Most frequent confirmed cases
SELECT MONTH(Date) AS Month,
       YEAR(Date) AS Year,
       MAX(Confirmed) AS MostFrequentConfirmed
FROM project
GROUP BY YEAR(Date), MONTH(Date);

-- Most frequent deaths
SELECT MONTH(Date) AS Month,
       YEAR(Date) AS Year,
       MAX(Deaths) AS MostFrequentDeaths
FROM project
GROUP BY YEAR(Date), MONTH(Date);

-- Most frequent recovered cases
SELECT MONTH(Date) AS Month,
       YEAR(Date) AS Year,
       MAX(Recovered) AS MostFrequentRecovered
FROM project
GROUP BY YEAR(Date), MONTH(Date);

-- Q8. Find minimum values for confirmed, deaths, recovered per year
SELECT YEAR(Date) AS Year,
       MIN(Confirmed) AS MinConfirmed,
       MIN(Deaths) AS MinDeaths,
       MIN(Recovered) AS MinRecovered
FROM project
GROUP BY YEAR(Date);

-- Q9. Find maximum values of confirmed, deaths, recovered per year
SELECT YEAR(DATE) AS YEAR,
MAX(CONFIRMED) AS MAXCONFIRMED,
MAX(DEATHS) AS MAXDEATHS,
MAX(RECOVERED) AS MAXRECOVERED
FROM project
GROUP BY YEAR(DATE);

-- Q10. The total number of case of confirmed, deaths, recovered each month..
SELECT YEAR(Date) AS Year,
       MONTH(Date) AS Month,
       SUM(Confirmed) AS TotalConfirmed,
       SUM(Deaths) AS TotalDeaths,
       SUM(Recovered) AS TotalRecovered
FROM 	project
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year, Month;

-- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT
    SUM(Confirmed) AS TotalConfirmed,
    AVG(Confirmed) AS AvgConfirmed,
    VARIANCE(Confirmed) AS ConfirmedVariance,
    SQRT(VARIANCE(Confirmed)) AS ConfirmedStDev
FROM project;

-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
SUM(DEATHS) AS TOTALDEATHS,
AVG(DEATHS) AS AVERAGEDEATHS,
VARIANCE(DEATHS) AS DEATHSVARIANNCE,
Sqrt(VARIANCE(DEATHS)) AS DEATHSSTDEV
FROM project;

-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
SUM(RECOVERED) AS TOTALRECOVERED,
avg(RECOVERED) AS AVERAGERECOVERED,
VARIANCE(RECOVERED) AS RECOVEREDVARIANCE,
sqrt(VARIANCE(RECOVERED)) AS RECOVEREDSTDEV
FROM project;

-- Q14. Find Country having highest number of the Confirmed case
	SELECT
		`country/region`,
		MAX(confirmed) AS highest_confirmed_cases
	FROM project
	GROUP BY `country/region`
	ORDER BY highest_confirmed_cases DESC;

-- Q15. Find Country having lowest number of the death case
SELECT `country/region`,
MIN(DEATHS) AS LOWEST_DEATHS_CASES
FROM project
GROUP BY `country/region`
ORDER BY LOWEST_DEATHS_CASES DESC;

-- Q16. Find top 5 countries having highest recovered case
SELECT `COUNTRY/REGION`,
MAX(RECOVERED)AS HIGHEST_RECOVERED_CASES
FROM project
GROUP BY `COUNTRY/REGION`
ORDER BY HIGHEST_RECOVERED_CASES DESC
LIMIT 5;














