SELECT *
FROM PortfolioProject..CovidDeaths
WHERE continent is not null
ORDER BY 3,4

--SELECT *
--FROM PortfolioProject..CovidVaccinations
--ORDER BY 3,4

-- Select data that we are going to be using

SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..CovidDeaths
ORDER By 1,2

-- Looking Total Cases vs Total Death

SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)
FROM PortfolioProject..CovidDeaths
ORDER By 1,2

SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases) * 100  As DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE location like  '%india%'
ORDER By 1,2

-- Looking Total cases Vs Population

SELECT Location, date, Population, total_cases, (total_cases/Population) * 100  As PercentagePopulationInfected
FROM PortfolioProject..CovidDeaths
-- WHERE location like  '%states%'
ORDER By 1,2 

-- Looking at Countries with Highest Infection Rate compared to Population

SELECT Location,  Population, max(total_cases) as HighestInfectionCount, max(total_cases/Population) * 100  
	as PercentagePopulationInfected
FROM PortfolioProject..CovidDeaths
-- WHERE location like  '%states%'
Group By Location, Population
ORDER By PercentagePopulationInfected desc

---Showing countries with Highest Death count per population

SELECT Location,  MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
-- WHERE location like  '%states%'
WHERE continent is not null  /* It will exclude all continents*/
Group By Location, Population
ORDER By TotalDeathCount desc

-- Lets break this down by continent

SELECT Location,  MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
-- WHERE location like  '%states%'
WHERE continent is not null  /* It will exclude all continents*/
Group By Location, Population
ORDER By TotalDeathCount desc