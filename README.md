# Covid-19-Exploratory-Data-Analysis-Using-SQL
  

### Tools Used - Microsoft SQL server, Tableau, MS Excel.
### SQL Skills used: Complex Joins, CTEs(Common Table Expressions), Date Functions, Aggregate Functions, Converting Data Types, Filtering Data and many more.


## Project Overview
In this project we use SQL to analyse Covid-19 data of about 3 years to answer insightful questions like what is the likelihood of dying if you contract covid in your country, what percentage of population contracted covid at least once in your country etc.

## Following steps were followed for analysis and visualisation:

### 1.Understanding the dataset  
Data source link - https://ourworldindata.org/covid-deaths  
The dataset contains total number of cases, vaccinations and deaths broken down by continent, country, date etc.  
There are two datasets, covid_death_table which contains data about cases, deaths etc and covid_vaccination_table which contains data about vaccinations, tests etc.

### 2.Data cleaning
In the dataset there were no duplicate values and the null values were used to depict the time when there were no cases or no vaccinations(a great time indeed).

### 3.Data exploration
In this section we explore insightful question related to our data set and those are as follows:

* What is the correlation between Covid infections detected per month and Vaccinations administered per country per month?  
* What is the likelihood of dying if you contract covid in your country?  
* What is the percentage of population that has contracted covid at least once per country?  
* What percentage of people are alive after contracting covid per country?  
* Which countries have the highest death count?  
* What is the total death percentage of the world?  


### 4.Data visualisation
In this section we visualise our findings using Tableau. Following are the link to Covid-19 dashboard and other visualisation:

a.https://public.tableau.com/app/profile/rohit.rawat17/viz/Covid_Cases_Breakdown/Dashboard1  

![Screenshot (75)](https://user-images.githubusercontent.com/105176764/208199759-ecd05a4a-e4a7-4940-b79f-b1bbdd79e8e1.png)

b.https://public.tableau.com/app/profile/rohit.rawat17/viz/VaccinationsadministeredVsCovidInfectionsDetected/Sheet1  

![Vaccines_administered_vs_Covid_infections_detected](https://user-images.githubusercontent.com/105176764/208199807-682adda3-3838-41cf-a28f-ed8d5532bf9f.png)

