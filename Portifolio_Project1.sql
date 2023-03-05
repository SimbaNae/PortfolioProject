--SELECT *
--FROM CovidVaccinations$
--order by 3,4

SELECT *
FROM CovidDeaths$
order by 3,4


---select the Data we are going to be using

SELECT location, date, total_cases_per_million, new_cases, total_deaths, population
FROM [Portifolio Poject].dbo.CovidDeaths$
WHERE continent is not NULL
order by 1,2


--looking at the Total Cases vs Total Deaths
--likely wood of dying of you contract covid in your country

SELECT location, date, total_cases_per_million, total_deaths, (total_deaths/total_cases_per_million)*100 as DeathPercentage
FROM [Portifolio Poject].dbo.CovidDeaths$
WHERE continent is not NULL
WHERE location like '%zimbabwe'
order by 1,2



--Total cases vs the Population
--What % of the Population has got Covid
SELECT location, date, Population, total_cases_per_million, (total_cases_per_million/population)*100 as DeathPercentage
FROM [Portifolio Poject].dbo.CovidDeaths$
WHERE continent is not NULL
--WHERE location like '%states'
order by 1,2


--What countries have th highest infection rate compared to Populations
SELECT location, Population,MAX(total_cases_per_million) as HighestInfectionCount, Max((total_cases_per_million/population))*100 as PercentagePopulationInfected
FROM [Portifolio Poject].dbo.CovidDeaths$
WHERE continent is not NULL
--WHERE location like '%states'
Group by location, Population
order by PercentagePopulationInfected desc

--Showing countries with the Highest Death count per Population
SELECT location, MAX(cast(Total_deaths as int)) as TotalDeathCount
FROM [Portifolio Poject].dbo.CovidDeaths$
WHERE continent is not NULL
Group by location
order by TotalDeathcount desc

--Breakdown by Continent
SELECT location, MAX(cast(Total_deaths as int)) as TotalDeathCount
FROM [Portifolio Poject].dbo.CovidDeaths$
WHERE continent is NULL
Group by location
order by TotalDeathcount desc


-- Global Numbers
SELECT date, SUM(new_cases), SUM(cast(new_deaths as int))/SUM(new_cases) as DeathPercentage
FROM [Portifolio Poject].dbo.CovidDeaths$
WHERE continent is not NULL
GROUP BY DATE
order by 1,2


---Covid Vaccinations
SELECT *
FROM [Portifolio Poject].dbo.CovidVaccinations$
order by 3,4


--TOTAL Population VS Vaccinations
SELECT *
FROM [Portifolio Poject].dbo.CovidVaccinations$ VAC
JOIN [Portifolio Poject].dbo.CovidDeaths$ Dea
ON Vac.location = dea.location
AND vac.date = dea.date

SELECT dea.continent, dea.location, dea.date, dea.population
FROM [Portifolio Poject].dbo.CovidVaccinations$ VAC
JOIN [Portifolio Poject].dbo.CovidDeaths$ Dea
ON Vac.location = dea.location
AND vac.date = dea.date
order by 1,2,3

