/*
Covid 19 Data Exploration
Skills used: Complex Joins, CTEs, Date Functions, Aggregate Functions, Converting Data Types, Filtering Data.
*/

--Tables with which we'll be working with

SELECT * FROM Project_1..covid_death
ORDER BY location, date;

SELECT * FROM Project_1..covid_vaccination
ORDER BY location, date;


-- Total Deaths vs Total Cases
-- Shows likelihood of dying if you contract covid in your country

Select continent, Location, MAX(total_cases) as total_cases, MAX(CAST(total_deaths as int)) as total_deaths, (MAX(CAST(total_deaths as int))/MAX(total_cases)) * 100
as death_percentage
From Project_1..covid_death
Where continent is not null 
AND Location NOT LIKE 'North Korea'
GROUP BY continent,Location
ORDER BY death_percentage DESC


-- Total Deaths vs Total Cases per date
-- Shows likelihood of dying if you contract covid in your country per date

Select continent, Location, population, date, MAX(total_cases) as total_cases, MAX(CAST(total_deaths as int)) as total_deaths, ROUND((MAX(CAST(total_deaths as int))/MAX(total_cases)) * 100,4)
as death_percentage
From Project_1..covid_death
Where continent is not null 
and Location NOT LIKE 'North Korea'
GROUP BY continent,Location,population,date
ORDER BY continent,location,date;


-- Total Cases vs Population  
-- Shows what percentage of population has contracted covid at least once 

Select continent, Location, population, MAX(total_cases) as total_cases, MAX(total_cases)/MAX(Population)*100 as PercentPopulationInfected
From Project_1..covid_death 
WHERE continent is not null and population is not null 
AND total_cases is not null and Location NOT LIKE 'North Korea'
GROUP BY continent, Location, population
ORDER BY PercentPopulationInfected DESC;


-- Total Cases vs Population per date
-- Shows what percentage of population has contracted covid at least once per date

Select continent, Location, population, date, MAX(total_cases) as total_cases, ROUND(MAX(total_cases)/MAX(Population)*100,4) as PercentPopulationInfected
From Project_1..covid_death 
WHERE continent is not null and population is not null 
and total_cases is not null and Location NOT LIKE 'North Korea'
GROUP BY continent, Location, population, date
ORDER BY continent, location, date;


-- Percent of people alive after infection per location

WITH A as(
Select Location, population, MAX(total_cases) as total_cases, MAX(CAST(total_deaths AS INT)) as total_deaths, MAX(total_cases)-MAX(CAST(total_deaths AS INT))
as People_alive_after_being_infected
From Project_1..covid_death 
WHERE continent is not null and population is not null 
and total_cases is not null
GROUP BY Location, population )
SELECT Location, population, total_cases, total_deaths, People_alive_after_being_infected, People_alive_after_being_infected/total_cases*100 AS Percent_people_alive_after_infected
FROM A
WHERE total_deaths is not null and location not like 'North Korea'
ORDER BY Percent_people_alive_after_infected ASC;


-- Countries with Highest Death Count 

Select continent, Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From project_1..covid_death
Where continent is not null 
Group by continent, Location
order by TotalDeathCount desc


-- GLOBAL NUMBERS

WITH B AS (
SELECT continent, location, population, MAX(total_cases) as total_cases, MAX(CAST(total_deaths as int)) as total_deaths
FROM Project_1..covid_death WHERE continent is not null
GROUP BY continent, location, population
)
SELECT continent, SUM(population) as population, SUM(total_cases) as total_cases, SUM(total_deaths) as total_deaths
FROM B 
GROUP BY continent


--Total death percentage of the world

SELECT MAX(total_cases) AS total_cases, MAX(CAST(total_deaths as int)) as total_death, (MAX(CAST(total_deaths as int))/MAX(total_cases))*100 as death_percentage 
FROM project_1..covid_death
WHERE continent is null and location like 'World';


--Covid_infections_detected_per_month vs Vaccines_administered_per_month for each country Per month/year

SELECT death.continent, death.location, year=DATEPART(YEAR,death.date), month=DATEPART(MONTH,death.date), SUM(death.new_cases) AS covid_infections_detected_per_month
, SUM(CAST(vacc.new_vaccinations AS INT)) AS vaccination_administered_per_month
from
Project_1..covid_death as death
JOIN Project_1..covid_vaccination as vacc
ON death.continent=vacc.continent 
AND death.location=vacc.location 
AND death.date=vacc.date 
WHERE death.continent is not null
GROUP BY death.continent, death.location, DATEPART(YEAR,death.date), DATEPART(MONTH,death.date)
ORDER BY death.continent, death.location, DATEPART(YEAR,death.date), DATEPART(MONTH,death.date);
