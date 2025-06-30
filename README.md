# World Layoffs Analysis

### Project Overview

This project involves cleaning and analyzing a dataset on global tech layoffs using SQL. The objective is to explore, clean and analyze raw data on layoffs across companies, industries and countries to uncover trends and patterns.

### Phase 1: Data Cleaning

The dataset was first cleaned using SQL to ensure reliable analysis. Key steps included:
 - Removing duplicated records
 - Handling null and blank values
 - Standardizing inconsistent entries e.g date formats
 - Dropping irrelevant columns and rows
 - Creating a clean analysis ready table 'layoffs_staging2'

### Phase 2: Exploratory Data Analysis(EDA)

With clean data, SQL queries were used to explore trends and patterns across companies, countries, industries and time.

The questions explored were:
 - Which companies laid off the most employees?
 - Which industries and countries were the most impacted?
 - When did layoffs peak by year and month?
 - Which companies led in layoffs each year?

### Key Insights

 - The largest number of layoffs from a single company was *12,000*, and some companies laid off *100%* of their workforce.
 - The *United States* had the highest total layoffs.
 - The *consumer tech* and industry was the most affected.
 - Layoffs peaked in the year **2022** especially in **November**
 - Rolling totals showed steady increase in layoffs month over month indicating economic stress

### Project files and data source

Layoffs Data: The primary dataset for this analysis is "layoffs.csv" file containing detailed information about the global tech sales

Cleaning queries: `Data Cleaning SQL Project.sql`

EDA queries: `SQL Exploratory Data Analysis Project.sql`

## Tools

**SQL** - MySQL

**Database Tool** - MySQL Workbench

## References
`https://bit.ly/3HHqwcr`












