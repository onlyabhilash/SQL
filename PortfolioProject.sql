SELECT *
FROM PortfolioProject..CovidDeaths
--WHERE continent is not null
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

SELECT location,  MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
-- WHERE location like  '%states%'
WHERE continent is null  /* It will include all continents*/
Group By location
ORDER By TotalDeathCount desc

-- Showing continents with highest death count per population

SELECT continent,  MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
-- WHERE location like  '%states%'
WHERE continent is not null  /* It will include all continents*/
Group By continent
ORDER By TotalDeathCount desc

-- GLOBAL NUMBERS
SELECT date, SUM(total_cases) as total_cases,SUM(CAST(total_deaths as int)) as total_deaths, (SUM(CAST(total_deaths as int))/SUM(total_cases)) * 100 as DeathPercentage
From PortfolioProject..CovidDeaths
WHERE continent is not null
GROUP BY date
ORDER BY 1,2

SELECT  SUM(total_cases) as total_cases,SUM(CAST(total_deaths as int)) as total_deaths, (SUM(CAST(total_deaths as int))/SUM(total_cases)) * 100 as DeathPercentage
From PortfolioProject..CovidDeaths
WHERE continent is not null
--GROUP BY date
ORDER BY 1,2

--Looking at total population vs Vaccination

SELECT  dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
,SUM(CONVERT(int, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.location , 
dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population) * 100
From PortfolioProject..CovidDeaths as dea
Join PortfolioProject..CovidVaccinations as vac
	on dea.location = vac.location
	and dea.date = dea.date
WHERE dea.continent is not null
ORDER BY 2,3

-- With CTE

with PopvsVac (continent, location, date, population, new_vaccination,RollingPeopleVaccinated)
as
(
SELECT  dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
,SUM(CONVERT(int, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.location , 
dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population) * 100
From PortfolioProject..CovidDeaths as dea
Join PortfolioProject..CovidVaccinations as vac
	on dea.location = vac.location
	and dea.date = dea.date
WHERE dea.continent is not null
--ORDER BY 2,3
)

SELECT *,(RollingPeopleVaccinated/population) *100
FROM PopvsVac

--Temp Table
DROP Table if exists #PercentPopulationVaccinated
CREATE Table #PercentPopulationVaccinated
(
continent nvarchar(255),
location nvarchar(255), 
date DateTime, 
population numeric, 
new_vaccination numeric, 
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentPopulationVaccinated
SELECT  dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
,SUM(CONVERT(int, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.location , 
dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population) * 100
From PortfolioProject..CovidDeaths as dea
Join PortfolioProject..CovidVaccinations as vac
	on dea.location = vac.location
	and dea.date = dea.date
WHERE dea.continent is not null
--ORDER BY 2,3

SELECT *,(RollingPeopleVaccinated/population) *100
FROM #PercentPopulationVaccinated

-- Creating a view to store data for later visualization

Create View PercentPopulationVaccinated as
SELECT  dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
,SUM(CONVERT(int, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.location , 
dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population) * 100
From PortfolioProject..CovidDeaths as dea
Join PortfolioProject..CovidVaccinations as vac
	on dea.location = vac.location
	and dea.date = dea.date
WHERE dea.continent is not null
--ORDER BY 2,3

SELECT *
FROM PercentPopulationVaccinated