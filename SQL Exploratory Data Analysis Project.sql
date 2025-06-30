-- EXPLORATORY DATA ANALYSIS

-- AFTER CLEANING THE DATA WE NOW EXPLORE THE DATA AND WITH THE CLEAN DATA WE WILL BE ABLE TO LOOK AT OUR DATA MUCH BETTER AND FIND BETTER INSIGHTS WHILE USING IT
-- WE CAN ALSO FIND ISSUES THAT WE MISSED

SELECT *
FROM layoffs_staging2;

-- we will be working with the total laid off and percentage laid off

-- we can check to see which company laid off the most people and also which companies had the highest percentage of layoffs

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

-- we can also check each company individually and their total layoffs

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

-- we can look at the date range of the layoffs

SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;

-- what industry got hit the most?

SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

-- which country had the most layoffs

SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

-- what year had the most layoffs

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

-- which stages of the companies were most affected

SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

-- we can look at the progression of the layoffs(rolling sum)

SELECT substring(`date`,1,7) AS `MONTH`,SUM(total_laid_off)
FROM layoffs_staging2
WHERE substring(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;

WITH Rolling_Total AS
(
SELECT substring(`date`,1,7) AS `MONTH`,SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE substring(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_off, SUM(total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total
;
-- this shows month by month progression

-- we can look at the companies and how much they were laying off per year
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT company,YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY company ASC;

-- we can rank which years they laid off the most

WITH Company_Year(company, years, total_laid_off) AS
(
SELECT company,YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
)
SELECT *, DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
FROM Company_Year
WHERE years IS NOT NULL
ORDER BY ranking ASC;


-- we can filter the top five companies per year who laid off the most people

WITH Company_Year(company, years, total_laid_off) AS
(
SELECT company,YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
), Company_Year_Ranking AS
(
SELECT *, DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Ranking
WHERE ranking <= 5;





































































































































